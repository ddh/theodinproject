class Calculator {
    constructor(previousOperandTextElement, currentOperandTextElement) {
        this.previousOperandTextElement = previousOperandTextElement;
        this.currentOperandTextElement = currentOperandTextElement;
        this.clear();
        this.readyToReset = false;
    }

    clear() {
        this.currentOperand = '';
        this.previousOperand = '';
        this.operation = undefined;
    }

    delete(){
        this.currentOperand = this.currentOperand.toString().slice(0, -1);
    }

    appendNumber(number){
        if (number === '.' && this.currentOperand.includes('.')) return
        this.currentOperand = this.currentOperand.toString() + number.toString();

    }

    chooseOperation(operation){
        if (this.currentOperand === '' ) return;
        if(this.previousOperand !== ''){
            this.compute();
        }
        this.operation = operation;
        this.previousOperand = this.currentOperand;
        this.currentOperand = '';
    }    

    compute() {
        let computation;
        const prev = parseFloat(this.previousOperand);
        const current = parseFloat(this.currentOperand);
        if (isNaN(prev) || isNaN(current)) return
        switch (this.operation){
            case '+' :
                computation = prev + current;
                break;
            case '-' :
                computation = prev - current;
                break;
            case '×' : 
                computation = prev * current;
                break;
            case '÷' :
                computation = prev / current;
                break;
            case '*' : 
                computation = prev * current;
                break;
            default :
                return;
        }
        this.readyToReset = true;
        this.currentOperand = computation;
        this.operation = undefined;
        this.previousOperand = '';
    }

    getDisplayNumber(number) {
        const stringNumber = number.toString();
        const integerDigits = parseFloat(stringNumber.split('.')[0]);
        const decimalDigits = stringNumber.split('.')[1];
        let integerDisplay;
        if (isNaN(integerDigits)) {
            integerDisplay = '';
        }
        else {
            integerDisplay = integerDigits.toLocaleString('en', { maximumFractionDigits: 0 })
        }
        if (decimalDigits != null){
            return `${integerDisplay}.${decimalDigits}`;
        }
        else{
            return integerDisplay;
        }
    }

    updateDisplay() {
        this.currentOperandTextElement.innerText = this.getDisplayNumber(this.currentOperand);
        if (this.operation != null) {
        this.previousOperandTextElement.innerText =
         `${this.getDisplayNumber(this.previousOperand)} ${this.operation}`;
        }
        else {
            this.previousOperandTextElement.innerText = "";
        }
    }
}

const operationButtons = document.querySelectorAll('[data-operation]');
const numberButtons = document.querySelectorAll('[data-number]');
const allClearButton = document.querySelector('[data-all-clear]');
const equalButton = document.querySelector('[data-equal]');
const deleteButton = document.querySelector('[data-delete]');
const previousOperandTextElement = document.querySelector('[data-previous-operand]');
const currentOperandTextElement = document.querySelector('[data-current-operand]');

const operators = "+-*/";

const calculator = new Calculator(previousOperandTextElement, currentOperandTextElement);

numberButtons.forEach(button => {
    button.addEventListener('click', () => {
        if (calculator.previousOperand === "" && calculator.currentOperand !== "" && calculator.readyToReset) {
            calculator.currentOperand = "";
            calculator.readyToReset = false;
        }
        if (calculator.currentOperand.length > 12) return;
        calculator.appendNumber(button.innerText);
        calculator.updateDisplay();
    });
});

window.addEventListener('keydown', function(e) {
    if (isNaN(e.key) == false || e.key === ".")
    {
        if (calculator.previousOperand === "" && calculator.currentOperand !== "" && calculator.readyToReset) {
            calculator.currentOperand = "";
            calculator.readyToReset = false;
        }
        if (calculator.currentOperand.length > 12) return;
        calculator.appendNumber(e.key);
        calculator.updateDisplay();
    }
    else return
});

operationButtons.forEach(button => {
    button.addEventListener('click', () => {
        calculator.chooseOperation(button.innerText);
        calculator.updateDisplay();
    });
});

window.addEventListener('keydown', function(e){
    if (operators.includes(e.key))
    {
        calculator.chooseOperation(e.key);
        calculator.updateDisplay();
    }
    if (e.key == "*") {
        calculator.chooseOperation('×');
        calculator.updateDisplay();
    }
    else return
});

allClearButton.addEventListener('click', () => {
    calculator.clear();
    calculator.updateDisplay();
});

window.addEventListener('keydown', function(e){
    console.log(e.key)
    if (e.key == "Escape")
    {
        calculator.clear();
        calculator.updateDisplay();
    }
    else return
});

equalButton.addEventListener('click', button => {
    calculator.compute();
    calculator.updateDisplay();
})

window.addEventListener('keydown', function(e){
    if (e.key == "Enter")
    {
        calculator.compute();
        calculator.updateDisplay();
    }
    else return
});

deleteButton.addEventListener('click', () => {
    calculator.delete();
    calculator.updateDisplay();
});

window.addEventListener('keydown', function(e){
    if (e.key == "Backspace")
    {
        calculator.delete();
        calculator.updateDisplay();
    }
    else return
});