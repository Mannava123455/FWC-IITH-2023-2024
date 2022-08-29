#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>
int main (void)
{

 bool a=0,b=0,c=0,d=0,f=0;
 DDRB =  0b00100000;  // 13 pin as output 
 DDRD =  0b11000011;
 PORTD = 0b00111100;   // 2,3,4,5 as inputs
 

while(1)
{  

d = (PIND & (1 << PIND5)) == (1 << PIND5);
c = (PIND & (1 << PIND4)) == (1 << PIND4);
b = (PIND & (1 << PIND3)) == (1 << PIND3);
a = (PIND & (1 << PIND2)) == (1 << PIND2);
f = ((c|(!d))&b)|(!a);
PORTB |= (f<< 5);
}
return 0;
}
