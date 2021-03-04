<?php
header("Content-Type: text/plain");

$pattern_password = '/^[a-zA-Z0-9]*$/';

function isValue($str)
{
    return (isset($_GET[$str])) && ($_GET[$str] !== '');
}

function printPasswordVerifyErrors()
{
    echo 'Uncorrect password!' . "\n";
    echo "Password can contain only latin letters and digits!\n";
}

function computeStrength($pass)
{
    $len = strlen($pass);
    $result = 0;
    $result += 4 * $len;
    preg_match_all('/[0-9]/', $pass, $digits);
    $result += 4 * sizeof($digits[0]);
    preg_match_all('/[A-Z]/', $pass, $UpperCase);
    if (sizeof($UpperCase[0]) > 0)
    {
        $result += 2 * ($len - sizeof($UpperCase[0]));
    }
    preg_match_all('/[a-z]/', $pass, $LowerCase);
    if (sizeof($LowerCase[0]) > 0)
    {
        $result += 2 * ($len - sizeof($LowerCase[0]));
    }
    if (preg_match('/^[a-zA-Z]*$/', $pass))
    {
        $result -= $len;
    }
    if (preg_match('/^[0-9]*$/', $pass))
    {
        $result -= $len;
    }
    $simbols = array_count_values(str_split($pass));
    foreach($simbols as $amt)
    {
        if($amt > 1)
        {
            $result -= $amt;
        }
    }
    return $result;
}

if (isValue('password'))
{
    $password = $_GET['password'];
    echo 'Password: ' . $password . "\n";
    if (preg_match($pattern_password, $password))
    {
        echo 'Strength: ' . (string)computeStrength($password);
    }
    else
    {
        printPasswordVerifyErrors();
    }
}
else
{
    echo 'Please, enter password.';
}
