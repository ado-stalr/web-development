<?php
header("Content-Type: text/plain");

if ((isset($_GET['text'])) && ($_GET['text'] !== ''))
{
    $resultText = trim($_GET['text']);
    $resultText = preg_replace('/\s{2,}/', ' ', $resultText);
    echo $resultText;
}
else
{
    echo 'Please, enter text.';
}
