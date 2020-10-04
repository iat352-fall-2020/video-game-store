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
            <img class="nav-main-logo-img" src="img/logoSmall.png" alt="Logo" onclick="pointTo('index.html')"/>
            <div class="header-row-2">
              <input type="text" placeholder="Search here...">
              <img onclick="pointTo('catalog.html')" src="img/search-icon.png" alt="search-icon"/>

            </div>

            <nav class="nav-row-1">
              <div class="nav-main-item">
                <section class="profile-cart">
                  <a href="profile.html"><img src="img/profile_icon.png" alt="profile-icon"></a>
                  <a href="cart.html" class="cart-nav"><img src="img/cart_icon.png" alt="cart-icon"></a>
                </section>
              </div>

            </nav>
          </div>


          <!-- search bar -->


          <div class="header-row-3">
            <nav class="nav-row-3">
              <a href="catalog.html" class="nav-main-item">Catalog</a>
              <a href="catalog.html" class="nav-main-item">Catalog</a>
              <a href="news.html" class="nav-main-item">News</a>
              <a href="about.html" class="nav-main-item">About</a>
            </nav>
          </div>
        </div>

    </header>
	<!-- content -->
	<main class="main-content container container-home">
    <img src="img/banner.png" class="index-banner" alt="banner">
		<!-- club -->
    <h3>Shop By Club</h3>
		<section class="content-item section-club">
      <!-- images taken from https://www.premierleague.com/clubs -->
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/arsenal.svg" alt="football_club"/><p>Arsenal</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/aston_villa.svg" alt="football_club"/><p>Aston Villa</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/bournemouth.svg" alt="football_club"/><p>AFC Bournemouth</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/brighton_and_hove_albion.svg" alt="football_club"/><p>Brighton & Hove Albion</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/burnley.svg" alt="football_club"/><p>Burnley</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/chelsea.svg" alt="football_club"/><p>Chelsea</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/crystal_palace.svg" alt="football_club"/><p>Crystal Palace</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/everton.svg" alt="football_club"/><p>Everton</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/leicester_city.svg" alt="football_club"/><p>Leicester City</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/liverpool.svg" alt="football_club"/><p>Liverpool</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/man_city.svg" alt="football_club"/><p>Manchester City</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/man_utd.svg" alt="football_club"/><p>Manchester United</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/newcastle.svg" alt="football_club"/><p>Newcastle United</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/norwich.svg" alt="football_club"/><p>Norwich City</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/sheffield.svg" alt="football_club"/><p>Sheffield United</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/southampton.svg" alt="football_club"/><p>Southampton</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/tottenham.svg" alt="football_club"/><p>Tottenham Hotspur</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/watford.svg" alt="football_club"/><p>Watford</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/west_ham.svg" alt="football_club"/><p>West Ham United</p></a></div>
      <div class="club" onclick="pointTo(catalog.html)"><a href="catalog.html"><img src="img/BPL/wolves.svg" alt="football_club"/><p>Wolves</p></a></div>
		</section>
	</main>

  <footer>
    <nav>
      <a href="https://github.com/Sanada-Yukimura/IAT339-D101-P02">GitHub</a>
      <a href="Style_Guide/styleGuide.html">Style Guide</a>
      <a href="citations.html">Citations</a>
    </nav>
  </footer>
  </body>
</html>
