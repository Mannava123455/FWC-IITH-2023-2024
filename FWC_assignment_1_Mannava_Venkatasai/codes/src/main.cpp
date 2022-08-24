#include<Arduino.h>
int x,y,z,w;
int f,A,B,C,D;
void disp_7447(int D, int C, int B, int A)
{
  digitalWrite(6, A); //LSB
  digitalWrite(7, B); 
  digitalWrite(8, C); 
  digitalWrite(9, D); //MSB
  }
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
A=f;
disp_7447(D,C,B,A);
}


