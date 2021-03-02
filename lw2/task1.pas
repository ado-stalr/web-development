PROGRAM Task1(INPUT, OUTPUT);
USES
  dos;
BEGIN {Task1}
  WRITELN('Content-Type: text/html;');
  WRITELN;
  WRITELN('<html><head><title>Task1</title></head><body><h1>Task1 - GetEnv</h1></body></html>');
  WRITELN('<p>REQUEST_METHOD: ', GetEnv('REQUEST_METHOD'), '</p>');
  WRITELN('<p>QUERY_STRING: ', GetEnv('QUERY_STRING'), '</p>');
  WRITELN('<p>CONTENT_LENGTH: ', GetEnv('CONTENT_LENGTH'), '</p>');
  WRITELN('<p>HTTP_USER_AGENT: ', GetEnv('HTTP_USER_AGENT'), '</p>');
  WRITELN('<p>HTTP_HOST: ', GetEnv('HTTP_HOST'), '</p>');
  WRITELN('<h3><a href="/cgi-bin/task2.cgi">GO NEXT - Task2</a></h3>');
  WRITELN('<h3><a href="/index.html">GO HOME</a></h3>')
END. {Task1}                        
