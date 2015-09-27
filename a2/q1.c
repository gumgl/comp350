#include<stdio.h>

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
}

int main() {
	q1float();
	q1double();
	
	return 0;
}