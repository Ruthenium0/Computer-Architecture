import java.util.Random;
public class Main {
    
    static void sort(int size, int Array[][])
{ 
    int tmp;
    int R = size - 1;
    boolean flag = true;
    while(flag == true)
    {
        flag = false;
    for (int i = 0; i < R; ++i) 
      {  
       if(Array[i+1][size-2-i]>Array[i][size-1-i])
    	                 {
    			tmp = Array[i+1][size-2-i];
    		Array[i+1][size-2-i] = Array[i][size-1-i];
    			 Array[i][size-1-i] = tmp;
    			  flag = true;
		            	 }
          
      }
	     R--;
    }
}
  public static void main(String[] args) {
   Random rand = new Random();
    int size = 5;
  int[][] Array = new int[size][size];
  System.out.println("Array with unsorted secondary diagonal of matrix: ");
  for (int i = 0; i < Array.length; ++i) {
      for(int j = 0; j < Array[i].length; ++j) {
         Array[i][j] =  rand.nextInt(1000);
        System.out.print(Array[i][j] + " ");
      }
        System.out.println();
    }
    
    sort(size,Array);
    System.out.println("Array with sorted secondary diagonal of matrix: ");
  

  for (int i = 0; i < Array.length; ++i) {
      for(int j = 0; j < Array[i].length; ++j) {
        
        System.out.print(Array[i][j] + " ");
      }
        System.out.println();
    }
        
    }
  }
