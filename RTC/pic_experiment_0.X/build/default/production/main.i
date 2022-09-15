# 1 "main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "main.c" 2







# 1 "./uconf.h" 1
# 35 "./uconf.h"
#pragma config FOSC = INTRCIO
#pragma config WDTE = OFF
#pragma config PWRTE = ON
#pragma config MCLRE = OFF
#pragma config BOREN = OFF
#pragma config CP = OFF
#pragma config CPD = OFF





# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 1 3



# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\__size_t.h" 1 3



typedef unsigned size_t;
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 2 3

# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\__null.h" 1 3
# 5 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 2 3






# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdarg.h" 1 3






typedef void * va_list[1];

#pragma intrinsic(__va_start)
extern void * __va_start(void);

#pragma intrinsic(__va_arg)
extern void * __va_arg(void *, ...);
# 11 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 2 3
# 43 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 3
struct __prbuf
{
 char * ptr;
 void (* func)(char);
};
# 85 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\conio.h" 1 3







# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\errno.h" 1 3
# 29 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\errno.h" 3
extern int errno;
# 8 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\conio.h" 2 3




extern void init_uart(void);

extern char getch(void);
extern char getche(void);
extern void putch(char);
extern void ungetch(char);

extern __bit kbhit(void);



extern char * cgets(char *);
extern void cputs(const char *);
# 85 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 2 3



extern int cprintf(char *, ...);
#pragma printf_check(cprintf)



extern int _doprnt(struct __prbuf *, const register char *, register va_list);
# 180 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdio.h" 3
#pragma printf_check(vprintf) const
#pragma printf_check(vsprintf) const

extern char * gets(char *);
extern int puts(const char *);
extern int scanf(const char *, ...) __attribute__((unsupported("scanf() is not supported by this compiler")));
extern int sscanf(const char *, const char *, ...) __attribute__((unsupported("sscanf() is not supported by this compiler")));
extern int vprintf(const char *, va_list) __attribute__((unsupported("vprintf() is not supported by this compiler")));
extern int vsprintf(char *, const char *, va_list) __attribute__((unsupported("vsprintf() is not supported by this compiler")));
extern int vscanf(const char *, va_list ap) __attribute__((unsupported("vscanf() is not supported by this compiler")));
extern int vsscanf(const char *, const char *, va_list) __attribute__((unsupported("vsscanf() is not supported by this compiler")));

#pragma printf_check(printf) const
#pragma printf_check(sprintf) const
extern int sprintf(char *, const char *, ...);
extern int printf(const char *, ...);
# 46 "./uconf.h" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdlib.h" 1 3






typedef unsigned short wchar_t;







typedef struct {
 int rem;
 int quot;
} div_t;
typedef struct {
 unsigned rem;
 unsigned quot;
} udiv_t;
typedef struct {
 long quot;
 long rem;
} ldiv_t;
typedef struct {
 unsigned long quot;
 unsigned long rem;
} uldiv_t;
# 65 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdlib.h" 3
extern double atof(const char *);
extern double strtod(const char *, const char **);
extern int atoi(const char *);
extern unsigned xtoi(const char *);
extern long atol(const char *);



extern long strtol(const char *, char **, int);

extern int rand(void);
extern void srand(unsigned int);
extern void * calloc(size_t, size_t);
extern div_t div(int numer, int denom);
extern udiv_t udiv(unsigned numer, unsigned denom);
extern ldiv_t ldiv(long numer, long denom);
extern uldiv_t uldiv(unsigned long numer,unsigned long denom);



extern unsigned long _lrotl(unsigned long value, unsigned int shift);
extern unsigned long _lrotr(unsigned long value, unsigned int shift);
extern unsigned int _rotl(unsigned int value, unsigned int shift);
extern unsigned int _rotr(unsigned int value, unsigned int shift);




extern void * malloc(size_t);
extern void free(void *);
extern void * realloc(void *, size_t);




# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\xc8debug.h" 1 3
# 13 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\xc8debug.h" 3
#pragma intrinsic(__builtin_software_breakpoint)
extern void __builtin_software_breakpoint(void);
# 99 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdlib.h" 2 3





extern int atexit(void (*)(void));
extern char * getenv(const char *);
extern char ** environ;
extern int system(char *);
extern void qsort(void *, size_t, size_t, int (*)(const void *, const void *));
extern void * bsearch(const void *, void *, size_t, size_t, int(*)(const void *, const void *));
extern int abs(int);
extern long labs(long);

