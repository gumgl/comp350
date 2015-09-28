#include<stdio.h>
#include<math.h>
/* Guillaume Labranche 260585371
 * COMP 350 Fall 2015, McGill University
 * Assignment 1, Question 3 */

void naive(int x_0, int n_max) {
	int n;
	double x_n = (double) x_0;
	double l = log(x_0 + 1.0f);
	double pow2n = 1.0f;
	
	printf("BEGIN naive seq x0=%i, n=1,...,%i\n", x_0, n_max);
	
	for (n = 0; n < n_max; n = n + 1) {
		double x_next = 2 * pow2n * (sqrt(1 + x_n / pow2n) - 1);
		double p = x_next - l;
		
		//printf("x%i = %.16f, x%i-ln(x0+1) = %.16f\n", n+1, x_next, n+1, p);
		printf("$%i$ & $%.16f$ & $%.16f$ \\\\ \n \\hline\n", n+1, x_next, p);
		x_n = x_next;
		pow2n *= 2;
	}
	
	printf("END sequence\n");
}

void improved(int x_0, int n_max) {
	int n;
	double x_n = (double) x_0;
	double l = log(x_0 + 1.0f);
	double pow2n = 1.0f;
	
	printf("BEGIN improved seq x0=%i, n=1,...,%i\n", x_0, n_max);
	
	for (n = 0; n < n_max; n = n + 1) {
		double x_next = 2 * x_n / (sqrt(1 + x_n / pow2n) + 1);
		double p = x_next - l;
		
		//printf("x%i = %.16f, x%i-ln(x0+1) = %.16f\n", n+1, x_next, n+1, p);
		printf("$%i$ & $%.16f$ & $%.16f$ \\\\ \n \\hline\n", n+1, x_next, p);
		x_n = x_next;
		pow2n *= 2;
	}
	
	printf("END sequence\n");
}

int main() {
	naive(1, 60);
	improved(1, 60);
	
	return 0;
}