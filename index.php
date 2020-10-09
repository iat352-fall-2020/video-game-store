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
  </head>
  <body>

    <header id="header">
        <!-- logo? -->
        <div class="header-menu ">


          <div class="header-row-1">
            <img class="nav-main-logo-img" src="img/Logo.png" alt="Logo" onclick="pointTo('index.php')"/>
            <div class="header-row-2">
              <input type="text" placeholder="Search here...">
              <img onclick="pointTo('catalog.html')" src="img/search-icon.png" alt="search-icon"/>

            </div>

            <nav class="nav-row-1">
              <div class="nav-main-item">
                <section class="profile-cart">
                  <a href="profile.php"><img src="img/profile_icon.png" alt="profile-icon"></a>
                  <a href="cart.html" class="cart-nav"><img src="img/cart_icon.png" alt="cart-icon"></a>
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
	<main class="main-content container container-home">
    <!-- <img src="img/banner.png" class="index-banner" alt="banner"> -->
		<!-- club -->
    <h3>New Releases</h3>
		<section class="content-item section-club">
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

		</section>
	</main>

  <footer>
    <nav>
      <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
      <a href="citations.html">Citations</a>
    </nav>
  </footer>
  </body>
</html>
