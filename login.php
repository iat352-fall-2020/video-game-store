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




    // check if text file exists before allowing login
    // checks if submit button is pressed and parses inputs
    if(isset($_POST['submit_btn2'])) {
     $username = $_POST['username'];
     $password = $_POST['passcode'];


     // $openTextFile = file_get_contents("details.txt");
     //
     // $accountArray = explode("\n", $openTextFile);

     // $matchCustomer = "SELECT customerID FROM customer WHERE email='".md5($username)."' AND password='".md5($password)."'";
     // $queryMatchCustomer = mysqli_query($connect, $matchCustomer);
     //
     // // check if username and password match the ones in the textfile (hashed password)
     // if(mysqli_num_rows($queryMatchCustomer) > 0){
     //   header("Location: register.php");
     // }
     // else{
     //   // $loginfailure =  '<p>'.mysqli_num_rows($queryMatchCustomer).'</p>';
     //   $loginfailure =  '<p>'.$matchCustomer.'</p>';
     //   // $loginfailure =  '<p>Login Failed!</p>';
     // }
     $checkLogin = "SELECT firstName, email, customerID, password FROM customer WHERE email='".md5($username)."' AND password='".md5($password)."' ";
     $checkResult = mysqli_query($connect, $checkLogin);

     if($row = mysqli_fetch_assoc($checkResult)){
       $_SESSION['valid_user'] = $row['email'];
       $_SESSION['valid_user_name'] = $row['firstName'];
       $_SESSION['valid_user_id'] = $row['customerID'];
       header("Location: index.php");
     }
     else{
       $loginfailure =  '<p>Login Failed!</p>';
     }





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
                <?php
                  if(isset($_SESSION['valid_user']) && $_SESSION['valid_user'] !== "") //if they are logged in show the profile icon
                  {
                    echo '<div class="profile-box"><p>Hello  ' .$_SESSION['valid_user_name']. '</p>';
                    echo '<a href="profile.php">Profile</a>';
                    echo ' | ';
                    echo '<a href="logout.php">Logout</a>';
                    
                    echo '</div>';
                    // echo '<ul class="button-menu">
                    //   <li><a href="#"><img src="img/profile_icon.png" alt="profile-icon"></a>
                    //     <ul class="dropdownmain">
                    //       <li class="dropdownitem"><a href="profile.php">Profile</a></li>
                          
                    //       <li class="dropdownitem"><a href="logout.php">Logout</a></li>
                    //     </ul>

                    //   </li>

                    // </ul>';
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
              <a href="index.php" class="nav-main-item">Home</a>
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

    <section class="content-item profile-security"id="profile-login-block">

</section>

      <section class="content-item profile-security" id="profile-register-block">
        <form action = "" method="POST">
        <h3>Sign in with e-mail</h3>
        <div class="change-password">
      <ul>
        <li>
          <fieldset>
            <legend>E-mail:</legend>
            <input type="text" id="login-username" name = "username">
          </fieldset>
        </li>
        <li>
          <fieldset>
            <legend>Password: </legend>
            <input type="password" id="login-password" name = "passcode">
          </fieldset>
        </li>
      </ul>

    <input type = "submit" name="submit_btn2" id = "submit" value = "Login"/>

  </div>
  </form>
  <?php

  if(!empty($loginfailure)){
  echo '<hr>';
  echo '<p>'. $loginfailure . '</p>';
  }
  ?>
  </section>

  <section class="registerOrLoginLink">

    <p>Don't have an account yet? <a href="register.php">Sign up now!</a></p>

  </section>








		<!-- notification -->
		<!-- <section class="content-item profile-notification">
      <h3>Notifications</h3>
        <ul>
          <li><input type="checkbox" name="newsletter" value="sub-newsletter" checked> Subscribe to our newsletter.</li>
          <li><input type="checkbox" name="admin-email" value="admin-email" checked> Receive e-mails from admins.</li>
          <li><input type="checkbox" name="profile-pub" value="profile-public"> Allow other users to see my profile.</li>
          <li><p class="updateMessage">Your notification preferences have been updated!</p></li>
          <li><button onclick="updatePrefs(2)">Update</button></li>
        </ul>
		</section> -->

		<!-- billing information -->
		<!-- <div class="content-item profile-billing">
      <h3>Billing info</h3>
      <section class="address-radio">
        <div>
          <input type="radio" name="address" checked>
            <address>
              <span>303 Browning Lane</span>
              <span>Horseheads New York NY</span>
              <span>14845</span>
            </address>
            </div>
            <div>
        <input type="radio" name="address" >
          <address>
            <span>〒604-8091</span>
            <span>Kyoto Japan Nakagyo Ward</span>
            <span>御池下ル下本能寺前町522</span>
          </address>
          </div>
          <div>
      <input type="radio" name="address" >
        <address>
          <span>Sir Matt Busby Way</span>
          <span>Stretford Manchester</span>
          <span>M16 0RA United Kingdom</span>
        </address>
      </div>

    </section>
		</div>
	</div>
</div> -->
</main>
<footer>
  <nav>
    <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
    <!-- <a href="citations.html">Citations</a> -->
  </nav>
</footer>


  </body>
</html>
