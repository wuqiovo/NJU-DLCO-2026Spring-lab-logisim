// #include "trap.h"

#define N 20

int a[N] = {20000, 120000, 1400000000, 6000000, 1300000, 1500, 160000000, 100000, 0, 180000, 11000, 190000000, 90000, 1000, 70, 50, 400000, 3000000, 8000, 170};

void bubble_sort() {
	int i, j, t;
	for(j = 0; j < N; j ++) {
		for(i = 0; i < N - 1 - j; i ++) {
			if(a[i] > a[i + 1]) {
				t = a[i];
				a[i] = a[i + 1];
				a[i + 1] = t;
			}
		}
	}
}

int main() {
	bubble_sort();
	return 0;
}
