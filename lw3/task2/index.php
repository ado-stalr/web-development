<?php
header("Content-Type: text/plain");
$pattern_identifier = '/^([a-zA-Z])([a-zA-Z0-9])*$/';

function getParameter($parameter): ?string
{
    return $_GET[$parameter] ?? null;
}

function printVerifyIdentifierErrors($identifier): void
{
    if (preg_match('/[^a-zA-Z0-9]/', $identifier))
    {
        echo 'Identifier can contain only latin letters and digits!' . PHP_EOL;
    }
    if (preg_match('/^[0-9]/', $identifier))
    {
        echo 'Identifier can\'t start with a digit!' . PHP_EOL;
    }
}

$identifier = getParameter('identifier');
if ($identifier)
{
    echo "Identifier = {$identifier}" . PHP_EOL;
    if (preg_match($pattern_identifier, $identifier))
    {
        echo 'Yes. It\'s good identifier' . PHP_EOL;
    }
    else
    {
        echo 'No. It\'s uncorrect identifier' . PHP_EOL;
        printVerifyIdentifierErrors($identifier);
    }
}
else
{
    echo 'Please, enter identifier.';
}