extern char * itoa(char * buf, int val, int base);
extern char * utoa(char * buf, unsigned val, int base);




extern char * ltoa(char * buf, long val, int base);
extern char * ultoa(char * buf, unsigned long val, int base);

extern char * ftoa(float f, int * status);
# 47 "./uconf.h" 2


# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\xc.h" 1 3
# 18 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\xc.h" 3
extern const char __xc8_OPTIM_SPEED;

extern double __fpnormalize(double);




# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\builtins.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 1 3
# 13 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef signed char int8_t;






typedef signed int int16_t;







typedef __int24 int24_t;







typedef signed long int int32_t;
# 52 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef unsigned char uint8_t;





typedef unsigned int uint16_t;






typedef __uint24 uint24_t;






typedef unsigned long int uint32_t;
# 88 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef signed char int_least8_t;







typedef signed int int_least16_t;
# 109 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef __int24 int_least24_t;
# 118 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef signed long int int_least32_t;
# 136 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef unsigned char uint_least8_t;






typedef unsigned int uint_least16_t;
# 154 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef __uint24 uint_least24_t;







typedef unsigned long int uint_least32_t;
# 181 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef signed char int_fast8_t;






typedef signed int int_fast16_t;
# 200 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef __int24 int_fast24_t;







typedef signed long int int_fast32_t;
# 224 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef unsigned char uint_fast8_t;





typedef unsigned int uint_fast16_t;
# 240 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef __uint24 uint_fast24_t;






typedef unsigned long int uint_fast32_t;
# 268 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef int32_t intmax_t;
# 282 "C:\\Program Files\\Microchip\\xc8\\v2.36\\pic\\include\\c90\\stdint.h" 3
typedef uint32_t uintmax_t;






typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 5 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\builtins.h" 2 3


#pragma intrinsic(__nop)
extern void __nop(void);


#pragma intrinsic(_delay)
extern __attribute__((nonreentrant)) void _delay(uint32_t);
#pragma intrinsic(_delaywdt)
extern __attribute__((nonreentrant)) void _delaywdt(uint32_t);
# 25 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\xc.h" 2 3



# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic.h" 1 3




# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\htc.h" 1 3



# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\xc.h" 1 3
# 5 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\htc.h" 2 3
# 6 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic.h" 2 3



extern unsigned char __osccal_val(void);




# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic_chip_select.h" 1 3
# 204 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic_chip_select.h" 3
# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 1 3
# 45 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\__at.h" 1 3
# 46 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 2 3







extern volatile unsigned char INDF __attribute__((address(0x000)));

__asm("INDF equ 00h");


typedef union {
    struct {
        unsigned INDF :8;
    };
} INDFbits_t;
extern volatile INDFbits_t INDFbits __attribute__((address(0x000)));
# 73 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char TMR0 __attribute__((address(0x001)));

__asm("TMR0 equ 01h");


typedef union {
    struct {
        unsigned TMR0 :8;
    };
} TMR0bits_t;
extern volatile TMR0bits_t TMR0bits __attribute__((address(0x001)));
# 93 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char PCL __attribute__((address(0x002)));

__asm("PCL equ 02h");


typedef union {
    struct {
        unsigned PCL :8;
    };
} PCLbits_t;
extern volatile PCLbits_t PCLbits __attribute__((address(0x002)));
# 113 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char STATUS __attribute__((address(0x003)));

__asm("STATUS equ 03h");


typedef union {
    struct {
        unsigned C :1;
        unsigned DC :1;
        unsigned Z :1;
        unsigned nPD :1;
        unsigned nTO :1;
        unsigned RP :2;
        unsigned IRP :1;
    };
    struct {
        unsigned :5;
        unsigned RP0 :1;
        unsigned RP1 :1;
    };
    struct {
        unsigned CARRY :1;
        unsigned :1;
        unsigned ZERO :1;
    };
} STATUSbits_t;
extern volatile STATUSbits_t STATUSbits __attribute__((address(0x003)));
# 199 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char FSR __attribute__((address(0x004)));

__asm("FSR equ 04h");


