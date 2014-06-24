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
	pila->current = EMPTY_STACK;
	return pila;
}

void free_stack(stack* pila) {
	free(pila);
}

void push(stack* pila, int value) {
	if (pila->current == MAX_SIZE) {
		printf("Stack Overflow.\n");
		exit(1);
	}
	pila->current++;
	pila->stack[pila->current] = value;
}

void pop(stack* pila) {
	if (pila->current == EMPTY_STACK) {
		printf("Stack Underflow.\n");
		exit(2);
	}
	pila->current--;
}

int top(stack* pila) {
	if (pila->current == EMPTY_STACK) {
		printf("Empty stack.\n");
		exit(3);
	}
	return pila->stack[pila->current];
}

int size(stack* pila) {
	return pila->current;
}
