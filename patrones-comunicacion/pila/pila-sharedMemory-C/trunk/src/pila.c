/*
 * pila.c
 *
 *  Created on: 27/06/2013
 *      Author: Fernando
 */
#include <stdio.h>
#define SIZE      50
#define MAX_SIZE  SIZE - 1

/** Estructura de datos global **/
int current, stack[SIZE];

void init() {
	current = 0;
}

int top(void) {
	return stack[current];
}

void push(int value) {
	if (current == MAX_SIZE) {
		printf("Stack Overflow.\n");
		exit(1);
	}
	current++;
	stack[current] = value;
}

void pop(void) {
	if (current == 0) {
		printf("Stack Underflow.\n");
		exit(2);
	}
	current--;
}

/** Tenemos un main, no varios tests porque al tener
 * mezcladas funciones que manejan una estructura global
 * es complicado mantener un estado local para cada test
 * (se puede, pero debemos asegurar que no corran en
 * paralelo y que al final de cada test se eliminen
 * los efectos sobre esa estructura global; además
 * no podemos manejar un "fixture" o juego de datos,
 * sólo podemos tener una estructura como casuística)
 */
int main(void) {
	init();
	push(10);
	push(49);
	pop();
	printf("value on top is %d\n", top());
	return 0;
}
