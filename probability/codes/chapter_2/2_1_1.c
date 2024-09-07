#include<stdio.h>
#include <stdlib.h>
#include <math.h>

void uniform(char *str, int len)
{
int i;
FILE *fp;

fp = fopen(str,"w");


for (i = 0; i < len; i++)
{
fprintf(fp,"%lf\n",(double)rand()/RAND_MAX);
}
printf(" RAND_MAX is :%d",RAND_MAX);
printf("%lf",(double)rand()/RAND_MAX);
fclose(fp);

}


double mean(char *str)
{
int i=0,c;
FILE *fp;
double x, temp=0.0;

fp = fopen(str,"r");
//get numbers from file
while(fscanf(fp,"%lf",&x)!=EOF)
{
//Count numbers in file
i=i+1;
//Add all numbers in file
temp = temp+x;
}
fclose(fp);
temp = temp/(i-1);
return temp;

}


double variance(char *str)

{
int i=0,c;
FILE *fp;
double x, temp=0.0,temp1=0.0;

fp = fopen(str,"r");
//get numbers from file
while(fscanf(fp,"%lf",&x)!=EOF)
{
//Count numbers in file
i=i+1;
//Add all numbers in file
temp = temp+(x*x);
temp1=temp1+x;
}
fclose(fp);
temp = temp/(i-1);
temp1=temp1/(i-1);
return temp-(temp1*temp1);

}


int main() //main function begins
{
 
uniform("uni.dat", 1000000);
printf("\n");
printf("Mean is :%lf\n",mean("uni.dat"));
printf("Variance is :%lf",variance("uni.dat"));

for (int i = 0; i < 1000000; i++)
{
printf("%lf\n",(double)rand()/RAND_MAX);
}
return 0;
}
