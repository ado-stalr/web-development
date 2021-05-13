<?php

function feedbackListPage()
{
    $dataPath = SRC_PATH . '/data/';
    $email = strtolower(getPOSTParameter('email'));
    $filePath = $dataPath . $email . '.txt';
    if ($email && file_exists($filePath))
    {
        $userInfo = json_decode(file_get_contents($filePath), true);
        renderTemplate('feedback_list.tpl.php', $userInfo);
    }
    else
    {
        renderTemplate('get_feedback_form.tpl.php', ['email' => $email, 'not_found_msg' => 'User not found!']);
    }
}