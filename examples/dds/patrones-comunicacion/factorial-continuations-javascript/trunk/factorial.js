function factorial(n,anteExito,anteFalla) {
 if (n < 0)
   anteFalla("n es " + n + " , n debe ser > 0");
 else if (n == 0)
   anteExito(1);
 else
   factorial(n-1,
        function (t0) {
          anteExito(n*t0) ;
        },
        anteFalla);
}

function total_fact (n,anteExito) {
  factorial (n,anteExito,
    function (ex) {
      document.getElementById("mensaje").innerHTML = "";
      alert("Llamaste mal a factorial porque " + ex) ;
    }) ;
}

function factorialOk() {
    total_fact(5, function (res) {
       document.getElementById("mensaje").innerHTML = "Factorial de 5 es: " + res
    }) ;
}

function factorialConError() {
    total_fact(-1, function (res) {
       document.getElementById("mensaje").innerHTML = "Factorial de -1 es: " + res
    }) ;
}

function mostrarResultado(res) {
	return function (res)  {
       document.getElementById("mensaje").innerHTML = "Factorial es: " + res
    }
}
