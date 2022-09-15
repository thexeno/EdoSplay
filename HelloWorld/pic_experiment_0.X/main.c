/*
 * File:   main.c
 * Author: eso
 *
 * Created on 7. avril 2022, 09:55
 */

#include "uconf.h"

typedef enum
{
  SEQ_NOT_FIRST = 0U,
  SEQ_FIRST = 1U,
  SEQ_SHOW_FIRST_FRAME = 2U
} sequence_t;

typedef enum
{
  CHAR_LAST = 0U,
  CHAR_NOT_LAST = 2U
} order_char_t;

#define MAX7219_ADX_SD 0x0C00
#define MAX7219_SD_TURN_ON (MAX7219_ADX_SD | 0x0001)
#define MAX7219_SD_TURN_OFF (MAX7219_ADX_SD | 0x0000)

#define MAX7219_ADX_INT 0x0A00
#define MAX7219_INT(x) (MAX7219_ADX_INT | ((uint16_t)x & 0x00FF))

#define MAX7219_ADX_SCAN_LIM 0x0B00
#define MAX7219_SCAN_LIM_MAX (MAX7219_ADX_SCAN_LIM | 0x0007)

#define MAX7219_ADX_DEC_MODE 0x0900
#define MAX7219_DEC_MODE_NO_DEC (MAX7219_ADX_DEC_MODE | 0x0000)

#define MAX7219_ADX_DIG0 0x0100
#define MAX7219_ADX_DIG1 0x0200
#define MAX7219_ADX_DIG2 0x0300
#define MAX7219_ADX_DIG3 0x0400
#define MAX7219_ADX_DIG4 0x0500
#define MAX7219_ADX_DIG5 0x0600
#define MAX7219_ADX_DIG6 0x0700
#define MAX7219_ADX_DIG7 0x0800

#define MAX7219_HALF_DISP_WIDTH 4
#define MAX7219_NUM_MAP 17
#define APP_MAX_CHARS 5

void bb_spi_write_reg16(uint16_t data);
void max7219_send_raw(uint8_t *data, uint8_t pos);
// static uint8_t* loc_seq[APP_MAX_CHARS+4]; // 4 is the pre emptz shift, and the post emtpy shift
static uint8_t loc_seq[APP_MAX_CHARS][MAX7219_HALF_DISP_WIDTH]; // 4 is the pre emptz shift, and the post emtpy shift

/* DATA in array ROTATED CLOCKWISE 90° */

const uint8_t max7219_blank_map_dotmtx_half[1][MAX7219_HALF_DISP_WIDTH] = {
    {0b00000000, // seg0-7, aka dig0
     0b00000000, // seg0-7, aka dig1
     0b00000000,
     0b00000000}};

const uint8_t max7219_custom_map_dotmtx_half[MAX7219_NUM_MAP][MAX7219_HALF_DISP_WIDTH] = {
    /* c */
    {0b01111110, // seg0-7, aka dig0
     0b10000001, // seg0-7, aka dig1
     0b10000001,
     0b01000010},
    /* i */
    {0b00000000,
     0b10001000, // seg0-7, aka dig1
     0b11111011, // seg0-7, aka dig0,
     0b10000000},
    /* a */
    {0b01100100, // seg0-7, aka dig0
     0b10010010, // seg0-7, aka dig1
     0b10010010,
     0b11111100},
    /* o */
    {0b01111000, // seg0-7, aka dig0
     0b10000100, // seg0-7, aka dig1
     0b10000100,
     0b01111000},
    /* E */
    {0b11111111, // seg0-7, aka dig0
     0b10001001, // seg0-7, aka dig1
     0b10001001,
     0b10000001},
    /* d */
    {0b01100000, // seg0-7, aka dig0
     0b10010000, // seg0-7, aka dig1
     0b10010000,
     0b11111110},
    /* ! */
    {0b00000000, // seg0-7, aka dig0
     0b00001111, // seg0-7, aka dig1
     0b10111111,
     0b00000011},
    /* A */
    {0b00110000, // seg0-7, aka dig0
     0b01100010, // seg0-7, aka dig1
     0b11100110,
     0b11100000},
    /* B */
    {0b11100000, // seg0-7, aka dig0
     0b11100010, // seg0-7, aka dig1
     0b01100110,
     0b00110000},
    /* C */
    {0b00000000, // seg0-7, aka dig0
     0b00000000, // seg0-7, aka dig1
     0b01000100,
     0b01000000},
    /* D */
    {0b01000000, // seg0-7, aka dig0
     0b01000100, // seg0-7, aka dig1
     0b00000000,
     0b00000000},
    /* E */
    {0b00000000, // seg0-7, aka dig0
     0b00010000, // seg0-7, aka dig1
     0b00100110,
     0b01000000},
    /* F */
    {0b01000000, // seg0-7, aka dig0
     0b00100110, // seg0-7, aka dig1
     0b00010000,
     0b00000000},
    /* G */
    {0b00000000, // seg0-7, aka dig0
     0b00010110, // seg0-7, aka dig1
     0b00100110,
     0b01100000},
    /* H */
    {0b01100000, // seg0-7, aka dig0
     0b00100110, // seg0-7, aka dig1
     0b00010110,
     0b00000000},
    /* I */
    {0b00100110, // seg0-7, aka dig0
     0b01101001, // seg0-7, aka dig1
     0b11101001,
     0b11100110},
    /* L */
    {0b11100110, // seg0-7, aka dig0
     0b11101001, // seg0-7, aka dig1
     0b01101001,
     0b00100110}};

