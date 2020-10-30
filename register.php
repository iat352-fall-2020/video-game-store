<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <script src="js/linkTo.js"></script>
    <script src="js/functions.js"></script>
    <script src="js/headerScroll.js"></script>
    <script src="js/showHide.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/normalize.css">

    <title>Profile</title>



 <!-- Framework reused from a previous project, approved for use by Professor Serban: http://www.sfu.ca/~bwa44/IAT339-D101-P02/ -->







  </head>
  <body>


    <?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $dbname = "Benedict_Wong";
    $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
    if($connect){
    }
    else{
      die("exit");
    }

    // checks if submit button is pressed and parses inputs
    if(isset($_POST['submit_btn'])) {
     $username = $_POST['username'];
     $password = $_POST['password'];
     $confirmpassword = $_POST['confirmPassword'];

     $checkUsername = "SELECT email FROM customer WHERE email='.md5($username).'";
     $checkUsernameResult = mysqli_query($connect, $checkUsername);
      if(!empty($checkUsernameResult)){
        $error = "<p>Error: E-mail is already registered in the system!</p>";
      }
      else{
        $encryptUsername = hash('md5',$username);
      }

     if($password == $confirmpassword && $encryptUsername){
      $encryptedPassword = hash('md5', $password)
      $insertUsernamePassword = "INSERT INTO customer(email, password) values ('.$encryptUsername.','.$password.')";
      if(mysqli_query($connect,$insertUsernamePassword)){
           header("Location: indexMembers.php");
           mysqli_close($connect);
        }
      else{
        die("insertion failed");
      }

    }

    else{
      $error =  '<p>Your Password does not match!</p>';

    }


     // INSERT INTO userData(username, password) VALUES ($username, $encryptedPassword)




       //$text = $username . ":" . $password;

     }
     ?>



    <header id="header">
        <!-- logo? -->
        <div class="header-menu ">


          <div class="header-row-1">
            <img class="nav-main-logo-img" src="img/Logo.png" alt="Logo" onclick="pointTo('index.php')"/>
            <div class="header-row-2">
              <input type="text" placeholder="Search here...">
              <img onclick="pointTo('catalog.php')" src="img/search-icon.png" alt="search-icon"/>

            </div>

            <nav class="nav-row-1">
              <div class="nav-main-item">
                <section class="profile-cart">
                  <a href="profile.php"><img src="img/profile_icon.png" alt="profile-icon"></a>
                  <a href="" class="cart-nav"><img src="img/cart_icon.png" alt="cart-icon"></a>
                </section>
              </div>

            </nav>
          </div>


          <!-- search bar -->


          <div class="header-row-3">
            <nav class="nav-row-3">
              <a href="catalog.php" class="nav-main-item">Playstation</a>
              <a href="catalog.php" class="nav-main-item">Xbox</a>
              <a href="catalog.php" class="nav-main-item">Nintendo</a>
              <a href="catalog.php" class="nav-main-item">Deals</a>
            </nav>
          </div>
        </div>

    </header>
	<!-- content -->
	<main class="main-content container profile">
		<!-- profile information -->



    <div class="profile-right">

		<!-- order list -->
      <div class="profile-item profile-info" id="profile-info">

    <!-- security -->

      <section class="content-item profile-security" id="profile-register-block">
        <form action = "" method="POST">
        <h3>Sign up here</h3>
        <div class="change-password">


          <ul>
            <li>
              <fieldset>
                <legend>E-mail:</legend>
                <input type="text" id="register-username" name = "username" >
              </fieldset>
            </li>
            <li>
              <fieldset>
                <legend>Password: </legend>
                <input type="password" id="register-password" name = "password">
              </fieldset>
            </li>
            <li>
              <fieldset>
                <legend>Confirm password: </legend>
                <input type="password" id="register-password" name = "confirmPassword">
              </fieldset>
            </li>
            <!-- <li>
              <fieldset>
                <legend>Set your date of birth: </legend>
              <input type = 'date' id='startDate' name = 'startDate' min='1920-01-01' max='2003-01-01'>
            </fieldset>
            </li> -->

          </ul>

        <input type = "submit" name="submit_btn" id = "submit" value = "Sign up"/>

        </div>
      </form>



      <?php
      // if register is sucessful and if registersuccess var is not empty print username and password saved.
      // this code here bypasses the issue where echo is hidden in header of page

        if(!empty($error)){
          echo($error);
        }
        // if login is unsucessful and if loginfailure var is not empty print login failure

      ?>











      </section>
      <section>
        <p>If you already have an account, <a href="login.php">Login Now! </a></p>
      </section>







</main>
<footer>
  <nav>
    <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
    <!-- <a href="citations.html">Citations</a> -->
  </nav>
</footer>


  </body>
</html>
