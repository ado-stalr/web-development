<?php
header("Content-Type: text/plain");
$dataPath = 'data/';

function isValue($str)
{
    return (isset($_GET[$str])) && ($_GET[$str] !== '');
}

function printEmailVerifyErrors()
{
    echo 'Uncorrect email!';
}

function printIncomingData($email)
{
    $first_name = isValue('first_name') ? (string)$_GET['first_name'] : ' ';
    $last_name = isValue('last_name') ? (string)$_GET['last_name'] : ' ';
    $age = isValue('age') ? (string)$_GET['age'] : ' ';

    echo "Email: {$email}\n";
    echo "First Name: {$first_name}\n";
    echo "Last Name: {$last_name}\n";
    echo "Age: {$age}\n";
}

if (isValue('email'))
{
    $email = $_GET['email'];
    printIncomingData($email);

    if (filter_var($email, FILTER_VALIDATE_EMAIL) && !preg_match('/\//', $email))
    {
        $userInfo['email'] = $email;
        $fileName = $email . '.txt';
        if (isValue('first_name'))
        {
            $userInfo['first_name'] = (string)$_GET['first_name'];
        }
        if (isValue('last_name'))
        {
            $userInfo['last_name'] = (string)$_GET['last_name'];
        }
        if (isValue('age'))
        {
            $userInfo['age'] = (string)$_GET['age'];
        }
        file_put_contents($dataPath . $fileName, json_encode($userInfo));
        echo 'Data saved.';
    }
    else
    {
        printEmailVerifyErrors();
    }
}
else
{
    echo 'Please, enter email.';
}
