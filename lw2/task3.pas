PROGRAM Task3(INPUT, OUTPUT);
USES
  dos;

PROCEDURE PrintResult(VAR OutF: TEXT; VAR Name: STRING);
BEGIN {PrintResult}
  WRITE(OutF, 'Hello ');
  IF Name <> ''
  THEN
    WRITELN(OutF, 'dear, ', Name, '!')
  ELSE
    WRITELN(OutF, 'Anonymous!')
END; {PrintResult}

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
END; {GetQueryStringParameter}

PROCEDURE SayHello(VAR OutF: TEXT);
VAR                              
  Name, Key, KeyValue: STRING;
BEGIN {SayHello}
  Key := 'name';
  Name := '';
  GetQueryStringParameter(Key, Name);
  PrintResult(OutF, Name)
END; {SayHello}

BEGIN {Task3}
  WRITELN(OUTPUT, 'Content-Type: text/html;');
  WRITELN(OUTPUT);
  WRITELN(OUTPUT, '<html><head><title>Task3</title></head><body><h1>Task3 - Say Hello!</h1></body></html>');
  WRITELN(OUTPUT, '<p>QUERY_STRING: ', GetEnv('QUERY_STRING'), '</p>');
  WRITELN(OUTPUT, '<p>Result: ');
  SayHello(OUTPUT);
  WRITELN(OUTPUT, '</p><h3><a href="/cgi-bin/task4.cgi">GO NEXT - Task4</a></h3>');
  WRITELN(OUTPUT, '<h3><a href="/index.html">GO HOME</a></h3>')
END. {Task3}