typedef union {
    struct {
        unsigned FSR :8;
    };
} FSRbits_t;
extern volatile FSRbits_t FSRbits __attribute__((address(0x004)));
# 219 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char GPIO __attribute__((address(0x005)));

__asm("GPIO equ 05h");


typedef union {
    struct {
        unsigned GP0 :1;
        unsigned GP1 :1;
        unsigned GP2 :1;
        unsigned GP3 :1;
        unsigned GP4 :1;
        unsigned GP5 :1;
    };
    struct {
        unsigned GPIO0 :1;
        unsigned GPIO1 :1;
        unsigned GPIO2 :1;
        unsigned GPIO3 :1;
        unsigned GPIO4 :1;
        unsigned GPIO5 :1;
    };
} GPIObits_t;
extern volatile GPIObits_t GPIObits __attribute__((address(0x005)));
# 307 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char PCLATH __attribute__((address(0x00A)));

__asm("PCLATH equ 0Ah");


typedef union {
    struct {
        unsigned PCLATH :5;
    };
} PCLATHbits_t;
extern volatile PCLATHbits_t PCLATHbits __attribute__((address(0x00A)));
# 327 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char INTCON __attribute__((address(0x00B)));

__asm("INTCON equ 0Bh");


typedef union {
    struct {
        unsigned GPIF :1;
        unsigned INTF :1;
        unsigned T0IF :1;
        unsigned GPIE :1;
        unsigned INTE :1;
        unsigned T0IE :1;
        unsigned PEIE :1;
        unsigned GIE :1;
    };
    struct {
        unsigned :2;
        unsigned TMR0IF :1;
        unsigned :2;
        unsigned TMR0IE :1;
    };
} INTCONbits_t;
extern volatile INTCONbits_t INTCONbits __attribute__((address(0x00B)));
# 405 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char PIR1 __attribute__((address(0x00C)));

__asm("PIR1 equ 0Ch");


typedef union {
    struct {
        unsigned TMR1IF :1;
        unsigned :2;
        unsigned CMIF :1;
        unsigned :2;
        unsigned ADIF :1;
        unsigned EEIF :1;
    };
    struct {
        unsigned T1IF :1;
    };
} PIR1bits_t;
extern volatile PIR1bits_t PIR1bits __attribute__((address(0x00C)));
# 453 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned short TMR1 __attribute__((address(0x00E)));

__asm("TMR1 equ 0Eh");




extern volatile unsigned char TMR1L __attribute__((address(0x00E)));

__asm("TMR1L equ 0Eh");


typedef union {
    struct {
        unsigned TMR1L :8;
    };
} TMR1Lbits_t;
extern volatile TMR1Lbits_t TMR1Lbits __attribute__((address(0x00E)));
# 480 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char TMR1H __attribute__((address(0x00F)));

__asm("TMR1H equ 0Fh");


typedef union {
    struct {
        unsigned TMR1H :8;
    };
} TMR1Hbits_t;
extern volatile TMR1Hbits_t TMR1Hbits __attribute__((address(0x00F)));
# 500 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char T1CON __attribute__((address(0x010)));

__asm("T1CON equ 010h");


typedef union {
    struct {
        unsigned TMR1ON :1;
        unsigned TMR1CS :1;
        unsigned nT1SYNC :1;
        unsigned T1OSCEN :1;
        unsigned T1CKPS :2;
        unsigned TMR1GE :1;
    };
    struct {
        unsigned :4;
        unsigned T1CKPS0 :1;
        unsigned T1CKPS1 :1;
    };
} T1CONbits_t;
extern volatile T1CONbits_t T1CONbits __attribute__((address(0x010)));
# 565 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char CMCON __attribute__((address(0x019)));

__asm("CMCON equ 019h");


typedef union {
    struct {
        unsigned CM :3;
        unsigned CIS :1;
        unsigned CINV :1;
        unsigned :1;
        unsigned COUT :1;
    };
    struct {
        unsigned CM0 :1;
        unsigned CM1 :1;
        unsigned CM2 :1;
    };
} CMCONbits_t;
extern volatile CMCONbits_t CMCONbits __attribute__((address(0x019)));
# 624 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char OPTION_REG __attribute__((address(0x081)));

__asm("OPTION_REG equ 081h");


