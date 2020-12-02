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
    session_start();
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $dbname = "benedict_wong";
    $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
    if($connect){
    }
    else{
      die("exit");
    }

    // checks if submit button is pressed and parses inputs
    if(isset($_POST['submit_btn'])) {
      $firstName = $_POST['firstName'];
      $lastName = $_POST['lastName'];
      $username = $_POST['username'];
      $password = $_POST['password'];
      $confirmpassword = $_POST['confirmPassword'];
      $DOB = $_POST['birthDate'];
      $gender= $_POST['gender'];

      if(isset($firstName) && $firstName != "")
      {
        $error = "Please enter a first name";
      }
      // else
      // {
      //   die;
      // }

      if(isset($lastName) && $lastName != "")
      {
        $error = "Please enter a last name";
      }
      // else
      // {
      //   die;
      // }


      // first check if username is filled in
      if(isset($firstName) && $firstName != "" && isset($lastName) && $lastName != ""){
        if(isset($DOB)){
          if(isset($username )&& $username != ""){
            // Next, check if password is filled in
            if(isset($password)&& $password != ""){
              // Next, check if password and confirm password is an exact match
              if($password === $confirmpassword){

                // After all preliminary checks have validated, check if the username exists in the database.
                // For this, we will need to check the md5 value of the entered username against the encrypted usernames in the database.
                $encryptUsernameCheck = md5($username);
                $checkUsername = "SELECT email FROM customer WHERE email='$encryptUsernameCheck'";
                $checkUsernameResult = mysqli_query($connect, $checkUsername);

                // Next, check the number of rows that have been outputted by the query using mysqli_num_rows()
                if(mysqli_num_rows($checkUsernameResult) != null){
                  $error = "E-mail is already registered in the system!";
                }
                // If there are no rows returned from the query, proceed with the sign up.
                else{
                  $encryptedPassword = hash('md5', $password);
                  $encryptedUsername = hash('md5',$username);
                  // $insertUsernamePassword = "INSERT INTO customer(email, password) values ()";

                  $insertUsernamePassword = "INSERT INTO customer(firstName,lastName,gender, email,password, birthDate) VALUES ('$firstName','$lastName','$gender','$encryptedUsername', '$encryptedPassword', '$DOB')";
                  $createFavorites = "INSERT INTO favorites(email) VALUES ('$encryptedUsername')";
                  mysqli_query($connect, $createFavorites);


                  if(mysqli_query($connect,$insertUsernamePassword)){

                      if($row = mysqli_fetch_assoc($checkResult)){
                        $_SESSION['valid_user'] = $row['email'];
                        $_SESSION['valid_user_name'] = $row['firstName'];
                        $_SESSION['valid_user_id'] = $row['customerID'];
                        mysqli_close($connect);
                        header("Location: index.php");

                    }
                  else{
                    die("insertion failed");
                  }
                }
              }
              else{
                $error =  'The passwords entered does not match!';
              }
            }
            else{
              $error="Password field is blank";
            }
          }
          else{
            $error="E-mail field is blank";
          }
        }
        else{
          $error="Date of Birth field is blank";
        }
      }
      else
      {
        $error = "Please enter a first and last name!";
      }
  }


     // INSERT INTO userData(username, password) VALUES ($username, $encryptedPassword)




       //$text = $username . ":" . $password;
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
                <?php
                  if(isset($_SESSION['valid_user']) && $_SESSION['valid_user'] !== "") //if they are logged in show the profile icon
                  {
                    echo '<p>Hello  ' .$_SESSION['valid_user'] .'</p>';
                    echo '<ul class="button-menu">
                      <li><a href="#"><img src="img/profile_icon.png" alt="profile-icon"></a>
                        <ul class="dropdownmain">
                          <li class="dropdownitem"><a href="profile.php">Profile</a></li>
                          <li class="dropdownitem"><a href="profile.php">Settings</a></li>
                          <li class="dropdownitem"><a href="logout.php">Logout</a></li>
                        </ul>

                      </li>

                    </ul>';
                  }
                  else
                  {
                    echo '<p>You are not logged in.</p><p><a href="login.php">Log In </a></p><br><p><a href="register.php">Register</a></p>';
                    echo '';
                  }
                ?>
                  <a href="checkout.php" class="cart-nav"><img src="img/cart_icon.png" alt="cart-icon"></a>

                </section>
              </div>

            </nav>
          </div>


          <!-- search bar -->


          <div class="header-row-3">
          <nav class="nav-row-3">
              <a href="catalog.php" class="nav-main-item">Browse Store</a>
              <a href="about.php" class="nav-main-item">About Us</a>
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
                <legend>First Name:</legend>
                <input type="text" id="firstName" name = "firstName" >
              </fieldset>
            </li>
            <li>
              <fieldset>
                <legend>Last Name:</legend>
                <input type="text" id="lastName" name = "lastName" >
              </fieldset>
            </li>
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
            <li>
              <fieldset>
                <legend>Enter your date of birth: </legend>
              <input type = 'date' id='startDate' name = 'birthDate' min='1920-01-01' max='2003-01-01'>
            </fieldset>
            </li>
            <li>
              <fieldset>
                <legend>Enter your Gender</legend>
                <select name="gender" id="gender">
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                  <option value="Other">Other</option>
                </select>
            </fieldset>
            </li>

          </ul>

        <input type = "submit" name="submit_btn" id = "submit" value = "Sign up"/>

        </div>
      </form>

      <?php

        if(!empty($error)){
          echo '<p>'.$error.'</p>';
        }

      ?>












      </section>

      <section class="registerOrLoginLink">

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
