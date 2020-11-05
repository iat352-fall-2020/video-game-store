<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Inspiration and code implemented with help from w3schools and stack overflow. -->
    <meta charset="utf-8" />
    <script src="js/linkTo.js"></script>
    <script src="js/headerScroll.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/normalize.css">
    <title>Home</title>

    <!-- Framework reused from a previous project, approved for use by Professor Serban: http://www.sfu.ca/~bwa44/IAT339-D101-P02/ -->
  </head>
    <body>
        <?php
        session_start();
        $_SESSION=array();
        session_destroy();
        header('Location: login.php');
        exit;
        ?>
    </body>
</html>