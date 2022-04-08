#include<stdio.h>
#include <stdlib.h>


int main()
{   int i,j;
	int const n = 4;
void sort(int, int  A[n][n]);

	   int A[n][n];
		for(  i = 0;i<n;i++)
	{    
    	for( j = 0;j<n;j++)
    	{    
	         A[i][j] = rand() % 100;
	          printf( "%d ", A[i][j]);
	          
}
printf("\n");
}
	printf("\n");
	sort(n,  A);

			for(  i = 0;i<n;i++)
	{    
    	for(  j = 0;j<n;j++)
    	{    
	         
	          printf( "%d ", A[i][j]);
	          
}
printf("\n");
}
	return 0;
}


void sort(int n, int  A[n][n])
{   int tmp,i,j;
     int R = n-1;
   _Bool flag = 1 ;
   while (flag == 1)  
          { flag = 0;
        
    	for(  i = 0;i<R;i++)
    	{
		
    		if(A[i+1][n-2-i]>A[i][n-1-i])
    	                 {
    			tmp = A[i+1][n-2-i];
    		A[i+1][n-2-i] = A[i][n-1-i];
    			 A[i][n-1-i] = tmp;
    			  flag = 1;
		            	 }}
	     R--;
	 
          	}
}
