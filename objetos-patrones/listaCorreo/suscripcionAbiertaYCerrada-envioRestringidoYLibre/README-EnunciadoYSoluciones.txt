Las soluciones que están dentro de esta carpeta corresponden
a los requerimientos enunciados en el apunte "Las entradas
del diseño" https://docs.google.com/document/d/1qPM_sQ0UyGFKRzl13Cbf6zDKj6vxJ4wMZQIXeOrRvM8
--------Requerimientos------------
La lista de correo es una función especial del correo electrónico que permite la distribución de 
mensajes entre múltiples usuarios de Internet de forma simultánea. En una lista de correo, 
al enviar un mensaje a la dirección de la lista, éste llegará a la dirección de todas las personas 
inscriptas en ella. 

El sistema debe contemplar: 

Suscripción a la lista
Suscribir un nuevo miembro a una lista de correo. La suscripción puede ser definida como abierta 
(cualquiera que se suscribe es admitido) o cerrada (sólo los administradores pueden aceptar 
suscripciones).

Envío de mails
Enviar un correo, recibiendo la dirección de e-mail origen del correo, título y texto.  El envío 
de correos a la lista puede definirse como libre (cualquiera puede enviar correos a la lista) o 
restringido a los miembros de la lista. Cada usuario puede tener definida más de una dirección de 
e-mail, desde las que puede enviar mensajes a la(s) lista(s). De todas las direcciones de e-mail 
que tenga, una es a la que se le envían los mails. 

----------------------------------


Las soluciones que se plantean son  variantes a las enunciadas por el apunte:
 "Concepcion del diseño: un caso práctico" 
 https://docs.google.com/document/d/1qPM_sQ0UyGFKRzl13Cbf6zDKj6vxJ4wMZQIXeOrRvM8t
 
 Las variantes pasan por mostrar como la tecnología puede influir en el diseño.
 
 
 Solución: mixin-trait-herenciaMultiple
 Esta solución está hecha en escala y explota la capacidad de obtener comportamientos 
 de distintas clases. Usa los trait de escala (que en realidad son mixins), pero a 
 efectos del diseño da lo mismo hablar de trait, mixin o herencia múltiple.
 La instanciacion de los distintos tipos de lista son muy sencillas.
 
 Solución: strategy-bloques
 Esta solución usa xtend y tiene dos strategies(modo de envío y modo de suscripción)
 El modo de envío se escribe como bloques.
 La construcción se hace más compleja y se usa un factory
 
 Solución: feoDecorator
 Esta solución usa xtend. Tiene una herencia para el modo de suscripción y usa un decorator para
 el modo de envío. Como es tipado estáticamente y existen dos contratos a decorar (Lista abierta y Lista cerrada)
 La burocracia que agrega el decorator es desalentadora
 
 Solución: decoratorDinámico.
 Esta solución usa smalltalk. Al igual que la solución "feoDecorator" Tiene herencia por el modo de suscripcion
 y decora el modo de envío. Al ser tipado de chequeo dinámico e implícito sólo se necesita una clase decorator
 y nada más. Otra cosa interesante es que smalltalk tiene el método "become" en los objetos, que permiten
 decorar y desdecorar un objeto en cualquier momento (y no solo en la creación como se hace generalmente)
 
 Solución: openClass-DecoratorSimple
 Esta solución usa groovy. El modo de envío se resuelve con un decorator, pero a diferencia de la versión 
 de smalltalk, éste delega por default todos los métodos y escribe sólo el método que le interesa decorar
 (Esto también podría haber sido resuelto en smalltalk tocando el daesNotUnderstand).
 El modo de suscripción es un strategy hecho con bloques.
 Además, se usa openClass para agregarle la lista de miembros pendientes y los métodos aprobar y rechazar 
 a la lista que se quiere cerrado. (No hay herencia)
 
 
 
 
 
   