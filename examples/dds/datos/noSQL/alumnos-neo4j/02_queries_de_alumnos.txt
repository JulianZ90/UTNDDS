-- Quiénes están de novio
MATCH (a)-[:SALE_CON]->(b) RETURN a,b;

-- Quiénes dejaron "la materia" (en realidad es el curso)
MATCH (a)-[:CURSA {abandono: true}]->(b) RETURN a,b;

-- no todos tienen la property

-- Quiénes están en el grupo 9
MATCH (a)-[:CURSA {grupo: 9}]->(b) RETURN a,b;

-- Quiénes cursan K2052
MATCH (a)-[:CURSA]->(b) RETURN a,b;

-- Sólo los nodos
MATCH (a)-[:CURSA]->(b) RETURN a;

-- Para dar de alta la relación bidireccional
MATCH (a {legajo: 143929}),(b {legajo: 144698}) CREATE (a)-[:SALE_CON]->(b);

-- Para dar de baja una relación
MATCH (a {legajo: 138227})-[r:SALE_CON]->(b) DELETE r;
