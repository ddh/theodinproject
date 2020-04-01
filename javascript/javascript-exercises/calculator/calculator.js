function add (a, b) {
	return (a + b);
}

function subtract (a, b) {
	return (a - b);
}

function sum (array) {
	return array.reduce((a, b) => a + b, 0);
}

function multiply (array) {
	return array.reduce((a, b) => a * b, 1);
}

function power(...array) {
	return array.reduce((a, b) => Math.pow(a, b));
	
}

function factorial(n) {
	return (n != 1 && n != 0) ? n * factorial(n - 1) : 1;
}

module.exports = {
	add,
	subtract,
	sum,
	multiply,
    power,
	factorial
}