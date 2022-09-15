/*
 * File:   main.c
 * Author: eso
 *
 * Created on 7. avril 2022, 09:55
 */

#include "uconf.h"
#include <xc.h>
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
#define MAX7219_NUM_MAP 12
#define APP_MAX_CHARS 4

void bb_spi_write_reg16(uint16_t data);
void max7219_send_raw(uint8_t *data, uint8_t pos);
// static uint8_t* loc_seq[APP_MAX_CHARS+4]; // 4 is the pre emptz shift, and the post emtpy shift
static uint8_t loc_seq[APP_MAX_CHARS][MAX7219_HALF_DISP_WIDTH]; // 4 is the pre emptz shift, and the post emtpy shift
uint8_t sequence[2];
uint8_t inc = 0;

struct rtc_data
{
  unsigned second : 6;
  unsigned minute : 6;
  unsigned hour : 6;
  unsigned halfTick : 1;
};

typedef union
{
  struct rtc_data rtcUnion;
} rtc_t;

rtc_t rtcDataSet;

/* DATA in array ROTATED CLOCKWISE 90° */

const uint8_t max7219_custom_map_dotmtx_half[MAX7219_NUM_MAP][MAX7219_HALF_DISP_WIDTH] = {
    /* 0 */
    {0b00000000, // seg0-7, aka dig0
     0b11111111, // seg0-7, aka dig1
     0b10000001,
     0b11111111},
    /* 1 */
    {0b00000000,
     0b10000010, // seg0-7, aka dig1
     0b11111111, // seg0-7, aka dig0,
     0b10000000},
    /* a */
    {0b00000000, // seg0-7, aka dig0
     0b11111001, // seg0-7, aka dig1
     0b10001001,
     0b10001111},
    /* o */
    {0b00000000, // seg0-7, aka dig0
     0b10001001, // seg0-7, aka dig1
     0b10001001,
     0b11111111},
    /* E */
    {0b00000000, // seg0-7, aka dig0
     0b00001111, // seg0-7, aka dig1
     0b00001000,
     0b11111111},
    /* d */
    {0b00000000, // seg0-7, aka dig0
     0b10001111, // seg0-7, aka dig1
     0b10001001,
     0b11111001},
    /* ! */
    {0b00000000, // seg0-7, aka dig0
     0b11111111, // seg0-7, aka dig1
     0b10001001,
     0b11111001},
    /* A */
    {0b00000000, // seg0-7, aka dig0
     0b11100001, // seg0-7, aka dig1
     0b00010001,
     0b00001111},
    /* B */
    {0b00000000, // seg0-7, aka dig0
     0b11111111, // seg0-7, aka dig1
     0b10001001,
     0b11111111},
    /* C */
    {0b00000000, // seg0-7, aka dig0
     0b10001111, // seg0-7, aka dig1
     0b10001001,
     0b11111111},

    {0b00000000, // seg0-7, aka dig0
     0b00000000, // seg0-7, aka dig1
     0b00000000,
     0b01100110},

    {0b01100110, // seg0-7, aka dig0
     0b00000000, // seg0-7, aka dig1
     0b00000000,
     0b00000000}
    /* D */
};

void __interrupt() ISR_handler(void)
{
  // GPIO_uHAL_TOGGLE(GPIO_uHAL_PIN5);

  if (PIR1bits.TMR1IF)
  {
    PIR1bits.TMR1IF = 0;
    // here no double buffering, unlike the DS1307 emulator
    if (!rtcDataSet.rtcUnion.halfTick)
    {
      // GPIO_uHAL_TOGGLE(GPIO_uHAL_PIN5);
      rtcDataSet.rtcUnion.halfTick++;
      /* Primary tick -> execute handler */
      if ((++rtcDataSet.rtcUnion.second) > 59)
      {
        rtcDataSet.rtcUnion.second = 0;
        if ((++rtcDataSet.rtcUnion.minute) > 59)
        {
          rtcDataSet.rtcUnion.minute = 0;
          /* 0-24 */
          if ((++rtcDataSet.rtcUnion.hour) > 23)
          {
            rtcDataSet.rtcUnion.hour = 0;
          }
        }
      }
    }
    else
    {
      rtcDataSet.rtcUnion.halfTick++;
    }
  }
  return;
}

