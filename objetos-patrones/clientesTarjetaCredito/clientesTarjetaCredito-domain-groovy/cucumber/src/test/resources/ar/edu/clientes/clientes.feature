Feature: Clientes de Tarjeta de Crédito

Scenario: un cliente comun paga
	Given un cliente con un saldo de 40 
	When compra algo de 25
	Then le queda 15 de saldo

	
Scenario: un cliente safe shop paga
	Given un cliente con un saldo de 40
	And safe shop con monto maximo de 20
	When compra algo de 15
	Then le queda 25 de saldo