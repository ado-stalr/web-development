<?php
header("Content-Type: text/plain");

$pattern_identifier = '/^([a-zA-Z])([a-zA-Z0-9])*$/';

function isValue($str)
{
    return (isset($_GET[$str])) && ($_GET[$str] !== '');
}

function printVerifyIdentifierErrors($str)
{
    echo 'No. It\'s uncorrect identifier' . "\n";
    if (preg_match('/[^a-zA-Z0-9]/', $str))
    {
        echo "Identifier can contain only latin letters and digits!\n";
    }
    if (preg_match('/^[0-9]/', $str))
    {
        echo "Identifier can't start with a digit!\n";
    }
}

if (isValue('identifier'))
{
    $identifier = $_GET['identifier'];
    echo 'Identifier = ' . $identifier . "\n";
    if (preg_match($pattern_identifier, $identifier))
    {
        echo 'Yes. It\'s good identifier';
    }
    else
    {
        printVerifyIdentifierErrors($identifier);
    }
}
else
{
    echo 'Please, enter identifier.';
}
