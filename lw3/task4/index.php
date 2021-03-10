<?php
header("Content-Type: text/plain");
$dataPath = 'data/';
$paramNames = [
    'first_name' => 'First Name',
    'last_name' => 'Last Name',
    'age' => 'Age',
];

function getParameter($parameter): ?string
{
    return $_GET[$parameter] ?? null;
}

function printIncomingData($email, $paramNames): void
{
    echo "Email: {$email}" . PHP_EOL;
    foreach ($paramNames as $param => $name) {
        $value = getParameter($param);
        echo "{$name}: {$value}" . PHP_EOL;
    }
}

$email = getParameter('email');
if ($email)
{
    printIncomingData($email, $paramNames);
    if (filter_var($email, FILTER_VALIDATE_EMAIL) && !preg_match('/\//', $email))
    {
        $userInfo['email'] = $email;
        $fileName = $email . '.txt';
        foreach ($paramNames as $param => $name) {
            $value = getParameter($param);
            if ($value)
            {
                $userInfo[$param] = $value;
            }
        }
        file_put_contents($dataPath . $fileName, json_encode($userInfo));
        echo 'Data saved.';
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
