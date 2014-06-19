/*
 * pila.h
 *
 *  Created on: 11/06/2014
 *      Author: Fernando
 */

#ifndef PILA_H_
#define PILA_H_

#define SIZE 50

typedef struct stack {
	int current, stack[SIZE];
} stack;

stack* empty();
void push(stack* pila, int value);
void pop(stack* pila);
int top(stack* pila);
int size(stack* pila);

#endif /* PILA_H_ */
