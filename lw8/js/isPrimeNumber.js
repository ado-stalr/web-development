function isPrimeNumber(parameter) {
  let isPrime;
  if ( Array.isArray(parameter) && parameter.length > 0 ) {
    isPrime = parameter.map(num => checkOneNumber(num));
  } else if ( typeof(parameter) === 'number' ) {
    isPrime = checkOneNumber(parameter);
  } else {
    console.log('Uncorrect input!');
    isPrime = null;
  }

  return isPrime;
}

function checkOneNumber(number) {
  if ( typeof(number) !== 'number' ) {
    console.log(`"${number}" isn\'t a number`);
    return null;
  }

  if ( !Number.isInteger(number) ) {
    console.log(number + ' isn\'t a integer number');
    return false;
  }

  let result = true;

  if (number < 0) {
    console.log(number + ' isn\'t a natural number');
    result = false;
  }

  if (number ===  0 || number === 1) {
    console.log(number + ' isn\'t a prime number');
    result = false;
  }

  for (let i = 2; i < number && result; i++) {
    if ( !(number % i) ) {
      console.log(number + ' is a composite number');
      result = false;
    }
  }

  if (result === true) console.log(number + ' is a prime number');

  return result;
}