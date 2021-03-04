<?php
header("Content-Type: text/plain");
$dataPath = '../task4/data/';

function isValue($str)
{
    return (isset($_GET[$str])) && ($_GET[$str] !== '');
}

function printEmailVerifyErrors()
{
    echo 'Uncorrect email!';
}

function getUserInfoFile($path)
{
    function printUserInfo($user)
    {
        $email = isset($user['email']) ? (string)$user['email'] : ' ';
        $first_name = isset($user['first_name']) ? (string)$user['first_name'] : ' ';
        $last_name = isset($user['last_name']) ? (string)$user['last_name'] : ' ';
        $age = isset($user['age']) ? (string)$user['age'] : ' ';

        echo "User's info\n";
        echo "Email: {$email}\n";
        echo "First Name: {$first_name}\n";
        echo "Last Name: {$last_name}\n";
        echo "Age: {$age}\n";
    }

    if (file_exists($path))
    {
        $userInfo = json_decode(file_get_contents($path), true);
        printUserInfo($userInfo);
    }
    else
    {
        echo 'User not found!';
    }
}

if (isValue('email'))
{
    $email = $_GET['email'];
    echo 'Entered email: ' . $email . "\n";
    
    if (filter_var($email, FILTER_VALIDATE_EMAIL) && !preg_match('/\//', $email))
    {
        $fileName = $email . '.txt';
        getUserInfoFile($dataPath . $fileName);
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