typedef union {
    struct {
        unsigned PS :3;
        unsigned PSA :1;
        unsigned T0SE :1;
        unsigned T0CS :1;
        unsigned INTEDG :1;
        unsigned nGPPU :1;
    };
    struct {
        unsigned PS0 :1;
        unsigned PS1 :1;
        unsigned PS2 :1;
    };
} OPTION_REGbits_t;
extern volatile OPTION_REGbits_t OPTION_REGbits __attribute__((address(0x081)));
# 694 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char TRISIO __attribute__((address(0x085)));

__asm("TRISIO equ 085h");


typedef union {
    struct {
        unsigned TRISIO0 :1;
        unsigned TRISIO1 :1;
        unsigned TRISIO2 :1;
        unsigned TRISIO3 :1;
        unsigned TRISIO4 :1;
        unsigned TRISIO5 :1;
    };
} TRISIObits_t;
extern volatile TRISIObits_t TRISIObits __attribute__((address(0x085)));
# 744 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char PIE1 __attribute__((address(0x08C)));

__asm("PIE1 equ 08Ch");


typedef union {
    struct {
        unsigned TMR1IE :1;
        unsigned :2;
        unsigned CMIE :1;
        unsigned :2;
        unsigned ADIE :1;
        unsigned EEIE :1;
    };
    struct {
        unsigned T1IE :1;
    };
} PIE1bits_t;
extern volatile PIE1bits_t PIE1bits __attribute__((address(0x08C)));
# 792 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char PCON __attribute__((address(0x08E)));

__asm("PCON equ 08Eh");


typedef union {
    struct {
        unsigned nBOR :1;
        unsigned nPOR :1;
    };
    struct {
        unsigned nBOD :1;
    };
} PCONbits_t;
extern volatile PCONbits_t PCONbits __attribute__((address(0x08E)));
# 826 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char OSCCAL __attribute__((address(0x090)));

__asm("OSCCAL equ 090h");


typedef union {
    struct {
        unsigned :2;
        unsigned CAL :6;
    };
    struct {
        unsigned :2;
        unsigned CAL0 :1;
        unsigned CAL1 :1;
        unsigned CAL2 :1;
        unsigned CAL3 :1;
        unsigned CAL4 :1;
        unsigned CAL5 :1;
    };
} OSCCALbits_t;
extern volatile OSCCALbits_t OSCCALbits __attribute__((address(0x090)));
# 886 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char WPU __attribute__((address(0x095)));

__asm("WPU equ 095h");


typedef union {
    struct {
        unsigned WPU0 :1;
        unsigned WPU1 :1;
        unsigned WPU2 :1;
        unsigned :1;
        unsigned WPU4 :1;
        unsigned WPU5 :1;
    };
} WPUbits_t;
extern volatile WPUbits_t WPUbits __attribute__((address(0x095)));
# 931 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char IOC __attribute__((address(0x096)));

__asm("IOC equ 096h");


extern volatile unsigned char IOCB __attribute__((address(0x096)));

__asm("IOCB equ 096h");


typedef union {
    struct {
        unsigned IOC0 :1;
        unsigned IOC1 :1;
        unsigned IOC2 :1;
        unsigned IOC3 :1;
        unsigned IOC4 :1;
        unsigned IOC5 :1;
    };
    struct {
        unsigned IOCB0 :1;
        unsigned IOCB1 :1;
        unsigned IOCB2 :1;
        unsigned IOCB3 :1;
        unsigned IOCB4 :1;
        unsigned IOCB5 :1;
    };
} IOCbits_t;
extern volatile IOCbits_t IOCbits __attribute__((address(0x096)));
# 1022 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
typedef union {
    struct {
        unsigned IOC0 :1;
        unsigned IOC1 :1;
        unsigned IOC2 :1;
        unsigned IOC3 :1;
        unsigned IOC4 :1;
        unsigned IOC5 :1;
    };
    struct {
        unsigned IOCB0 :1;
        unsigned IOCB1 :1;
        unsigned IOCB2 :1;
        unsigned IOCB3 :1;
        unsigned IOCB4 :1;
        unsigned IOCB5 :1;
    };
} IOCBbits_t;
extern volatile IOCBbits_t IOCBbits __attribute__((address(0x096)));
# 1105 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char VRCON __attribute__((address(0x099)));

__asm("VRCON equ 099h");


