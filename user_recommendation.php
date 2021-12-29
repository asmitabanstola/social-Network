<?php
    $command = escapeshellcmd('python39 python_api/recommend.py');
    $output = shell_exec($command);
    echo $output;
?>