/* NB this works ONLY WITH NUMBERS - JUST FOR TEST */
static void max7219_init(void)
{

  /* adx 1 to 8 are the 8 digits */

  /*   D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0
       X   X   X   X   AD D R E S S  MSB     DATA        LSB
   */

  uint16_t data = 0;
  bb_spi_write_reg16(MAX7219_SD_TURN_ON);      // turn on
  bb_spi_write_reg16(MAX7219_INT(0x00));       // mid intensity
  bb_spi_write_reg16(MAX7219_SCAN_LIM_MAX);    // use all segments/pixels
  bb_spi_write_reg16(MAX7219_DEC_MODE_NO_DEC); // no decode, direct bit output
}

void max7219_show_frame(void)
{
  max7219_send_raw(loc_seq[2], 0);
  max7219_send_raw(loc_seq[3], 1);
}

void max7219_prepare_string(uint8_t *p, uint8_t n, sequence_t isFirst)
{
  // n has to be < than APP_MAX_CHARS -> no check, save memory :P
  uint8_t i = 0, offset = 0;
  uint8_t *buff_pt;
  if (isFirst == SEQ_FIRST || isFirst == SEQ_NOT_FIRST)
  {
    // preload with empty char to make write appear at beginning,
    // is a nicer effect
    i = 2;
    offset = 2;
  }
  else if (isFirst == SEQ_SHOW_FIRST_FRAME)
  {
    i = 0;
    offset = 0;
  }
  else
  {
  }

  // uint8_t *p = (uint8_t*)str;
  for (; i < n + offset; i++)
  {
    switch (*(p + i - offset))
    {
    case 'c':
      buff_pt = max7219_custom_map_dotmtx_half[0];
      break;
    case 'i':
      buff_pt = max7219_custom_map_dotmtx_half[1];
      break;
    case 'a':
      buff_pt = max7219_custom_map_dotmtx_half[2];
      break;
    case 'o':
      buff_pt = max7219_custom_map_dotmtx_half[3];
      break;
    case 'e':
      buff_pt = max7219_custom_map_dotmtx_half[4];
      break;
    case 'd':
      buff_pt = max7219_custom_map_dotmtx_half[5];
      break;
    case '!':
      buff_pt = max7219_custom_map_dotmtx_half[6];
      break;
    case 'A':
      buff_pt = max7219_custom_map_dotmtx_half[7];
      break;
    case 'B':
      buff_pt = max7219_custom_map_dotmtx_half[8];
      break;
    case 'C':
      buff_pt = max7219_custom_map_dotmtx_half[9];
      break;
    case 'D':
      buff_pt = max7219_custom_map_dotmtx_half[10];
      break;
    case 'E':
      buff_pt = max7219_custom_map_dotmtx_half[11];
      break;
    case 'F':
      buff_pt = max7219_custom_map_dotmtx_half[12];
      break;
    case 'G':
      buff_pt = max7219_custom_map_dotmtx_half[13];
      break;
    case 'H':
      buff_pt = max7219_custom_map_dotmtx_half[14];
      break;
    case 'I':
      buff_pt = max7219_custom_map_dotmtx_half[15];
      break;
    case 'L':
      buff_pt = max7219_custom_map_dotmtx_half[16];
      break;
    default:
      break;
    }

    GPIO_uHAL_TOGGLE(GPIO_uHAL_PIN5);

    // buff_pt = max7219_num_map_dotmtx_half[0]
    /*
     loc_seq[i][0] = max7219_num_map_dotmtx_half[i-2][0];
     loc_seq[i][1] = max7219_num_map_dotmtx_half[i-2][1];
     loc_seq[i][2] = max7219_num_map_dotmtx_half[i-2][2];
     loc_seq[i][3] = max7219_num_map_dotmtx_half[i-2][3];
     */
    loc_seq[i][0] = buff_pt[0];
    loc_seq[i][1] = buff_pt[1];
    loc_seq[i][2] = buff_pt[2];
    loc_seq[i][3] = buff_pt[3];
  }
  // test
  // init the first 2 blanks
  if (isFirst == SEQ_FIRST)
  {
    loc_seq[0][0] = 0; // max7219_blank_map_dotmtx_half[0][0];
    loc_seq[0][1] = 0; // max7219_blank_map_dotmtx_half[0][0];
    loc_seq[0][2] = 0; // max7219_blank_map_dotmtx_half[0][0];
    loc_seq[0][3] = 0; // max7219_blank_map_dotmtx_half[0][0];
    loc_seq[1][0] = 0; // max7219_blank_map_dotmtx_half[0][0];
    loc_seq[1][1] = 0; // max7219_blank_map_dotmtx_half[0][0];
    loc_seq[1][2] = 0; // max7219_blank_map_dotmtx_half[0][0];
    loc_seq[1][3] = 0; // max7219_blank_map_dotmtx_half[0][0];
  }
}

