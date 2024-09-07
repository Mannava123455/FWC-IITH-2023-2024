
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<math.h>
#include<malloc.h>

int min(int a,int b);
int *f(int *a,int *b,int *c,int temp)
{
int i;
for(i=0;i<temp;i++)
{
	if((a[i]>0) && (b[i]>0))
	{
		c[i]=min(abs(a[i]),abs(b[i]));



	}
	if((a[i]<0) && (b[i]<0))
	{

		c[i]=min(abs(a[i]),abs(b[i]));

	}
	if((a[i]>0) && (b[i]<0))
	{
		c[i]=-1*min(abs(a[i]),abs(b[i]));


	}
	if((a[i]<0) && (b[i]>0))
	{
		c[i]=-1*min(abs(a[i]),abs(b[i]));


	}

}
return c;
}


int *g(int *a,int *b,int *c,int *d,int temp)
{
int i;
for(i=0;i<temp;i++)
{
d[i]=b[i]+(1-2*c[i])*a[i];
}
return d;
}



int min(int a,int b)
{
	if(a>b)
	{
		return b;
	}
	else
	{
		return a;
	}
}

int main() 
{
  //reliability sequence for 5G in increasing order from worst to best
int Q1[1024]={0,1,2,4,8,16,32,3,5,64,9,6,17,10,18,128,12,33,65,20,256,34,24,36,7,129,66,512,11,40,68,130,
19,13,48,14,72,257,21,132,35,258,26,513,80,37,25,22,136,260,264,38,514,96,67,41,144,28,69,42,
516,49,74,272,160,520,288,528,192,544,70,44,131,81,50,73,15,320,133,52,23,134,384,76,137,82,56,27,
97,39,259,84,138,145,261,29,43,98,515,88,140,30,146,71,262,265,161,576,45,100,640,51,148,46,75,266,273,517,104,162,
53,193,152,77,164,768,268,274,518,54,83,57,521,112,135,78,289,194,85,276,522,58,168,139,99,86,60,280,89,290,529,524,
196,141,101,147,176,142,530,321,31,200,90,545,292,322,532,263,149,102,105,304,296,163,92,47,267,385,546,324,208,386,150,153,
165,106,55,328,536,577,548,113,154,79,269,108,578,224,166,519,552,195,270,641,523,275,580,291,59,169,560,114,277,156,87,197,
116,170,61,531,525,642,281,278,526,177,293,388,91,584,769,198,172,120,201,336,62,282,143,103,178,294,93,644,202,592,323,392,
297,770,107,180,151,209,284,648,94,204,298,400,608,352,325,533,155,210,305,547,300,109,184,534,537,115,167,225,326,306,772,157,
656,329,110,117,212,171,776,330,226,549,538,387,308,216,416,271,279,158,337,550,672,118,332,579,540,389,173,121,553,199,784,179,
228,338,312,704,390,174,554,581,393,283,122,448,353,561,203,63,340,394,527,582,556,181,295,285,232,124,205,182,643,562,286,585,
299,354,211,401,185,396,344,586,645,593,535,240,206,95,327,564,800,402,356,307,301,417,213,568,832,588,186,646,404,227,896,594,
418,302,649,771,360,539,111,331,214,309,188,449,217,408,609,596,551,650,229,159,420,310,541,773,610,657,333,119,600,339,218,368,
652,230,391,313,450,542,334,233,555,774,175,123,658,612,341,777,220,314,424,395,673,583,355,287,183,234,125,557,660,616,342,316,
241,778,563,345,452,397,403,207,674,558,785,432,357,187,236,664,624,587,780,705,126,242,565,398,346,456,358,405,303,569,244,595,
189,566,676,361,706,589,215,786,647,348,419,406,464,680,801,362,590,409,570,788,597,572,219,311,708,598,601,651,421,792,802,611,
602,410,231,688,653,248,369,190,364,654,659,335,480,315,221,370,613,422,425,451,614,543,235,412,343,372,775,317,222,426,453,237,
559,833,804,712,834,661,808,779,617,604,433,720,816,836,347,897,243,662,454,318,675,618,898,781,376,428,665,736,567,840,625,238,
359,457,399,787,591,678,434,677,349,245,458,666,620,363,127,191,782,407,436,626,571,465,681,246,707,350,599,668,790,460,249,682,
573,411,803,789,709,365,440,628,689,374,423,466,793,250,371,481,574,413,603,366,468,655,900,805,615,684,710,429,794,252,373,605,
848,690,713,632,482,806,427,904,414,223,663,692,835,619,472,455,796,809,714,721,837,716,864,810,606,912,722,696,377,435,817,319,
621,812,484,430,838,667,488,239,378,459,622,627,437,380,818,461,496,669,679,724,841,629,351,467,438,737,251,462,442,441,469,247,
683,842,738,899,670,783,849,820,728,928,791,367,901,630,685,844,633,711,253,691,824,902,686,740,850,375,444,470,483,415,485,905,
795,473,634,744,852,960,865,693,797,906,715,807,474,636,694,254,717,575,913,798,811,379,697,431,607,489,866,723,486,908,718,813,
476,856,839,725,698,914,752,868,819,814,439,929,490,623,671,739,916,463,843,381,497,930,821,726,961,872,492,631,729,700,443,741,
845,920,382,822,851,730,498,880,742,445,471,635,932,687,903,825,500,846,745,826,732,446,962,936,475,853,867,637,907,487,695,746,
828,753,854,857,504,799,255,964,909,719,477,915,638,748,944,869,491,699,754,858,478,968,383,910,815,976,870,917,727,493,873,701,
931,756,860,499,731,823,922,874,918,502,933,743,760,881,494,702,921,501,876,847,992,447,733,827,934,882,937,963,747,505,855,924,
734,829,965,938,884,506,749,945,966,755,859,940,830,911,871,639,888,479,946,750,969,508,861,757,970,919,875,862,758,948,977,923,
972,761,877,952,495,703,935,978,883,762,503,925,878,735,993,885,939,994,980,926,764,941,967,886,831,947,507,889,984,751,942,996,
971,890,509,949,973,1000,892,950,863,759,1008,510,979,953,763,974,954,879,981,982,927,995,765,956,887,985,997,986,943,891,998,766,
511,988,1001,951,1002,893,975,894,1009,955,1004,1010,957,983,958,987,1012,999,1016,767,989,1003,990,1005,959,1011,1013,895,1006,1014,1017,1018,
991,1020,1007,1015,1019,1021,1022,1023};


int i=0,k,j;
int K=200,N=1024,flag=0;
printf("Enter the no of message bits : ");
//scanf("%d",&K);
printf("Enter the no of bits to be coded (N>K) and N should be in 2^n :");
//scanf("%d",&N);
int n12=log2(N);
int Q[N];
int result[N];
for(j=0;j<1024;j++)
{
    if(Q1[j]<N)
    {
        Q[i]=Q1[j];
        i++;
    }
}
int m[K];

for(i=0;i<K;i++)
{
    m[i]=1;
}
int u[N];
for(i=0;i<N;i++)
{
    u[i]=0;
}
for(j=0;j<K;j++)
{
    u[Q[N-K+j]]=m[j];
}
for(i=0;i<N;i++)
{
    result[i]=u[i];
}
for(i=0;i<N;i++)
{
	printf("%d",result[i]);
}



int m1=1;
int d,a[N],b[N],ress[N],conc[N];
int index,index1,index2,index3;

for(d=n12-1;d>=0;d--)
{
	for(i=0;i<N;i=i+2*m1)
	{
		index=0;
		for(k=i;k<i+m1;k++)
		{
			a[index]=u[k];
			index++;
		}



		index1=0;
		for(k=i+m1;k<i+2*m1;k++)
		{
			b[index1]=u[k];
			index1++;
		}
		for(k=0;k<m1;k++)
		{
			ress[k]=a[k]^b[k];
		}
		index2=0;
		for(k=0;k<m1;k++)
		{
			conc[index2]=ress[k];
			index2++;
		}
		for(k=0;k<m1;k++)
		{
			conc[index2]=b[k];
			index2++;
		}
		index3=0;
		for(k=i;k<i+2*m1;k++)
		{
			u[k]=conc[index3];
			index3++;
		}
	}
	m1=m1*2;
}

printf("\n");
printf("The encoded signal is :");
for(i=0;i<N;i++)
{
	printf("%d",conc[i]);
}
printf("\n");











int bpsk[N];
for(i=0;i<N;i++)
{
	bpsk[i]=1-2*conc[i];

}
printf("BPSK signal is : ");
for(i=0;i<N;i++)
{
	printf("%d",bpsk[i]);
}


int F[N];
for(i=0;i<N-K;i++)
{
	F[i]=Q[i];
}
printf("\n F is : \n");
for(i=0;i<N-K;i++)
{
	printf("%d",F[i]);
}

int ns[N];
for(i=0;i<2*N;i++)
{
	ns[i]=0;
}
printf("\n ns is : \n");
for(i=0;i<2*N;i++)
{
	printf("%d",ns[i]);
}

int L[n12+1][N];
int ucap[n12+1][N];
for(i=0;i<n12+1;i++)
{
	for(j=0;j<N;j++)
	{
		ucap[i][j]=0;
	}
}
for(i=0;i<n12+1;i++)
{
	for(j=0;j<N;j++)
	{
		L[i][j]=0;
	}
}
for(i=0;i<1;i++)
{
	for(j=0;j<N;j++)
	{
		L[0][j]=bpsk[j];
	}
}
printf("\n");
printf("L is  : ");
printf("\n");
for(i=0;i<n12+1;i++)
{
	for(j=0;j<N;j++)
	{
		printf(" %d ",L[i][j]);

	}
	printf("\n");
}




int node,depth,done;
node=0;
depth=0;
done=0;
flag=0;
int npos;
int Ln[N];
int temp;
int *a1,*b1;
a1 = (int *)malloc(N * sizeof(int));
b1 = (int *)malloc(N * sizeof(int));
int lnode,ldepth,ltemp,cdepth,rnode,ctemp;
int ucapn[N];
int c1[N];
int *x;
int *y;
int e[N];
int ucapl[N];
int ucapr[N];
int a11[N];
int res[N];
while(done==0)
{
	printf("\nDepth is : %d\n",depth);
	if(depth==n12)
	{
		printf("Leaf node\n");

		for(i=0;i<N-K;i++)
		{
			if(F[i]==node)
			{
				flag=1;
				break;
			}
		}
			if(flag==1)
			{
				ucap[n12][node]=0;
				flag=0;
			}

			else 
			{
				if(L[n12][node]>=0)
				{
					ucap[n12][node]=0;
				}

				else
				{
					ucap[n12][node]=1;
				}
			}
			if(node==N-1)
			{
				done=1;
			}
			else
			{
				node=(int)(node/2);
				depth=depth-1;
			}
			printf("\nucap is :\n");
			for(i=0;i<n12+1;i++)
			{
				for(j=0;j<N;j++)
				{
					printf("%d",ucap[i][j]);
				}
				printf("\n");
			}
	}
	else
	{
		npos=pow(2,depth)-1+node;
		printf("\nnpos is : %d\n",npos);
			if(ns[npos]==0)
			{
				printf("Left node\n");
				printf("\nnode is %d\n",node);	
				temp=pow(2,(n12-depth));
				int index4=0;
				for(i=temp*node;i<temp*node+temp;i++)
				{
					Ln[index4]=L[depth][i];
					index4++;
				}
				printf("\nLn is \n");
				for(i=0;i<index4;i++)
				{
					printf("%d",Ln[i]);
				}

				for(i=0;i<temp/2;i++)
				{
					a1[i]=Ln[i];

				}
				printf("\na1 is : \n");
				for(i=0;i<temp/2;i++)
				{
					printf("%d",a1[i]);

				}
				int index15=0;
				for(i=temp/2;i<temp;i++)
				{
					b1[index15]=Ln[i];
					index15++;
				}
				printf("\nb1 is : \n");
				for(i=0;i<index15;i++)
				{
					printf("%d",b1[i]);

				}
				node=node*2;
				depth=depth+1;
				temp=(int)temp/2;
				x=f(a1,b1,c1,temp);
				int index8=0;
				for(i=temp*node;i<temp*node+temp;i++)
				{
					L[depth][i]=x[index8];
					index8++;
				}
				printf("\n");
				printf("L is  : ");
				printf("\n");
				for(i=0;i<n12+1;i++)
				{
					for(j=0;j<N;j++)
					{
						printf(" %d ",L[i][j]);

					}
					printf("\n");
				}

				printf("\n x is \n");
				for(i=0;i<index8;i++)
				{
					printf("%d",x[i]);
				}
				ns[npos]=1;
			}  
			else
			{
				if(ns[npos]==1)
				{
				printf("right node\n");
				printf("\nnode is %d\n",node);	
				temp=pow(2,n12-depth);
				int index5=0;
				printf("\n node is :%d\n",node);

				for(i=temp*node;i<temp*node+temp;i++)
				{
					Ln[index5]=L[depth][i];
					index5++;
				}
				printf("\n Ln is \n");
				for(i=0;i<index5;i++)
				{
					printf("%d",Ln[i]);
				}
				for(i=0;i<temp/2;i++)
				{
					a1[i]=Ln[i];
				}
				printf("\n a1 is :\n");
				for(i=0;i<temp/2;i++)
				{
					printf("%d",a1[i]);
				}


				int index16=0;
				for(i=temp/2;i<temp;i++)
				{
					b1[index16]=Ln[i];
					index16++;
				}
				printf("\n b1 is : \n");
				for(i=0;i<index16;i++)
				{
					printf("%d",b1[i]);
				}
				lnode=2*node;
				ldepth=depth+1;
				ltemp=temp/2;
				int index6=0;
				for(i=ltemp*lnode;i<ltemp*(lnode+1);i++)
				{
					ucapn[index6]=ucap[ldepth][i];
					index6++;
				}
				printf("\nucapn is : \n");
				for(i=0;i<index6;i++)
				{
					printf("%d",ucapn[i]);
				}
				y=g(a1,b1,ucapn,e,temp/2);
				printf("\ny is :\n");
				for(i=0;i<temp/2;i++)
				{
					printf("%d",y[i]);
				}
				node=node*2+1;
				depth=depth+1;
				temp=temp/2;
				int index7=0;
				for(i=temp*node;i<temp*(node+1);i++)
				{
					L[depth][i]=y[index7];
					index7++;
				}
				printf("\nL is : \n");
				for(i=0;i<n12+1;i++)
				{
					for(j=0;j<N;j++)
					{
						printf(" %d ",L[i][j]);
					}
					printf("\n");
				}


				ns[npos]=2;
				}
				else
				{
					printf("Parent node\n");
					temp=pow(2,n12-depth);
					lnode=2*node;
					rnode=2*node+1;
					cdepth=depth+1;
					ctemp=temp/2;
					int index9=0;
					printf("\n node Is :%d\n",node);
					for(i=ctemp*lnode;i<ctemp*(lnode+1);i++)
					{
						ucapl[index9]=ucap[cdepth][i];
						index9++;
					}
					printf("\nucapl is : \n");
					for(i=0;i<index9;i++)
					{
						printf("%d",ucapl[i]);
					}
					int index10=0;
					for(i=ctemp*rnode;i<ctemp*(rnode+1);i++)
					{
						ucapr[index10]=ucap[cdepth][i];
						index10++;

					}
					printf("\nucapr is : \n");
					for(i=0;i<index9;i++)
					{
						printf("%d",ucapr[i]);
					}

					int index11=0;
					for(i=0;i<index10;i++)
					{
						a11[i]=ucapl[i]^ucapr[i];
				
					}
					printf("\na11 is : \n");
					for(i=0;i<index9;i++)
					{
						printf("%d",a11[i]);
					}
					int index12=0;
					for(i=0;i<index10;i++)
					{
						res[index12]=a11[i];
						index12++;
					}
					int index13=0;
					for(i=0;i<index10;i++)
					{
						res[index12]=ucapr[i];
						index12++;
						index13++;
					}
					printf("\nres is : \n");
					for(i=0;i<index12;i++)
					{
						printf("%d",res[i]);
					}
					int index14=0;
					for(i=temp*node;i<temp*(node+1);i++)
					{
						ucap[depth][i]=res[index14];
						index14++;
					}
					printf("\nucap is : \n");
					for(i=0;i<n12+1;i++)
					{
						for(j=0;j<N;j++)
						{
						printf("%d",ucap[i][j]);
						}
						printf("\n");
					}
					node=(int)node/2;
					depth=depth-1;

	
				}
			}
	}
}
printf("\n Final L is :\n");
for(i=0;i<n12+1;i++)
{
	for(j=0;j<N;j++)
	{
		printf("%d",L[i][j]);
	}
	printf("\n");
}
printf("\nns is \n");
for(i=0;i<2*N;i++)
{
	printf("%d",ns[i]);
}
printf("\nThe decoded signal is : \n");
for(i=0;i<n12+1;i++)
{
	for(j=0;j<N;j++)
	{
		printf("%d",ucap[i][j]);
	}
	printf("\n");
}
int man[N];
for(i=0;i<N;i++)
{
	man[i]=ucap[n12][i];
}
printf("\n");
for(i=0;i<N;i++)
{
	printf("%d",man[i]);
}
int decoded[K];
int index20=0;
for(i=N-K;i<N;i++)
{
	decoded[index20]=man[Q[i]];
	index20++;
}
printf("\nThe decoded signal is :\n");
for(i=0;i<index20;i++)
{
	printf("%d",decoded[i]);
}





return 0;
}
