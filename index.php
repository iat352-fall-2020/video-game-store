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

  <?php //checks authentication and directs user to appropriate index page
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

  //  $checkLogin = "SELECT email, password, firstName FROM customer WHERE email='".md5($username)."' AND password='".md5($password)."' "; 
  //  $checkResult = mysqli_query($connect, $checkLogin);

  //  $count = mysqli_num_rows($result);

  //  if($row = mysqli_fetch_assoc($result))
  //  if(isset($_SESSION['valid_user'])  && $_SESSION['valid_user'] !== "")
  //  {
  //   // $_SESSION['valid_user'] = $row['firstName'];
  //   // echo "Hello " . $_SESSION['valid_user'];
  //  }

  //  if(isset($_SESSION['valid_user_name']))
  //  {
  //   //  echo "Hello " . $_SESSION['valid_user_name'];
  //  }
  //  else
  //  {
  //    echo "Nada";
  //  }
     
    //  $_SESSION['valid_user'] = $count['firstName'];
      //  $_SESSION['valid_user'] = "Bert"; //this is purely for debugging - comment out if you want to test the login feature

  // echo 'valid_user: '.$_SESSION['valid_user']; //debug and grab the valid_user variable

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
                <p>
                  <a href="checkout.php" class="cart-nav">
                  
                  <img src="img/cart_icon.png" alt="cart-icon">
                  </a>
                  </p>

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
	<main class="main-content container container-home">
    <!-- <img src="img/banner.png" class="index-banner" alt="banner"> -->
		<!-- club -->

    <!-- <h3 class="header-row-1">New Releases</h3> -->

    
      <?php
        if(isset($_SESSION['valid_user']) && $_SESSION['valid_user'] !== "") //if they are logged in
        {
          echo'<section class="content-item section-club">';
          echo '<h3 class="main-content-header">Your Recommendations</h3>
          <div class="header-row-1">';
          echo '<div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="game"/><p>Demon\'s Souls</p></a></div>';
          echo '</div>';
          echo'</section>';
        }
        else
        {
          // echo '<p>You are not logged in.</p>';
        }
      ?>
    

		<section class="content-item section-club">
    <h3 class="main-content-header">New Releases</h3>
    <div class="header-row-1">
      <!-- placeholder image from: https://breakthrough.org/wp-content/uploads/2018/10/default-placeholder-image.png -->
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="console"/><p>PS5</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="console"/><p>Xbox One Series S</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="console"/><p>Xbox One Series X</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="game"/><p>Demon's Souls</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png"alt="game"/><p>Gran Turismo 7</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="game"/><p>Marvel's Spider-man: Miles Morales</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="game"/><p>FIFA 21</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="game"/><p>Cyberpunk 2077</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="game"/><p>NBA 2K21</p></a></div>
      <div class="club" onclick="pointTo(catalog.php)"><a href="catalog.php"><img src="img/default-placeholder-image.png" alt="game"/><p>Assassin's Creed Valhalla</p></a></div>
    </div>
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
