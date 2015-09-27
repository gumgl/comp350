#include<stdio.h>
/* Guillaume Labranche 260585371
 * COMP 350 Fall 2015, McGill University
 * Assignment 1, Question 2 */

void student() {
	int n;
	float prev_x = 100.0f;
	for (n=2; n <= 70; n=n+1) {
		float new_x = (100.0f * prev_x) / ((float) n);
		
		printf("x_%i = %f\n", n, new_x);
		prev_x = new_x;
	}
}

void bonus() {
	int n;
	double prev_x = 100.0f;
	for (n=2; n <= 3000; n=n+1) {
		double new_x = (100.0f * prev_x) / ((double) n);
		
		printf("x_%i = %f\n", n, new_x);
		prev_x = new_x;
	}
}

int main() {
	student();
	bonus();
	
	return 0;
}