<?php
define ('paramsRegexp', [
    'name' => '/^([ a-zA-Zа-яА-Я]){2,255}$/u',
    'email' => '/^[a-zA-Z0-9.!#$%&*+=?^_{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$/',
    'subject' => '/^([a-zA-Zа-яА-Я 0-9,.:;?!-%#@]){1,255}$/u',
    'message' => '/^(.){2,1000}$/'
]);

function generateErrorMessage($param, $value): string
{
    $message = 'Uncorrect value!';

    if ($param === 'name')
    {
        if (strlen($value) < 2) $message = 'Too short name';
        else if (strlen($value) > 256) $message = 'Too long name';
        else $message = ' Name can only consist of letters and spaces';
    }

    if ($param === 'email')
    {
        $message = 'Enter correct email';
    }

    if ($param === 'subject')
    {
        if (strlen($value) < 1) $message = 'Too short subject';
        else if (strlen($value) > 256) $message = 'Too long subject';
        else $message = ' Subject contains invalid characters';
    }

    if ($param === 'message')
    {
        if (strlen($value) < 2) $message = 'Too short message';
        else if (strlen($value) > 1000) $message = 'Too long message';
    }

    return $message;
}

function validateFeedback(): array
{
    $isValid = true;
    $validateResult = [];

    foreach (paramsRegexp as $param => $Regexp) {
        $value = getPOSTParameter($param);
        $validateResult[$param] = $value;
        if (!preg_match($Regexp, $value))
        {
            echo ($param . ' ' . preg_match($Regexp, $value));
            $isValid = false;
            $validateResult[$param . '_error_msg'] = generateErrorMessage($param, $value);
        }
    }
    $validateResult['valid'] = $isValid;
    return $validateResult;
}

function saveFeedbackPage(): void
{
    $dataPath = __ROOT__ . '/src/data/';
    $validateResult = validateFeedback();

    if ($validateResult['valid'] === true)
    {
        $fileName = $validateResult['email'] . '.txt';
        foreach (paramsRegexp as $param => $Regexp)
        {
            $userInfo[$param] = $validateResult[$param];
        }
        file_put_contents($dataPath . $fileName, json_encode($userInfo));

        $validateResult['submited'] = true;
    }

    renderTemplate('main.tpl.php', $validateResult);
}