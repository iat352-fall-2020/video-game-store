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
        <h3 id="account-settings">Account Settings</h3>


		<!-- security -->
		<section class="content-item profile-security">
      <h3>Security Info</h3>

      <div class="change-password">
        <h4>Change Password:</h4>
        <form action="" method="POST">
        <ul>
          <li>
            <fieldset>
              <legend>Current Password: </legend>
              <input type="password" id="curr-pass" name="oldPassword">
              <img src="img/eye-icon.png" onclick="eye(1)" alt="show/hide curr-password"/>
            </fieldset>
          </li>
          <li>
            <fieldset>
              <legend>New Password: </legend>
              <input type="password" id="new-pass" name="newPassword" >
              <img src="img/eye-icon.png" onclick="eye(2)" alt="show/hide new-password"/>
            </fieldset>
          </li><li>
            <fieldset>
              <legend>Retype Password: </legend>
              <input type="password" id="retype-pass" name="retypePassword">
              <img src="img/eye-icon.png" onclick="eye(3)" alt="show/hide retype-password"/>
            </fieldset>
          </li>

      </ul>
      <input type = "submit" name="submit_btn3" id = "submit" value = "Submit"/>
    </form>

      <?php
      if(isset($_POST['submit_btn3'])){
        $oldPassword = $_POST['currentPassword'];
        $newPassword = $_POST['newPassword'];
        $newPasswordRetype = $_POST['retypePassword'];

        // check the email from session
        $checkOldPasswordQuery = "SELECT * FROM customer where email= '".md5()."' AND password = '".md5($oldPassword)."'";
        $checkOldPasswordQueryResult = mysqli_query($connect, $checkOldPasswordQuery);
        // if there is a match for email and password pair, continue
        if(mysqli_num_rows($checkOldPasswordQueryResult) > 0){
          // check if new password matches the retyped new password
          if($newPassword === $newPasswordRetype){
            $newPasswordReplaceQuery = "UPDATE customer SET password ='".md5($newpassword)."' WHERE email='".md5($sessionValue)."'";
            $NewPasswordReplaceResult = mysqli_query($connect,$newPasswordReplaceQuery);
            if($NewPasswordReplaceResult){
              echo "<p>Your password has been successfully changed</p>"
            }
            else{
              echo "<p>Internal Server Error</p>";
            }
          }
          else{
            echo '<p>Your passwords (new and retyped) do not match!</p>';
          }
        }
        // otherwise exit
        else{
          echo '<p>Your current password is incorrect!</p>';
        }
      }




      ?>



      <div class="clear-float">
        <p class="passwordUpdate">Your password has been changed!</p>
        <button onclick="updatePrefs(1)">Save Changes</button>
      </div>

      </div>

		</section>

		<!-- notification -->
		<section class="content-item profile-notification">
      <h3>Notifications</h3>
        <ul>
          <li><input type="checkbox" name="newsletter" value="sub-newsletter" checked> Subscribe to our newsletter.</li>
          <li><input type="checkbox" name="admin-email" value="admin-email" checked> Receive e-mails from admins.</li>
          <li><input type="checkbox" name="profile-pub" value="profile-public"> Allow other users to see my profile.</li>
          <li><p class="updateMessage">Your notification preferences have been updated!</p></li>
          <li><button onclick="updatePrefs(2)">Update</button></li>
        </ul>
		</section>

		<!-- billing information -->
		<div class="content-item profile-billing">
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
</div>
</main>

  <footer>
    <nav>
      <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
      <!-- <a href="citations.html">Citations</a> -->
    </nav>
  </footer>
  </body>
</html>
