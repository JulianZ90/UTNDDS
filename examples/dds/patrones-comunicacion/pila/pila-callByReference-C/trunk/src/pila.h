/*
 * pila.h
 *
 *  Created on: 11/06/2014
 *      Author: Fernando
 */

#ifndef PILA_H_
#define PILA_H_

#define SIZE        50
#define MAX_SIZE    SIZE - 1
#define EMPTY_STACK -1

typedef struct stack {
	int current, stack[SIZE];
} stack;

stack* empty();
void free_stack(stack* pila);
void push(stack* pila, int value);
void pop(stack* pila);
int top(stack* pila);
int size(stack* pila);

#endif /* PILA_H_ */
