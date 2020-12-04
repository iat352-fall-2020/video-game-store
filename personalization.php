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

<?php
        $genreCount = 12;
        $genreFlags = array_fill(0,$genreCount,0);
      // if(isset($_SESSION['valid_user'])){
        if(isset($_POST['submit_btn_personalize'])){

          if(isset($_POST['Singleplayer']))
          {
            $genreFlags[0] = 1;
          }
          if(isset($_POST['Multiplayer']))
          {
            $genreFlags[1] = 1;
          }
          if(isset($_POST['Action']))
          {
            $genreFlags[2] = 1;
          }
          if(isset($_POST['Adventure']))
          {
            $genreFlags[3] = 1;
          }
          if(isset($_POST['Fighting']))
          {
            $genreFlags[4] = 1;
          }
          if(isset($_POST['Rhythm']))
          {
            $genreFlags[5] = 1;
          }
          if(isset($_POST['Strategy']))
          {
            $genreFlags[6] = 1;
          }
          if(isset($_POST['Puzzle']))
          {
            $genreFlags[7] = 1;
          }
          if(isset($_POST['Casual']))
          {
            $genreFlags[8] = 1;
          }
          if(isset($_POST['RPG']))
          {
            $genreFlags[9] = 1;
          }
          if(isset($_POST['Shooting']))
          {
            $genreFlags[10] = 1;
          }
          if(isset($_POST['Sports']))
          {
            $genreFlags[11] = 1;
          }

          print_r($genreFlags);

          $genreQuery = "REPLACE INTO favorites VALUES ('";
          $genreQuery.= $_SESSION['valid_user'];
          $genreQuery.= "','";
          $genreQuery .= implode("','", $genreFlags);
          $genreQuery .= "')";

          print_r($genreQuery);
          $result = mysqli_query($connect, $genreQuery);
          if(!$result)
          {
            echo "Failure: " . mysqli_error($connect);
            die("Database query failed.");
          }
          else
          {
            $personalize_queryResult = mysqli_query($connect, $genreQuery);
            echo $personalize_queryResult;
            echo ' You have successfully updated your preferences ';
          }

          // $genreFlags[$genreCount];

          // for($i = 0; $i < $genreCount;$i++)
          // {
          //   $genreFlags[i];
          // }
          


          // $personalize_check = $_POST['genre'];
          // $personalize_check ="";
          if(isset($personalize_check) && $personalize_check != "")
          {
            // $personalize_check = $_POST['genre'];
            // $counted = count($personalize_check);

            //   for($i = 0 ; $i < $counted; $i++)
            //   {
            //     $currentUser = $_SESSION['valid_user'];
            //     $currentIndex = $personalize_check[$i];
            //     $personalize_query = "REPLACE INTO favorites SET '$currentIndex' = 'TRUE' WHERE email='$currentUser'";
            //     $personaize_queryResult = mysqli_query($connect, $personalize_query);
            //   }

            echo 'You have successfully updated your preferences ';
            for($i = 0; $i < count($personalize_check); $i++)
            {

            }

            // echo $personalize_check[$i];
            $genreQuery = $personalize_check;
            $genreQuery = implode("','",$_POST['genre']);
            
            echo $genreQuery;
          }
          else
          {
            echo ('There are no options selected.');
            // echo $personalize_check;
          }


        }
      // }
      // else{
      //   $message = 'You are not logged in.';
      // }
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
                    echo '<p>Hello  ' .$_SESSION['valid_user_name'] .'</p>';
                    echo '<ul class="button-menu">
                      <li><a href="#"><img src="img/profile_icon.png" alt="profile-icon"></a>
                        <ul class="dropdownmain">
                          <li class="dropdownitem"><a href="profile.php">Profile</a></li>
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
        <h3 id="account-settings">Personalization Settings</h3>


		<!-- security -->
		<section class="content-item profile-security">

          <form action="" method="POST">
            <ul>
              <!-- <li><input type="checkbox" name="genre[]" value="Singleplayer" onclick="">Singleplayer</li>
              <li><input type="checkbox" name="genre[]" value="Multiplayer" onclick="">Multiplayer</li>
              <li><input type="checkbox" name="genre[]" value="Action" onclick="">Action</li>
              <li><input type="checkbox" name="genre[]" value="Adventure" onclick="">Adventure</li>
              <li><input type="checkbox" name="genre[]" value="Fighting" onclick="">Fighting</li>
              <li><input type="checkbox" name="genre[]" value="Rhythm" onclick="">Rhythm</li>
              <li><input type="checkbox" name="genre[]" value="Strategy" onclick="">Strategy</li>
              <li><input type="checkbox" name="genre[]" value="Puzzle" onclick="">Puzzle</li>
              <li><input type="checkbox" name="genre[]" value="Casual" onclick="">Casual</li>
              <li><input type="checkbox" name="genre[]" value="RPG" onclick="">RPG</li>
              <li><input type="checkbox" name="genre[]" value="Shooting" onclick="">Shooting</li>
              <li><input type="checkbox" name="genre[]" value="Sports" onclick="">Sports</li> -->

              <li><input type="checkbox" name="Singleplayer" value="Singleplayer" onclick="">Singleplayer</li>
              <li><input type="checkbox" name="Multiplayer" value="Multiplayer" onclick="">Multiplayer</li>
              <li><input type="checkbox" name="Action" value="Action" onclick="">Action</li>
              <li><input type="checkbox" name="Adventure" value="Adventure" onclick="">Adventure</li>
              <li><input type="checkbox" name="Fighting" value="Fighting" onclick="">Fighting</li>
              <li><input type="checkbox" name="Rhythm" value="Rhythm" onclick="">Rhythm</li>
              <li><input type="checkbox" name="Strategy" value="Strategy" onclick="">Strategy</li>
              <li><input type="checkbox" name="Puzzle" value="Puzzle" onclick="">Puzzle</li>
              <li><input type="checkbox" name="Casual" value="Casual" onclick="">Casual</li>
              <li><input type="checkbox" name="RPG" value="RPG" onclick="">RPG</li>
              <li><input type="checkbox" name="Shooting" value="Shooting" onclick="">Shooting</li>
              <li><input type="checkbox" name="Sports" value="Sports" onclick="">Sports</li>
              </li>
            </ul>
            <input type = "submit" name="submit_btn_personalize" id = "submit" value = "Submit"/>
          </form>
      <?php
        if(isset($message)){
          echo($message);
        }
       ?>



		</section>

		<!-- notification -->
		<section class="content-item profile-notification">
      <!-- <h3>Notifications</h3>
        <ul>
          <li><input type="checkbox" name="newsletter" value="sub-newsletter" checked> Subscribe to our newsletter.</li>
          <li><input type="checkbox" name="admin-email" value="admin-email" checked> Receive e-mails from admins.</li>
          <li><input type="checkbox" name="profile-pub" value="profile-public"> Allow other users to see my profile.</li>
          <li><p class="updateMessage">Your notification preferences have been updated!</p></li>
          <li><button onclick="updatePrefs(2)">Update</button></li>
        </ul> -->
		</section>

		<!-- billing information -->
		<div class="content-item profile-billing">
      <!-- <h3>Billing info</h3>
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
      </div> -->

    <!-- </section> -->
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
