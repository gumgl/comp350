#include<stdio.h>
/* Guillaume Labranche 260585371
 * COMP 350 Fall 2015, McGill University
 * Assignment 1, Question 1 */


/* // I didn't see that the questions was asking about integers...
void q1float() {
	float x = 1.0f;
	
	while (1) {
		float tmp = 1 / x;
		if (tmp * x != 1.0f)
			break;
		else
			x = x / 2;
	}
	
	printf("x (float) = %E\n", x);
}
void q1double() {
	double x = 1.0f;
	
	while (1) {
		double tmp = 1 / x;
		if (tmp * x != 1.0f)
			break;
		else
			x = x / 2;
	}
	
	printf("x (double) = %E\n", x);
}*/

void q1float() {
	int i;
	float x, div;
	for (i=1; ; i=i+1) {
		x = (float) i;
		div = 1 / x;
		if (div * x != 1.0f)
			break;
	}
	
	printf("x (float) = %i\n", (int)x);
}
void q1double() {
	int i;
	double x, div;
	for (i=1; ; i=i+1) {
		x = (float) i;
		div = 1 / x;
		if (div * x != 1.0f)
			break;
	}
	
	printf("x (double) = %i\n", (int)x);
}

int main() {
	q1float();
	q1double();
	
	return 0;
}