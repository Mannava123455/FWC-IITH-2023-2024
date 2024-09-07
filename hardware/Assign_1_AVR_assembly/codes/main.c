//Blink LED
//through an assembly routine
#include <avr/io.h>

//Function declared in initasm.S
extern void init(void);
extern void main1(void);


 int main (void)
{
  while (1)
   {
	  init();
	  main1();
		  	  
  }
  return 0;

}
