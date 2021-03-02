PROGRAM Task4(INPUT, OUTPUT);
USES
  dos;

PROCEDURE GetQueryStringParameter(VAR Key, KeyValue: STRING);
VAR
  KeyPosition, StartIndex, EndIndex, ValueLength: BYTE;
  Query: STRING;
BEGIN {GetQueryStringParameter}
  Query := GetEnv('QUERY_STRING');
  KeyPosition := POS(Key + '=', Query);
  IF (KeyPosition <> 0) AND ((Query[KeyPosition - 1] = '&') OR (KeyPosition - 1 = 0))
  THEN
    BEGIN
      StartIndex := KeyPosition + 1 + LENGTH(Key);
      EndIndex := StartIndex;
      WHILE (EndIndex <= LENGTH(Query)) AND (Query[EndIndex] <> '&')
      DO
        EndIndex := EndIndex + 1;
      ValueLength := EndIndex - StartIndex;
      KeyValue := COPY(Query, StartIndex, ValueLength)
    END
  ELSE
    KeyValue := ''  
END; {GetQueryStringParameter}

PROCEDURE WorkWithQueryString(VAR OutF: TEXT);
VAR                              
  FirstName, FirstNameValue, LastName, LastNameValue, Age, AgeValue: STRING;
BEGIN {WorkWithQueryString}
  FirstName := 'first_name';
  LastName := 'last_name';
  Age := 'age';

  GetQueryStringParameter(FirstName, FirstNameValue);
  GetQueryStringParameter(LastName, LastNameValue);
  GetQueryStringParameter(Age, AgeValue);
  
  WRITELN(OUTPUT, '<p>', 'First Name: ', FirstNameValue, '</p>');
  WRITELN(OUTPUT, '<p>', 'Last Name: ', LastNameValue, '</p>');
  WRITELN(OUTPUT, '<p>', 'Age: ', AgeValue, '</p>')
END; {WorkWithQueryString}

BEGIN
  WRITELN(OUTPUT, 'Content-Type: text/html;');
  WRITELN(OUTPUT);
  WRITELN(OUTPUT, '<html><head><title>Task4</title></head><body><h1>Task4 - Work With Query String</h1></body></html>');
  WRITELN(OUTPUT, '<p>QUERY_STRING: ', GetEnv('QUERY_STRING'), '</p>');
  WorkWithQueryString(OUTPUT);
  WRITELN(OUTPUT, '<h3><a href="/index.html">GO HOME</a></h3>')
END.


