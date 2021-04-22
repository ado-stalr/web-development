function init() {
  const resultStr = 'Result: ';

  let task1_1_button = document.getElementById('task1_1');
  let task1_2_button = document.getElementById('task1_2');
  let task2_button = document.getElementById('task2');

  let task1_1_input = document.getElementById('input_task1_1');
  let task1_2_input = document.getElementById('input_task1_2');
  let task2_input = document.getElementById('input_task2');

  let task1_1_result = document.getElementById('result_task1_1');
  let task1_2_result = document.getElementById('result_task1_2');
  let task2_result = document.getElementById('result_task2');

  function runTask1_1() {
    let value = task1_1_input.value;
    let number = (parseFloat(value) === 0) ? 0 : parseFloat(value) || value;

    task1_1_result.innerHTML = resultStr + isPrimeNumber(number);
  }

  function runTask1_2() {
    let arr = task1_2_input.value.split(',').map(n => (parseFloat(n) === 0) ? 0 : parseFloat(n) || n);

    task1_2_result.innerHTML = resultStr + isPrimeNumber(arr).map(x => '' + x).join(', ');
  }

  function runTask2() {
    task2_result.innerHTML = resultStr + String( calc(task2_input.value) );
  }

  task1_1_button.onclick = runTask1_1;
  task1_2_button.onclick = runTask1_2;
  task2_button.onclick = runTask2;
}

init();