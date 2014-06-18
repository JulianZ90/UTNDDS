function factorialTryCatch(n, anteExito, anteFalla) {
	if (n < 0)
		anteFalla("n es " + n + " , n debe ser > 0");
	else if (n == 0)
		anteExito(1);
	else
		factorialTryCatch(n - 1, function(t0) {
			anteExito(n * t0);
		}, anteFalla);
}

function doFactorial(n, anteExito) {
	factorialTryCatch(n, anteExito, function(ex) {
		document.getElementById("mensaje").innerHTML = "";
		alert("Llamaste mal a factorial porque " + ex);
	});
}

function factorial(valor) {
	doFactorial(valor, function(res) {
		document.getElementById("mensaje").innerHTML = "Factorial de " + valor + " es: " + res
	});
}
