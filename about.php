<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <script src="js/headerScroll.js"></script>
    <script src="js/linkTo.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/normalize.css">
    <title>About</title>


  </head>
  <body>
  <?php
  session_start();
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
              <!-- <a href="locations.php#" class="nav-main-item">Locations</a>  -->
              <a href="about.php" class="nav-main-item">About Us</a>
              <!-- <a href="catalog.php" class="nav-main-item">Xbox</a>
              <a href="catalog.php" class="nav-main-item">Nintendo</a>
              <a href="catalog.php" class="nav-main-item">Deals</a> -->
            </nav>
          </div>
        </div>

    </header>
	<!-- content -->
	<main class="main-content container about">

    <article class="about-content">

      <section class="about-contact">
        <!-- contact us -->

      </section>
      <!-- store addresses -->
      <section class="about-addresses">

      </section>

      <!-- FAQ -->
      <section class="about-faq">

          <h4 id="faq">FAQ</h4>
          <details>
            <summary>What if the item I purchased is in back-order?</summary>
            <p class="answer">Don't worry, we have your order in our list! When we are ready to ship your order, we will only charge you then and ship as soon as possible.</p>
          </details>
          <details>
            <summary>What if the item I want to purchase is out of stock?</summary>
            <p class="answer">If the item you want is still being produced, stay patient. We will stock items within 2 weeks of it going out of stock. If you wish, you can subscribe to our mailing list and get a notification when our items have been restocked.</p>
          </details>
          <details>
            <summary>I purchased the wrong item, how do I return it?</summary>
            <p class="answer">Let us know via e-mail about your item and we will send you a paid shipping label. Once you receive the shipping label, just repackage your order and ship it back to us. We will refund you within 2 business days of us receving the package.</p>
          </details>
        </section>
    </article>

    <!-- end of main content -->
	</main>

  <footer>
    <nav>
      <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
      <!-- <a href="citations.html">Citations</a> -->
    </nav>
  </footer>


  </body>
</html>
