#!/bin/bash
#------------------------------------------------------------------------------------------------------------
PROJECT_PATH='/usr/xenopi'
#------------------------------------------------------------------------------------------------------------
cp -f $PROJECT_PATH/index.php /var/www/index.php
#------------------------------------------------------------------------------------------------------------
printf '<!-- index.html -->
<html>
    <head>
        <title>Test page</title>
    </head>
    <body style="width: 80vw; left: 0; right: 0; position: absolute; margin: auto;">
        <h1 style="text-align: center; margin-top: 30vh;">
            It works!
        </h1>
        <h3 style="text-align: right; margin-top: 20px;">
            Apache on <span style="color: red;">slave</span>.
        </h3>
    </body>
</html>
' | tee /var/www/index.html
#------------------------------------------------------------------------------------------------------------