/* NB this works ONLY WITH NUMBERS - JUST FOR TEST */
static void max7219_init(void)
{

  /* adx 1 to 8 are the 8 digits */

  /*   D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0
       X   X   X   X   AD D R E S S  MSB     DATA        LSB
   */

  bb_spi_write_reg16(MAX7219_SD_TURN_ON);      // turn on
  bb_spi_write_reg16(MAX7219_INT(0x08));       // mid intensity
  bb_spi_write_reg16(MAX7219_SCAN_LIM_MAX);    // use all segments/pixels
  bb_spi_write_reg16(MAX7219_DEC_MODE_NO_DEC); // no decode, direct bit output
}

void max7219_show_frame(void)
{
  max7219_send_raw(loc_seq[2], 0);
  max7219_send_raw(loc_seq[3], 1);
}

void max7219_prepare_string(uint8_t *p, uint8_t n)
{
  // n has to be < than APP_MAX_CHARS -> no checks made to save memory :P
  uint8_t i = 2; // to compensate offset = 0;
  uint8_t *buff_pt;

  for (; i < n + 2; i++)
  {
    switch (*(p + i - 2))
    {
    case 0:
      buff_pt = max7219_custom_map_dotmtx_half[0];
      break;
    case 1:
      buff_pt = max7219_custom_map_dotmtx_half[1];
      break;
    case 2:
      buff_pt = max7219_custom_map_dotmtx_half[2];
      break;
    case 3:
      buff_pt = max7219_custom_map_dotmtx_half[3];
      break;
    case 4:
      buff_pt = max7219_custom_map_dotmtx_half[4];
      break;
    case 5:
      buff_pt = max7219_custom_map_dotmtx_half[5];
      break;
    case 6:
      buff_pt = max7219_custom_map_dotmtx_half[6];
      break;
    case 7:
      buff_pt = max7219_custom_map_dotmtx_half[7];
      break;
    case 8:
      buff_pt = max7219_custom_map_dotmtx_half[8];
      break;
    case 9:
      buff_pt = max7219_custom_map_dotmtx_half[9];
      break;
    case ':':
      buff_pt = max7219_custom_map_dotmtx_half[10];
      break;
    default:
      buff_pt = max7219_custom_map_dotmtx_half[11];
      break;
    }

    loc_seq[i][0] = buff_pt[0];
    loc_seq[i][1] = buff_pt[1];
    loc_seq[i][2] = buff_pt[2];
    loc_seq[i][3] = buff_pt[3];
  }

    loc_seq[0][0] = 0; 
    loc_seq[0][1] = 0; 
    loc_seq[0][2] = 0; 
    loc_seq[0][3] = 0; 
    loc_seq[1][0] = 0; 
    loc_seq[1][1] = 0; 
    loc_seq[1][2] = 0; 
    loc_seq[1][3] = 0; 

}

static void loc_segment_scroll(uint8_t nchar)
{
  for (uint8_t i = 0; i < (4 * (nchar + 2)) + 1; i++)
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

    // GPIO_uHAL_TOGGLE(GPIO_uHAL_PIN5);
    __delay_ms(100);
    // the last char will remain in the tail, and after all is shifted, 
    // only the last char remain in all the array -> you can make a draw!
  }
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

void timer1_config()
{
  // usa TOF che scatta ogni 500ms con div al max e oscillatore 2^22 Hz
  T1CON = 0b00110000; // presc 8, int fosc/4, timer disabled
  TMR1H = 0;
  TMR1L = 0;
  PIR1bits.TMR1IF = 0;
  PIE1bits.TMR1IE = 1;
  INTCONbits.PEIE = 1;
  INTCONbits.GIE = 1;
  T1CON |= 1; // timer start
}

