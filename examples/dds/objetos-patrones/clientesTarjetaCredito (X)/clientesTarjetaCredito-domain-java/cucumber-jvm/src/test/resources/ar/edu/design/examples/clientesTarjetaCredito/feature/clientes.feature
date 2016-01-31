Feature: Cliente pagando

  Scenario: Paying the expiration results in the client not being... moroso :P
  	Given a client with an initial amount of 50
  	When I ask him to pay an expiration of 50
  	Then the client must not be... eh... moroso
  	

	Scenario: El cliente paga y termina no siendo moroso
		Dado un cliente con deuda inicial de 50
		Cuando el cliente paga un vencimiento de 50
		Entonces el cliente no debe ser moroso