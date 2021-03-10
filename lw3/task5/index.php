<?php
header("Content-Type: text/plain");
$dataPath = '../task4/data/';
$paramNames = [
    'email' => 'Email',
    'first_name' => 'First Name',
    'last_name' => 'Last Name',
    'age' => 'Age',
];

function getParameter($parameter): ?string
{
    return $_GET[$parameter] ?? null;
}

function getUserInfoFile($path, $paramNames): void
{
    if (file_exists($path))
    {
        $userInfo = json_decode(file_get_contents($path), true);
        foreach ($paramNames as $param => $name) {
            $value = $userInfo[$param] ?? ' ';
            echo "{$name}: {$value}" . PHP_EOL;
        }
    }
    else
    {
        echo 'User not found!';
    }
}

$email = getParameter('email');
if ($email)
{
    echo 'Entered email: ' . $email . PHP_EOL;
    if (filter_var($email, FILTER_VALIDATE_EMAIL) && !preg_match('/\//', $email))
    {
        $fileName = $email . '.txt';
        getUserInfoFile($dataPath . $fileName, $paramNames);
    }
    else
    {
        echo 'Uncorrect email!';
    }
}
else
{
    echo 'Please, enter email.';
}
