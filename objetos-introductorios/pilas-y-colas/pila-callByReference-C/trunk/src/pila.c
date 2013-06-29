/*
 * pila.c
 *
 *  Created on: 28/06/2013
 *      Author: Fernando
 */
/*
 * pila.c
 *
 *  Created on: 28/06/2013
 *      Author: Fernando
 */
#include <stdio.h>
#include <stdlib.h>
#define SIZE 50

typedef struct stack {
	int current, stack[SIZE];
} stack;

stack* empty() {
	stack* pila = (stack*) malloc(sizeof(stack));
	pila->current = 0;
	return pila;
}

void push(stack* pila, int i) {
	if (pila->current == SIZE) {
		printf("Stack Overflow.\n");
		exit(1);
	}
	pila->current++;
	pila->stack[pila->current] = i;
}

int pop(stack* pila) {
	if (pila->current == 0) {
		printf("Stack Underflow.\n");
		exit(1);
	}
	pila->current--;
	return pila->stack[pila->current];
}

int main(void) {
	stack* pila = empty();
	push(pila, 10);
	push(pila, 49);
	printf("El tope es %d\n", pop(pila));
	printf("end\n");
	return 0;
}

