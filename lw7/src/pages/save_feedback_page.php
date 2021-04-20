<?php

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
    $validatedResult = [];

    foreach (PARAMS_REGEXP as $param => $regexp) {
        $value = getPOSTParameter($param);
        $validatedResult[$param] = $value;
        if (!preg_match($regexp, $value))
        {
            $isValid = false;
            $validatedResult[$param . '_error_msg'] = generateErrorMessage($param, $value);
        }
    }
    $validatedResult['valid'] = $isValid;
    return $validatedResult;
}

function saveFeedbackPage(): void
{
    $dataPath = SRC_PATH . '/data/';
    $validatedResult = validateFeedback();

    if ($validatedResult['valid'] === true)
    {
        $userInfo = [];
        $fileName = $validatedResult['email'] . '.txt';
        foreach (PARAMS_REGEXP as $param => $regexp)
        {
            $userInfo[$param] = $validatedResult[$param];
        }
        file_put_contents($dataPath . $fileName, json_encode($userInfo));

        $validatedResult['submited'] = true;
    }

    renderTemplate('main.tpl.php', $validatedResult);
}