#include<Arduino.h>
int x,y,z,w;
int f;
void setup()
{
pinMode(2,INPUT);
pinMode(3,INPUT);
pinMode(4,INPUT);
pinMode(5,INPUT);
pinMode(13,OUTPUT);
}
void loop()
{
x=digitalRead(2);
y=digitalRead(3);
z=digitalRead(4);
w=digitalRead(5);
f=(!x||y)&&z|| !w;
digitalWrite(13,f);
}
// OUTput pin 13 of arduino is given to the 7 th pin of 7447 IC and the remaining  1,2,6 pins are grounded.It results in display of either 0 or 1 in seven segment display. 


