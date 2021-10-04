	#include "stdlib.h"

	void main (){

		int * start = malloc(25 * sizeof(int));

		fill(start, 25);
		insertionSort(start,25);

	}

	insertSortedPos(int * addr, int pos, int final){

	 int unsorted = *(addr + pos);

	 int newPos = findSortedPos(addr, unsorted, final)

	  ShiftRight(addr, newPos, final);

	  *(addr +newPos) = unsorted;
	}

	int findSortedPos(int * addr, int val, int final){

		int i;

		for (i = 0; i < final; i++) {
			  if (*(addr + i) >= val){
	     		 break;
				}
			}
	  return i;
	}
	InsertionSort(int * addr, length){

	  for (int i = 1; i < length - 1; i++){
			InsertSortedPos(addr, i, length-1);
		}
	}

	void fill(int * addr, int lenght) {
		for (int i = 0; i < lenght; i++){
			*addr = lenght - i;
			addr++;
		}
	}

	void ShiftRight(int * addr, int pos, int final){
		int curr = *(addr + pos);
		while (pos < final){
			pos = pos + 1;
			int temp = curr;
			curr = *(addr + pos);
			*(addr + pos) = temp;
		}
	}