static void loc_segment_scroll(uint8_t nchar, order_char_t not_last) //, uint8_t n, const uint8_t *pt1, uint8_t n1)
{
  for (uint8_t i = 0; i < (4 * (nchar + not_last)) + 1; i++)
  {
    max7219_send_raw(loc_seq[0], 0);
    max7219_send_raw(loc_seq[1], 1);
    // shift ALL

    for (uint8_t j = 0; j < nchar + 2; j++)
    {
      loc_seq[j][0] = loc_seq[j][1];
      loc_seq[j][1] = loc_seq[j][2];
      loc_seq[j][2] = loc_seq[j][3];
      if (j + 1 == nchar + 2)
      {
        loc_seq[j][3] = 0;
      }
      else
      {
        loc_seq[j][3] = loc_seq[j + 1][0];
      }
    }

    GPIO_uHAL_TOGGLE(GPIO_uHAL_PIN5);
    __delay_ms(100);
    // the last char will remain in the tail, and after all is shifted, only the last char remain in all the array -> you can make a draw!
  }
  //  https://technotip.com/8964/c-program-to-shift-elements-of-an-array-by-n-position/
}

void max7219_send_raw(uint8_t *data, uint8_t pos)
{
  uint16_t dig = MAX7219_ADX_DIG0;
  if (pos != 0)
  {
    dig = MAX7219_ADX_DIG4;
  }
  for (uint16_t dig_incr = 0; dig_incr < MAX7219_HALF_DISP_WIDTH; dig_incr++)
  {
    bb_spi_write_reg16((dig + (dig_incr << 8)) | (data[dig_incr]));
  }
}

/* Pensieri sull'ITALIA: In arrivo in anticipo alla stazione, ma poi si aspetta per entrare... LOL e si arriva un minuto in ritardo */

void main(void)
{
  uint8_t sequence[4], i, j;
  const uint8_t animation[10] = "ABCDEFGHIL";
    GPIO_uHAL_CONF(GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_IN, GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_OUT,
                   GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_LOW, GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_HIGH);
  CMCON = 0xff;

  max7219_init();

  while (1)
  {
    sequence[0] = 'c';
    sequence[1] = 'i';
    sequence[2] = 'a';
    sequence[3] = 'o';
    max7219_prepare_string(sequence, 4, SEQ_FIRST);
    loc_segment_scroll(4, CHAR_NOT_LAST);
    sequence[0] = 'G';
    sequence[1] = 'H';
    sequence[2] = 'I';
    sequence[3] = 'L';
    max7219_prepare_string(sequence, 4, SEQ_NOT_FIRST);
    loc_segment_scroll(4, CHAR_LAST);
    __delay_ms(500);
    for (j = 0; j < 5; j++)
    {
    for(i=0; i<=8;i=i+2)
    {
      sequence[0] = animation[i];
      sequence[1] = animation[i+1];
      max7219_prepare_string(sequence, 4, SEQ_FIRST);
      max7219_show_frame();
      __delay_ms(100);
    }
    }

    max7219_prepare_string(animation, 4, SEQ_FIRST);
    max7219_show_frame();
    for (j = 0; j < 20; j++)
    {

      for (j = 0; j < 20; j++)
      {
        for (i = 0; i < 0x0F; i++)
        {
          bb_spi_write_reg16(MAX7219_INT(i));
          __delay_ms(10);
        }
        for (i = 0x0f; i > 0x00; i--)
        {
          bb_spi_write_reg16(MAX7219_INT(i));
          __delay_ms(10);
        }
      }

      __delay_ms(1000);

      // max7219_init();
      // bb_spi_write_reg16(0x0003);
      // max7219_send_single_digit(sequence[i++], 0);
      // if (i>=2) i = 0;
      // max7219_scroll_seq_num_bydigit(sequence, 2);
    };
  }
  return;
}

