<?php
header("Content-Type: text/plain");
$pattern_password = '/^[a-zA-Z0-9]*$/';

function getParameter($parameter): ?string
{
    return $_GET[$parameter] ?? null;
}

function computeStrength($pass): int
{
    $len = strlen($pass);
    $result = 0;
    $result += 4 * $len;
    preg_match_all('/[0-9]/', $pass, $digits);
    $result += 4 * count($digits[0]);
    preg_match_all('/[A-Z]/', $pass, $upperCase);
    if (count($upperCase[0]) > 0)
    {
        $result += 2 * ($len - count($upperCase[0]));
    }
    preg_match_all('/[a-z]/', $pass, $lowerCase);
    if (count($lowerCase[0]) > 0)
    {
        $result += 2 * ($len - count($lowerCase[0]));
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
    foreach($simbols as $amount)
    {
        if($amount > 1)
        {
            $result -= $amount;
        }
    }
    return $result;
}

$password = getParameter('password');
if ($password)
{
    echo "Password: {$password}" . PHP_EOL;
    if (preg_match($pattern_password, $password))
    {
        echo 'Strength: ' . (string)computeStrength($password);
    }
    else
    {
        echo 'Uncorrect password!' . PHP_EOL;
        echo 'Password can contain only latin letters and digits!' . PHP_EOL;
    }
}
else
{
    echo 'Please, enter password.';
}
