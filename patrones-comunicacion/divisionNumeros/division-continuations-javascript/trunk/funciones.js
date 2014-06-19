function divisionTryCatch(dividendo, divisor, anteExito, anteFalla) {
	if (divisor == 0)
		anteFalla("el divisor debe ser distinto de cero");
	else 
		anteExito(dividendo / divisor);
}

function dividir() {
	divisionTryCatch
		($("dividendo").value,  // parámetro 1 
		$("divisor").value,     // parámetro 2
		function(res) {
			$("mensaje").innerHTML = "El resultado es " + res;
		},                		// parámetro 3: construyo una lambda anónima
		muestraError);     		// parámetro 4: paso una función existente
}

function $(id) {
	return document.getElementById(id);
}

function muestraError(ex) {
	$("mensaje").innerHTML = "";
	alert("Error al dividir: " + ex);
}