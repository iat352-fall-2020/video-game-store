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
    // checks if submit button is pressed and parses inputs
    if(isset($_POST['submit_btn'])) {
     $username = $_POST['username'];
     $password = $_POST['passcode'];
     $encryptedPassword = password_hash($password, PASSWORD_DEFAULT);

     // $reconfirm = $_POST['confirm-passcode'];
     // if($password == $reconfirm){
       $text = $username . "\n" . $encryptedPassword . "\n";
       //$text = $username . ":" . $password;
       $fp = fopen('details.txt', 'w');

         if(fwrite($fp, $text))  {
            // if the write to text is sucessful, save registersuccess with following string for output
             $registersuccess = '<p>Username and Password Saved, navigate to login tab to login</p>';
         }
     fclose ($fp);
     }



    // check if text file exists before allowing login
    if(file_exists("details.txt")){
    // checks if submit button is pressed and parses inputs
      if(isset($_POST['submit_btn2'])) {
       $username = $_POST['username'];
       $password = $_POST['passcode'];

       $openTextFile = file_get_contents("details.txt");

       $accountArray = explode("\n", $openTextFile);

       // check if username and password match the ones in the textfile
       if($username == $accountArray[0] && password_verify($password, $accountArray[1] )){
         header("Location: indexMembers.php");
       }
       else{
         $loginfailure =  '<p>Login Failed!</p>';
       }
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
        <section class="profile-top-swap">
          <button onclick="showHide('profile-register-block')" class="profile-swap-button">Sign Up</button>
          <button onclick="showHide('profile-login-block')" class="profile-swap-button">Log in</button>
        </section>

    <!-- security -->

      <section class="content-item profile-security" id="profile-register-block">
        <form action = "" method="POST">
        <h3>Register Here</h3>
        <div class="change-password">


          <ul>
            <li>
              <fieldset>
                <legend>Username:</legend>
                <input type="text" id="register-username" name = "username">
              </fieldset>
            </li>
            <li>
              <fieldset>
                <legend>Password: </legend>
                <input type="password" id="register-password" name = "passcode">
              </fieldset>
            </li>
            <!-- <li>
              <fieldset>
                <legend>Confirm Password: </legend>
                <input type="password" id="register-password" name = "confirm-passcode">
                <img src="img/eye-icon.png" onclick="eye(2)" alt="show/hide new-password"/>
              </fieldset>
            </li> -->
          </ul>

        <input type = "submit" name="submit_btn" id = "submit" value = "Save"/>

        </div>
      </form>


      <?php
      // if register is sucessful and if registersuccess var is not empty print username and password saved.
      // this code here bypasses the issue where echo is hidden in header of page

        if(!empty($registersuccess)){
          echo '<hr>';
          echo '<p>'. $registersuccess . '</p>';
        }
        // if login is unsucessful and if loginfailure var is not empty print login failure

      ?>





      </section>





        <section class="content-item profile-security"id="profile-login-block">
          <form action = "" method="POST">
          <h3>Login Here</h3>
          <div class="change-password">
        <ul>
          <li>
            <fieldset>
              <legend>Username:</legend>
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
