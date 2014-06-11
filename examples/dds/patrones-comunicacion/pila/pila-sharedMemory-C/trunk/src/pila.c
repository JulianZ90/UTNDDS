/*
 * pila.c
 *
 *  Created on: 27/06/2013
 *      Author: Fernando
 */
#include <stdio.h>
#define SIZE 50

int current, stack[SIZE];

void init() {
	current = 0; /* initialize current */
}

void push(int i) {
	if (current == SIZE) {
		printf("Stack Overflow.\n");
		exit(1);
	}
	current++;
	stack[current] = i;
}

int pop(void) {
	if (current == 0) {
		printf("Stack Underflow.\n");
		exit(2);
	}
	int elementPopped = top();
	current--;
	return elementPopped;
}

int top(void) {
	return stack[current];
}

int main(void) {
	init();

	push(10);
	push(49);
	pop();
	printf("value on top is %d\n", top());
	return 0;
}