typedef union {
    struct {
        unsigned VR :4;
        unsigned :1;
        unsigned VRR :1;
        unsigned :1;
        unsigned VREN :1;
    };
    struct {
        unsigned VR0 :1;
        unsigned VR1 :1;
        unsigned VR2 :1;
        unsigned VR3 :1;
    };
} VRCONbits_t;
extern volatile VRCONbits_t VRCONbits __attribute__((address(0x099)));
# 1165 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char EEDATA __attribute__((address(0x09A)));

__asm("EEDATA equ 09Ah");


extern volatile unsigned char EEDAT __attribute__((address(0x09A)));

__asm("EEDAT equ 09Ah");


typedef union {
    struct {
        unsigned EEDATA :8;
    };
} EEDATAbits_t;
extern volatile EEDATAbits_t EEDATAbits __attribute__((address(0x09A)));







typedef union {
    struct {
        unsigned EEDATA :8;
    };
} EEDATbits_t;
extern volatile EEDATbits_t EEDATbits __attribute__((address(0x09A)));
# 1203 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char EEADR __attribute__((address(0x09B)));

__asm("EEADR equ 09Bh");


typedef union {
    struct {
        unsigned EEADR :7;
    };
} EEADRbits_t;
extern volatile EEADRbits_t EEADRbits __attribute__((address(0x09B)));
# 1223 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char EECON1 __attribute__((address(0x09C)));

__asm("EECON1 equ 09Ch");


typedef union {
    struct {
        unsigned RD :1;
        unsigned WR :1;
        unsigned WREN :1;
        unsigned WRERR :1;
    };
} EECON1bits_t;
extern volatile EECON1bits_t EECON1bits __attribute__((address(0x09C)));
# 1261 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile unsigned char EECON2 __attribute__((address(0x09D)));

__asm("EECON2 equ 09Dh");


typedef union {
    struct {
        unsigned EECON2 :8;
    };
} EECON2bits_t;
extern volatile EECON2bits_t EECON2bits __attribute__((address(0x09D)));
# 1291 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\proc\\pic12f629.h" 3
extern volatile __bit ADIE __attribute__((address(0x466)));


extern volatile __bit ADIF __attribute__((address(0x66)));


extern volatile __bit CAL0 __attribute__((address(0x482)));


extern volatile __bit CAL1 __attribute__((address(0x483)));


extern volatile __bit CAL2 __attribute__((address(0x484)));


extern volatile __bit CAL3 __attribute__((address(0x485)));


extern volatile __bit CAL4 __attribute__((address(0x486)));


extern volatile __bit CAL5 __attribute__((address(0x487)));


extern volatile __bit CARRY __attribute__((address(0x18)));


extern volatile __bit CINV __attribute__((address(0xCC)));


extern volatile __bit CIS __attribute__((address(0xCB)));


extern volatile __bit CM0 __attribute__((address(0xC8)));


extern volatile __bit CM1 __attribute__((address(0xC9)));


extern volatile __bit CM2 __attribute__((address(0xCA)));


extern volatile __bit CMIE __attribute__((address(0x463)));


extern volatile __bit CMIF __attribute__((address(0x63)));


extern volatile __bit COUT __attribute__((address(0xCE)));


extern volatile __bit DC __attribute__((address(0x19)));


extern volatile __bit EEIE __attribute__((address(0x467)));


extern volatile __bit EEIF __attribute__((address(0x67)));


extern volatile __bit GIE __attribute__((address(0x5F)));


extern volatile __bit GP0 __attribute__((address(0x28)));


extern volatile __bit GP1 __attribute__((address(0x29)));


extern volatile __bit GP2 __attribute__((address(0x2A)));


extern volatile __bit GP3 __attribute__((address(0x2B)));


extern volatile __bit GP4 __attribute__((address(0x2C)));


extern volatile __bit GP5 __attribute__((address(0x2D)));


extern volatile __bit GPIE __attribute__((address(0x5B)));


extern volatile __bit GPIF __attribute__((address(0x58)));


extern volatile __bit GPIO0 __attribute__((address(0x28)));


extern volatile __bit GPIO1 __attribute__((address(0x29)));


extern volatile __bit GPIO2 __attribute__((address(0x2A)));


extern volatile __bit GPIO3 __attribute__((address(0x2B)));


extern volatile __bit GPIO4 __attribute__((address(0x2C)));


