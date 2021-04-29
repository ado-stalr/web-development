function init() {
  const resultStr = 'Result: ';

  let firstTask1Button = document.getElementById('task1_1');
  let firstTask2Button = document.getElementById('task1_2');
  let secondTaskButton = document.getElementById('task2');

  let firstTask1Input = document.getElementById('input_task1_1');
  let firstTask2Input = document.getElementById('input_task1_2');
  let secondTaskInput = document.getElementById('input_task2');

  let firstTask1Result = document.getElementById('result_task1_1');
  let firstTask2Result = document.getElementById('result_task1_2');
  let secondTaskResult = document.getElementById('result_task2');

  function runFirstTask1() {
    let value = firstTask1Input.value;
    let number = (parseFloat(value) === 0) ? 0 : parseFloat(value) || value;

    firstTask1Result.innerHTML = resultStr + isPrimeNumber(number);
  }

  function runFirstTask2() {
    let arr = firstTask2Input.value.split(',').map(n => (parseFloat(n) === 0) ? 0 : parseFloat(n) || n);

    firstTask2Result.innerHTML = resultStr + isPrimeNumber(arr).map(x => '' + x).join(', ');
  }

  function runSecondTask() {
    secondTaskResult.innerHTML = resultStr + String( calc(secondTaskInput.value) );
  }

  firstTask1Button.onclick = runFirstTask1;
  firstTask2Button.onclick = runFirstTask2;
  secondTaskutton.onclick = runSecondTask;
}

init();