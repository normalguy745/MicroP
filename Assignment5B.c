#include <avr/io.h>

void delay1000()
{
    unsigned int i;
    for (i=0;i<1000;i++);
}

int main(void)
{
    //Setting ports
    DDRA=1<<5;  //input
    DDRB=0xFF;  //output
    PORTB=0;    //active high LEDS, off

    unsigned char counter=0;
    unsigned int i;

    for (i=0;x<20000,x++)
    {
        if (PINA & 0x20)    //if pinA set
        {
            counter++;
        }
        delay1000();
    }
    PORTB=0xFF;
    return 0;
}