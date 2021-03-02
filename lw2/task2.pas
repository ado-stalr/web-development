PROGRAM Task2(INPUT, OUTPUT);
USES
  dos;

PROCEDURE SarahRevere(VAR OutF: TEXT);
VAR
  Looking: CHAR;

PROCEDURE PrintResult(VAR OutF: TEXT; VAR Looking: CHAR);
BEGIN {PrintResult}
  IF Looking = '1'
  THEN
    WRITELN(OutF, 'The British are coming by land.')
  ELSE
    IF Looking = '2'
    THEN
      WRITELN(OutF, 'The British coming by sea.')
    ELSE
      WRITELN(OutF, 'Sarah didn''t say')
END; {PrintResult}

PROCEDURE Find1Lan(VAR Looking: CHAR);
BEGIN {Find1Lan}
  IF GetEnv('QUERY_STRING') = 'lanterns=1'
  THEN
    Looking := '1'
END; {Find1Lan}

PROCEDURE Find2Lan(VAR Looking: CHAR);
BEGIN {Find1Lan}
  IF GetEnv('QUERY_STRING') = 'lanterns=2'
  THEN
    Looking := '2'
END; {Find1Lan}

BEGIN {SarahRevere}
  Looking := 'N';
  Find1Lan(Looking);
  Find2Lan(Looking);
  PrintResult(OUTPUT, Looking)
END; {SarahRevere}
         
BEGIN {Task2}
  WRITELN(OUTPUT, 'Content-Type: text/html;');
  WRITELN(OUTPUT);
  WRITELN(OUTPUT, '<html><head><title>Task2</title></head><body><h1>Task2 - Sarah Revere</h1></body></html>');
  WRITELN(OUTPUT, '<p>QUERY_STRING: ', GetEnv('QUERY_STRING'), '</p>');
  WRITELN(OUTPUT, '<p>Result: ');
  SarahRevere(OUTPUT);
  WRITELN(OUTPUT, '</p><h3><a href="/cgi-bin/task3.cgi">GO NEXT - Task3</a></h3>');
  WRITELN(OUTPUT, '<h3><a href="/index.html">GO HOME</a></h3>')
END. {Task2}


