/*
 * pilaTest.c
 *
 *  Created on: 11/06/2014
 *      Author: Fernando
 */

#include <assert.h>
#include <setjmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "CuTest.h"
#include "../src/pila.h"

/********************************************************************
 *  FUNCIONES INTERNAS
 *********************************************************************/
void TestPilaVaciaNoTieneElementos(CuTest* tc) {
	stack* pila = empty();
	CuAssert(tc, "elemento de una lista vacía", size(pila) == 0);
}

void TestPilaApiloYDesapilo(CuTest* tc) {
	stack* pila = empty();
	push(pila, 10);
	push(pila, 49);
	pop(pila);
	CuAssert(tc, "push 10, push 49, pop", top(pila) == 10);
}

CuSuite* CuGetPilaSuite(void) {
	CuSuite* suite = CuSuiteNew();
	SUITE_ADD_TEST(suite, TestPilaVaciaNoTieneElementos);
	SUITE_ADD_TEST(suite, TestPilaApiloYDesapilo);
	return suite;
}

//int main(void) {
//	stack* pila = empty();
//	push(pila, 10);
//	push(pila, 49);
//	pop(pila);
//	printf("El tope es %d\n", pop(pila));
//	printf("end\n");
//	return 0;
//}

