/*
 * pila.c
 *
 *  Created on: 28/06/2013
 *      Author: Fernando
 */
#include <stdio.h>
#include <stdlib.h>
#include "pila.h"

stack* empty() {
	stack* pila = (stack*) malloc(sizeof(stack));
	pila->current = 0;
	return pila;
}

void push(stack* pila, int value) {
	if (pila->current == SIZE) {
		printf("Stack Overflow.\n");
		exit(1);
	}
	pila->current++;
	pila->stack[pila->current] = value;
}

int top(stack* pila) {
	if (pila->current == 0) {
		printf("Empty stack.\n");
		exit(3);
	}
	return pila->stack[pila->current];
}

int pop(stack* pila) {
	if (pila->current == 0) {
		printf("Stack Underflow.\n");
		exit(2);
	}
	int elementPopped = top(pila);
	pila->current--;
	return elementPopped;
}

int size(stack* pila) {
	return pila->current;
}