extern volatile __bit GPIO5 __attribute__((address(0x2D)));


extern volatile __bit INTE __attribute__((address(0x5C)));


extern volatile __bit INTEDG __attribute__((address(0x40E)));


extern volatile __bit INTF __attribute__((address(0x59)));


extern volatile __bit IOC0 __attribute__((address(0x4B0)));


extern volatile __bit IOC1 __attribute__((address(0x4B1)));


extern volatile __bit IOC2 __attribute__((address(0x4B2)));


extern volatile __bit IOC3 __attribute__((address(0x4B3)));


extern volatile __bit IOC4 __attribute__((address(0x4B4)));


extern volatile __bit IOC5 __attribute__((address(0x4B5)));


extern volatile __bit IOCB0 __attribute__((address(0x4B0)));


extern volatile __bit IOCB1 __attribute__((address(0x4B1)));


extern volatile __bit IOCB2 __attribute__((address(0x4B2)));


extern volatile __bit IOCB3 __attribute__((address(0x4B3)));


extern volatile __bit IOCB4 __attribute__((address(0x4B4)));


extern volatile __bit IOCB5 __attribute__((address(0x4B5)));


extern volatile __bit IRP __attribute__((address(0x1F)));


extern volatile __bit PEIE __attribute__((address(0x5E)));


extern volatile __bit PS0 __attribute__((address(0x408)));


extern volatile __bit PS1 __attribute__((address(0x409)));


extern volatile __bit PS2 __attribute__((address(0x40A)));


extern volatile __bit PSA __attribute__((address(0x40B)));


extern volatile __bit RD __attribute__((address(0x4E0)));


extern volatile __bit RP0 __attribute__((address(0x1D)));


extern volatile __bit RP1 __attribute__((address(0x1E)));


extern volatile __bit T0CS __attribute__((address(0x40D)));


extern volatile __bit T0IE __attribute__((address(0x5D)));


extern volatile __bit T0IF __attribute__((address(0x5A)));


extern volatile __bit T0SE __attribute__((address(0x40C)));


extern volatile __bit T1CKPS0 __attribute__((address(0x84)));


extern volatile __bit T1CKPS1 __attribute__((address(0x85)));


extern volatile __bit T1IE __attribute__((address(0x460)));


extern volatile __bit T1IF __attribute__((address(0x60)));


extern volatile __bit T1OSCEN __attribute__((address(0x83)));


extern volatile __bit TMR0IE __attribute__((address(0x5D)));


extern volatile __bit TMR0IF __attribute__((address(0x5A)));


extern volatile __bit TMR1CS __attribute__((address(0x81)));


extern volatile __bit TMR1GE __attribute__((address(0x86)));


extern volatile __bit TMR1IE __attribute__((address(0x460)));


extern volatile __bit TMR1IF __attribute__((address(0x60)));


extern volatile __bit TMR1ON __attribute__((address(0x80)));


extern volatile __bit TRISIO0 __attribute__((address(0x428)));


extern volatile __bit TRISIO1 __attribute__((address(0x429)));


extern volatile __bit TRISIO2 __attribute__((address(0x42A)));


extern volatile __bit TRISIO3 __attribute__((address(0x42B)));


extern volatile __bit TRISIO4 __attribute__((address(0x42C)));


extern volatile __bit TRISIO5 __attribute__((address(0x42D)));


extern volatile __bit VR0 __attribute__((address(0x4C8)));


extern volatile __bit VR1 __attribute__((address(0x4C9)));


extern volatile __bit VR2 __attribute__((address(0x4CA)));


extern volatile __bit VR3 __attribute__((address(0x4CB)));


extern volatile __bit VREN __attribute__((address(0x4CF)));


extern volatile __bit VRR __attribute__((address(0x4CD)));


extern volatile __bit WPU0 __attribute__((address(0x4A8)));


extern volatile __bit WPU1 __attribute__((address(0x4A9)));


extern volatile __bit WPU2 __attribute__((address(0x4AA)));


extern volatile __bit WPU4 __attribute__((address(0x4AC)));


extern volatile __bit WPU5 __attribute__((address(0x4AD)));


extern volatile __bit WR __attribute__((address(0x4E1)));


extern volatile __bit WREN __attribute__((address(0x4E2)));


extern volatile __bit WRERR __attribute__((address(0x4E3)));


