CREATE (k2052:Curso {codigo:'K2052', profe: 'Dodain'})
CREATE (fede:Alumno {nombre:'Federico Cano', legajo: 138630})
CREATE (orne:Alumno {nombre:'Ornella Bordino', legajo: 138227})
CREATE (solo:Alumno {nombre:'Ariel Solomianski', legajo: 143853})
CREATE (carod:Alumno {nombre:'Carolina D Alfonso', legajo: 146183})
CREATE (vero:Alumno {nombre:'Verónica Reinoso', legajo: 125029})
CREATE (mpaz:Alumno {nombre:'María Paz Bondarenco', legajo: 144664})
CREATE (paula:Alumno {nombre:'Paula Guarasci', legajo: 140641})
CREATE (esteban:Alumno {nombre:'Esteban Wasinger', legajo: 143929})
CREATE (caroh:Alumno {nombre:'Carolina Heredia', legajo: 144698})
CREATE 
  (fede)-[:SALE_CON]->(orne),
  (caroh)-[:SALE_CON]->(esteban),
  (fede)-[:CURSA {grupo: 9, notas: [2]}]->(k2052),
  (orne)-[:CURSA {grupo: 9, notas: [2]}]->(k2052),
  (solo)-[:CURSA {grupo: 9, notas: [9]}]->(k2052),
  (carod)-[:CURSA {grupo: 9, notas: [7]}]->(k2052),
  (vero)-[:CURSA {grupo: 3, abandono: true, notas: [2]}]->(k2052),
  (mpaz)-[:CURSA {grupo: 3, abandono: true, notas: [2]}]->(k2052),
  (paula)-[:CURSA {grupo: 3, notas: [2]}]->(k2052),
  (esteban)-[:CURSA {grupo: 3, notas: [8]}]->(k2052),
  (caroh)-[:CURSA {grupo: 3, notas: [6]}]->(k2052)
