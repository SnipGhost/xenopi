<!-- index.php -->
<html>
        <head>
                <title>Dynamic page</title>
        </head>
        <body style="width: 80vw; left: 0; right: 0; position: absolute; margin: auto;">

                <h1 style="text-align: center; margin-top: 30vh;">
                        It works!
                </h1>

                <h3 style="text-align: right; margin-top: 20px;">
                        Your very clever friend, <span style="color: red;">Apache2</span>.
                </h3>

                <h3 style="text-align: right; margin-top: 20px;">
                        on <?php echo gethostname(); ?>
                </h3>

                <br>
                <pre><?php foreach (getallheaders() as $name => $value) { echo "$name: $value\n"; }?></pre>

        </body>
</html>
