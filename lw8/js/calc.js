const uncorrectSimbolsRegexp = /[^\s\d\.\,\(\)\+\-\/\*]/;
const onlyNumberRegexp = /^\s*([-]?[0-9]+(?:[.,][0-9]+)?)\s*$/;
const simpleExpressionRegexp = /([\+\-\*\/])\s+([-]?[0-9]+(?:[.,][0-9]+)?)\s+([-]?[0-9]+(?:[.,][0-9]+)?)/;
const expressionInBracketsRegexp = /\(([\s\d\.\,\+\-\/\*]+)\)/;

function calc(string, isRecursiveCalling = false) {
  let wasError = false;

  if (simbol = string.match(uncorrectSimbolsRegexp) ) {
    console.log(`Expression has unallowed simbols! "${simbol}"`);
    return null;
  }

  string = string.replaceAll(',', '.');

  while ( bracketsExpression = string.match(expressionInBracketsRegexp) ) {
    let result = calc(bracketsExpression[1], true);
    if (result === null) {
      wasError = true;
      break;
    }
    string = string.replace(expressionInBracketsRegexp, ` ${result} `);
  }

  while ( !wasError && (matches = string.match(simpleExpressionRegexp)) ) {
    let result = calcSimpleExpression(matches[1], matches[2], matches[3]);

    if (result === null) {
      wasError = true;
      break;
    }
    string = string.replace(simpleExpressionRegexp, ` ${result} `);
  }

  if (!wasError && (onlyNumber = string.match(onlyNumberRegexp)) ) {
    if (!isRecursiveCalling) console.log(parseFloat(onlyNumber[1]));
    return parseFloat(onlyNumber[1]);
  } else {
    if (!wasError) console.log('Uncorrect expression! ', string);
    return null;
  }
}

function calcSimpleExpression(operator, x, y) {
  let result = null;
  switch (operator) {
    case '*':
      result = parseFloat(x) * parseFloat(y);
      break;
    case '/':
      if (parseFloat(y) !== 0) {
        result = parseFloat(x) / parseFloat(y);
      } else {
        console.log(`Dividing by zero is not allowed! "${x} ${operator} ${y}"`);
        result = null;
      }
      break;
    case '-':
      result = parseFloat(x) - parseFloat(y);
      break;
    case '+':
      result = parseFloat(x) + parseFloat(y);
      break;
  }
  return result;
}