// INCLUDES ***********************************************

void bb_spi_write_reg16(uint16_t data)
{
  unsigned char SPICount;  // Counter used to clock out the data
  uint16_t SPIData = data; //(uint16_t)regData & (uint16_t)((regData & 0x0f)<<8);                                    // Preload the data to be sent with Address & Data

  GPIO_uHAL_RESET(SWSPI_nCS);   // Make sure we start with /CS high - low on max7219
  GPIO_uHAL_RESET(SWSPI_CLK); // and CK low
  GPIO_uHAL_RESET(SWSPI_nCS);
  for (SPICount = 0; SPICount < 16; SPICount++) // Prepare to clock out the Address & Data
  {
    if ((SPIData & 0x8000) == 0x8000)
    {
      GPIO_uHAL_SET(SWSPI_MOSI);
    }
    else
    {
      GPIO_uHAL_RESET(SWSPI_MOSI);
    }
    GPIO_uHAL_RESET(SWSPI_CLK);
    __delay_us(18);
    GPIO_uHAL_SET(SWSPI_CLK);
    __delay_us(1);
    SPIData = SPIData << 1;
  }                            // and loop back to send the next bit
  GPIO_uHAL_RESET(SWSPI_MOSI); // Reset the MOSI data line

  GPIO_uHAL_RESET(SWSPI_CLK); // and CK low
  __delay_us(1);
  GPIO_uHAL_SET(SWSPI_nCS); // Make sure we finish with /CS high (LOAD) to latch data

}

#if 0

/**************************************************************************************
 * spiReadReg
 *
 * Reads an 8-bit register with the SPI port.
 * Data is returned. 
 **************************************************************************************/

unsigned char bb_spi_read_reg16(const unsigned char regAddr) {

    unsigned char SPICount; // Counter used to clock out the data
    unsigned char SPIData;

    GPIO_uHAL_SET(SWSPI_nCS); // Make sure we start with /CS high
    GPIO_uHAL_RESET(SWSPI_CLK); // and CK low
    SPIData = regAddr; // Preload the data to be sent with Address & Data

    GPIO_uHAL_RESET(SWSPI_nCS); // Set /CS low to start the SPI cycle
    for (SPICount = 0; SPICount < 8; SPICount++) // Prepare to clock out the Address & Data
    {
        if (SPIData & 0x80)
            GPIO_uHAL_SET(SWSPI_MOSI);
        else
            GPIO_uHAL_RESET(SWSPI_MOSI);
        GPIO_uHAL_SET(SWSPI_CLK);
        GPIO_uHAL_RESET(SWSPI_CLK);
        SPIData <<= 1;
    } // and loop back to send the next bit   
    GPIO_uHAL_RESET(SWSPI_MOSI); // Reset the MOSI data line

    SPIData = 0;
    for (SPICount = 0; SPICount < 8; SPICount++) // Prepare to clock in the data to be fread
    {
        SPIData <<= 1; // Rotate the data
        GPIO_uHAL_SET(SWSPI_CLK); // Raise the clock to clock the data out of the MAX7456
        SPIData += (uint8_t) GPIO_uHAL_READ_BOOL(SWSPI_MISO); // Read the data bit
        GPIO_uHAL_RESET(SWSPI_CLK); // Drop the clock ready for th enext bit
    } // and loop back
    GPIO_uHAL_SET(SWSPI_nCS); // Raise CS   

    return ((unsigned char) SPIData); // Finally return the read data
}

#endif