void reg_init(void)
{
  // GPIO_uHAL_RESET(GPIO_uHAL_PIN5);
  max7219_prepare_string(sequence, 2);
  // GPIO_uHAL_SET(GPIO_uHAL_PIN5);

  max7219_show_frame();
  __delay_ms(500);
}

void rtc_scroll(void)
{
  // GPIO_uHAL_RESET(GPIO_uHAL_PIN5);
  max7219_prepare_string(sequence, 2);
  // GPIO_uHAL_SET(GPIO_uHAL_PIN5);
  loc_segment_scroll(2);
}

void while_seq(void)
{
  sequence[1] = 0;
  while (((--inc) / 10) == sequence[0])
  {
    sequence[1]++;
  }
}

void main(void)
{
  // const uint8_t animation[10] = "ABCDEFGHIL";
  __delay_ms(50);
  GPIO_uHAL_CONF(GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_IN, GPIO_uHAL_MODE_OUT, GPIO_uHAL_MODE_OUT,
                 GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_LOW, GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_HIGH, GPIO_uHAL_VAL_HIGH);
  CMCON = 0xff;
  max7219_init();

  if (GPIO_uHAL_READ(GPIO_uHAL_PIN3) == 0) 
  {
        inc = rtcDataSet.rtcUnion.hour;

    while_seq();
    reg_init();
  }
  while (GPIO_uHAL_READ(GPIO_uHAL_PIN3) == 0)
  {

    if (++rtcDataSet.rtcUnion.hour > 23)
      rtcDataSet.rtcUnion.hour = 0;

    sequence[0] = rtcDataSet.rtcUnion.hour / 10;
    inc = rtcDataSet.rtcUnion.hour;

    while_seq();
    reg_init();
  }
  sequence[0] = ':';
  sequence[1] = ' ';
  reg_init();
  if (GPIO_uHAL_READ(GPIO_uHAL_PIN3) == 0) 
  {
    sequence[0] = 0;
    inc = rtcDataSet.rtcUnion.minute;

    while_seq();
    reg_init();
  }
  while (GPIO_uHAL_READ(GPIO_uHAL_PIN3) == 0)
  {
    if (++rtcDataSet.rtcUnion.minute > 59)
    rtcDataSet.rtcUnion.minute = 0;

    sequence[0] = rtcDataSet.rtcUnion.minute / 10;
    inc = rtcDataSet.rtcUnion.minute;

    while_seq();
    
    reg_init();
  }

  timer1_config();
  // GPIO_uHAL_TOGGLE(GPIO_uHAL_PIN5);
  while (1)
  {
    if (GPIO_uHAL_READ(GPIO_uHAL_PIN3) == 0)
    {
      max7219_init();
      sequence[0] = rtcDataSet.rtcUnion.hour / 10;
      inc = rtcDataSet.rtcUnion.hour;

      while_seq();

      rtc_scroll();
      sequence[0] = rtcDataSet.rtcUnion.minute / 10;
      inc = rtcDataSet.rtcUnion.minute;

      while_seq();

      rtc_scroll();
      //__delay_ms(100);
    }
    else
    {
      if (rtcDataSet.rtcUnion.halfTick)
      {
        // max7219_init();
        bb_spi_write_reg16(MAX7219_INT(0x00));       // mid intensity
        bb_spi_write_reg16(MAX7219_SD_TURN_ON); // turn on from previous off
        sequence[0] = ':';
        sequence[1] = ' ';

        max7219_prepare_string(sequence, 2);
        max7219_show_frame();
      }
      else
      {
        bb_spi_write_reg16(MAX7219_SD_TURN_OFF); // turn off instead of preparing empty data
      }
    }
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
