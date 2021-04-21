const uncorrectSimbolsRegexp = /[^\s\d\.\,\(\)\+\-\/\*]/;
const onlyNumberRegexp = /^\s*([-]?[0-9]+(?:[.,][0-9]+)?)\s*$/;
const simpleExpressionRegexp = /([\+\-\*\/])\s+([-]?[0-9]+(?:[.,][0-9]+)?)\s+([-]?[0-9]+(?:[.,][0-9]+)?)/;
const expressionInBracketsRegexp = /\(([\s\d\.\,\+\-\/\*]+)\)/;

function calc(string) {
  if ( string.match(uncorrectSimbolsRegexp) ) {
    console.log('Expression has unallowed simbols!');
    return null;
  }

  string = string.replaceAll(',', '.');

  while ( bracketsExpression = string.match(expressionInBracketsRegexp) ) {
    let result = calc(bracketsExpression[1]);

    if (result === null) {
      break;
    }
    string = string.replace(expressionInBracketsRegexp, ` ${result} `);
  }

  while ( matches = string.match(simpleExpressionRegexp) ) {
    let result = calcSimpleExpression(matches[1], matches[2], matches[3]);

    if (result === null) {
      break;
    }
    string = string.replace(simpleExpressionRegexp, result);
  }

  if (matches = string.match(onlyNumberRegexp) ) {
    console.log(parseFloat(matches[1]));
    return parseFloat(matches[1]);
  } else {
    console.log('Uncorrect expression!');
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
        console.log('Dividing by zero is not allowed!');
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