extern volatile __bit ZERO __attribute__((address(0x1A)));


extern volatile __bit nBOD __attribute__((address(0x470)));


extern volatile __bit nBOR __attribute__((address(0x470)));


extern volatile __bit nGPPU __attribute__((address(0x40F)));


extern volatile __bit nPD __attribute__((address(0x1B)));


extern volatile __bit nPOR __attribute__((address(0x471)));


extern volatile __bit nT1SYNC __attribute__((address(0x82)));


extern volatile __bit nTO __attribute__((address(0x1C)));
# 205 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic_chip_select.h" 2 3
# 14 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic.h" 2 3
# 76 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic.h" 3
__attribute__((__unsupported__("The " "FLASH_READ" " macro function is no longer supported. Please use the MPLAB X MCC."))) unsigned char __flash_read(unsigned short addr);

__attribute__((__unsupported__("The " "FLASH_WRITE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_write(unsigned short addr, unsigned short data);

__attribute__((__unsupported__("The " "FLASH_ERASE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_erase(unsigned short addr);



# 1 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\eeprom_routines.h" 1 3
# 114 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\eeprom_routines.h" 3
extern void eeprom_write(unsigned char addr, unsigned char value);
extern unsigned char eeprom_read(unsigned char addr);
# 84 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic.h" 2 3
# 118 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\pic.h" 3
extern __bank0 unsigned char __resetbits;
extern __bank0 __bit __powerdown;
extern __bank0 __bit __timeout;
# 29 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC10-12Fxxx_DFP/1.5.61/xc8\\pic\\include\\xc.h" 2 3
# 49 "./uconf.h" 2

# 1 "./gpio_uhal.h" 1






typedef enum {
    gpio_uhal_false_bool = 0,
    gpio_uhal_true_bool = 1
    } gpio_uhal_bool_t;
# 50 "./uconf.h" 2
# 8 "main.c" 2


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
# 49 "main.c"
void bb_spi_write_reg16(uint16_t data);
void max7219_send_raw(uint8_t *data, uint8_t pos);

static uint8_t loc_seq[5][4];



const uint8_t max7219_blank_map_dotmtx_half[1][4] = {
    {0b00000000,
     0b00000000,
     0b00000000,
     0b00000000}};

const uint8_t max7219_custom_map_dotmtx_half[17][4] = {

    {0b01111110,
     0b10000001,
     0b10000001,
     0b01000010},

    {0b00000000,
     0b10001000,
     0b11111011,
     0b10000000},

    {0b01100100,
     0b10010010,
     0b10010010,
     0b11111100},

    {0b01111000,
     0b10000100,
     0b10000100,
     0b01111000},

    {0b11111111,
     0b10001001,
     0b10001001,
     0b10000001},

    {0b01100000,
     0b10010000,
     0b10010000,
     0b11111110},

    {0b00000000,
     0b00001111,
     0b10111111,
     0b00000011},

    {0b00110000,
     0b01100010,
     0b11100110,
     0b11100000},

    {0b11100000,
     0b11100010,
     0b01100110,
     0b00110000},

    {0b00000000,
     0b00000000,
     0b01000100,
     0b01000000},

    {0b01000000,
     0b01000100,
     0b00000000,
     0b00000000},

    {0b00000000,
     0b00010000,
     0b00100110,
     0b01000000},

    {0b01000000,
     0b00100110,
     0b00010000,
     0b00000000},

    {0b00000000,
     0b00010110,
     0b00100110,
     0b01100000},

    {0b01100000,
     0b00100110,
     0b00010110,
     0b00000000},

    {0b00100110,
     0b01101001,
     0b11101001,
     0b11100110},

    {0b11100110,
     0b11101001,
     0b01101001,
     0b00100110}};


static void max7219_init(void)
{







  uint16_t data = 0;
  bb_spi_write_reg16((0x0C00 | 0x0001));
  bb_spi_write_reg16((0x0A00 | ((uint16_t)0x00 & 0x00FF)));
  bb_spi_write_reg16((0x0B00 | 0x0007));
  bb_spi_write_reg16((0x0900 | 0x0000));
}

void max7219_show_frame(void)
{
  max7219_send_raw(loc_seq[2], 0);
  max7219_send_raw(loc_seq[3], 1);
}

void max7219_prepare_string(uint8_t *p, uint8_t n, sequence_t isFirst)
{

  uint8_t i = 0, offset = 0;
  uint8_t *buff_pt;
  if (isFirst == SEQ_FIRST || isFirst == SEQ_NOT_FIRST)
  {


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

    GPIO ^= (0x7F & 0x20);
# 262 "main.c"
    loc_seq[i][0] = buff_pt[0];
    loc_seq[i][1] = buff_pt[1];
    loc_seq[i][2] = buff_pt[2];
    loc_seq[i][3] = buff_pt[3];
  }


  if (isFirst == SEQ_FIRST)
  {
    loc_seq[0][0] = 0;
    loc_seq[0][1] = 0;
    loc_seq[0][2] = 0;
    loc_seq[0][3] = 0;
    loc_seq[1][0] = 0;
    loc_seq[1][1] = 0;
    loc_seq[1][2] = 0;
    loc_seq[1][3] = 0;
  }
}

static void loc_segment_scroll(uint8_t nchar, order_char_t not_last)
{
  for (uint8_t i = 0; i < (4 * (nchar + not_last)) + 1; i++)
  {
    max7219_send_raw(loc_seq[0], 0);
    max7219_send_raw(loc_seq[1], 1);


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

    GPIO ^= (0x7F & 0x20);
    _delay((unsigned long)((100)*(4000000/4000.0)));

  }

}

void max7219_send_raw(uint8_t *data, uint8_t pos)
{
  uint16_t dig = 0x0100;
  if (pos != 0)
  {
    dig = 0x0500;
  }
  for (uint16_t dig_incr = 0; dig_incr < 4; dig_incr++)
  {
    bb_spi_write_reg16((dig + (dig_incr << 8)) | (data[dig_incr]));
  }
}



void main(void)
{
  uint8_t sequence[4], i, j;
  const uint8_t animation[10] = "ABCDEFGHIL";
    TRISIO = ((0x00 & 0x01) | (0x00 & 0x02) | (0x00 & 0x04) | (0x7F & 0x08) | (0x00 & 0x10)| (0x00 & 0x20)); GPIO = ((0x7F & 0x01) | (0x7F & 0x02) | (0x00 & 0x04)| (0x7F & 0x08)| (0x7F & 0x10)| (0x7F & 0x20));;

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
    _delay((unsigned long)((500)*(4000000/4000.0)));
    for (j = 0; j < 5; j++)
    {
    for(i=0; i<=8;i=i+2)
    {
      sequence[0] = animation[i];
      sequence[1] = animation[i+1];
      max7219_prepare_string(sequence, 4, SEQ_FIRST);
      max7219_show_frame();
      _delay((unsigned long)((100)*(4000000/4000.0)));
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
          bb_spi_write_reg16((0x0A00 | ((uint16_t)i & 0x00FF)));
          _delay((unsigned long)((10)*(4000000/4000.0)));
        }
        for (i = 0x0f; i > 0x00; i--)
        {
          bb_spi_write_reg16((0x0A00 | ((uint16_t)i & 0x00FF)));
          _delay((unsigned long)((10)*(4000000/4000.0)));
        }
      }

      _delay((unsigned long)((1000)*(4000000/4000.0)));






    };
  }
  return;
}



void bb_spi_write_reg16(uint16_t data)
{
  unsigned char SPICount;
  uint16_t SPIData = data;

  GPIO &= ~(0x7F & 0x04);
  GPIO &= ~(0x7F & 0x01);
  GPIO &= ~(0x7F & 0x04);
  for (SPICount = 0; SPICount < 16; SPICount++)
  {
    if ((SPIData & 0x8000) == 0x8000)
    {
      GPIO |= (0x7F & 0x02);
    }
    else
    {
      GPIO &= ~(0x7F & 0x02);
    }
    GPIO &= ~(0x7F & 0x01);
    _delay((unsigned long)((18)*(4000000/4000000.0)));
    GPIO |= (0x7F & 0x01);
    _delay((unsigned long)((1)*(4000000/4000000.0)));
    SPIData = SPIData << 1;
  }
  GPIO &= ~(0x7F & 0x02);

  GPIO &= ~(0x7F & 0x01);
  _delay((unsigned long)((1)*(4000000/4000000.0)));
  GPIO |= (0x7F & 0x04);

}
