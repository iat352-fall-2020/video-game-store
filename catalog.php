<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="js/linkTo.js"></script>
    <script src="js/headerScroll.js"></script>
    <script src="js/functions.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/grid.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/styles.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="css/normalize.css">
    <title>Catalog</title>

<!--
    w3schools(n.d.). tryhtml_form_checkbox. Retrieved from https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_form_checkbox
 -->

  </head>
  <body>
  <?php 
  //This will be the catalog's database code to be filled in
  ?>

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
              <a href="news.html" class="nav-main-item">News</a>

              <a href="about.html" class="nav-main-item">About</a>
            </nav>
          </div>
        </div>

    </header>
	<!-- content -->
	<main class="main-content container">
		<!-- search and filter -->


    <div class="content-item catalog-filter">
      <div class="sort-style">
        <!-- <p>Search</p> -->
        <ul>
        <input type="text" name="title" placeholder="Game Title">
        </ul>

        <p>Sort by: </p>
        <ul>
          <li><input type="radio" name="sort" value="time" onclick="sortBy(1)"> Arrival: Newest to Oldest</li>
          <li><input type="radio" name="sort" value="time" onclick="sortBy(2)"> Arrival: Oldest to Newest</li>
          <li><input type="radio" name="sort" value="price" onclick="sortBy(3)"> Price: Low to High</li>
          <li><input type="radio" name="sort" value="price" onclick="sortBy(4)"> Price: High to Low</li>
        </ul>

        <p>Features</p>
        <ul>
          <li><input type="checkbox" name="feature" value="online" onclick="">Online Multiplayer</li>
          <li><input type="checkbox" name="feature" value="splitscreen" onclick="">Split-screen</li>
          <li><input type="checkbox" name="feature" value="story" onclick="">Story-based</li>
          <li><input type="checkbox" name="feature" value="controller" onclick="">Controller Support</li>
          <li><input type="checkbox" name="feature" value="crossplatform" onclick="">Cross-Platform</li>
        </li>
        </ul>

        <p>Genre</p>
        <ul>
        <li><input type="checkbox" name="genre" value="sp" onclick="">Singleplayer</li>
          <li><input type="checkbox" name="genre" value="mp" onclick="">Multiplayer</li>
          <li><input type="checkbox" name="genre" value="Action" onclick="">Action</li>
          <li><input type="checkbox" name="genre" value="Adventure" onclick="">Adventure</li>
          <li><input type="checkbox" name="genre" value="Fighting" onclick="">Fighting</li>
          <li><input type="checkbox" name="genre" value="Rhythm" onclick="">Rhythm</li>
          <li><input type="checkbox" name="genre" value="Strategy" onclick="">Strategy</li>
          <li><input type="checkbox" name="genre" value="Puzzle" onclick="">Puzzle</li>
          <li><input type="checkbox" name="genre" value="Casual" onclick="">Casual</li>
          <li><input type="checkbox" name="genre" value="RPG" onclick="">RPG</li>
          <li><input type="checkbox" name="genre" value="Shooting" onclick="">Shooting</li>
          <li><input type="checkbox" name="genre" value="Sports" onclick="">Sports</li>
        </ul>

        <p>Release Date</p>
        <ul>
        <li><input type="date" name="releaseDate" value="releaseDate"></li>
        </ul>

        <p>Platform</p>
        <ul>
        <li><input type="checkbox" name="platform" value="PC">PC</li>
        <li><input type="checkbox" name="platform" value="PS4">PS4</li>
        <li><input type="checkbox" name="platform" value="Xbox">Xbox</li>
        <li><input type="checkbox" name="platform" value="Switch">Nintendo Switch</li>
        <li><input type="checkbox" name="platform" value="PS5">PS5</li>
        </ul>

        <p>Special Deals</p>
        <ul>
        <li><input type="checkbox" name="special" value="sale" onclick="">On Sale</li>
        </ul>

        <p>Price</p>
        <ul>
        <li><input type="checkbox" name="sort" value="5" onclick="">Less than $5</li>
        <li><input type="checkbox" name="sort" value="10" onclick="">Less than $10</li>
        <li><input type="checkbox" name="sort" value="20" onclick="">Less than $20</li>
        </ul>

      </div>


    </div>
    <!-- catalog list -->
    <div class="content-item catalog-list">
      <div onclick="pointTo('detailedProductMU.html')" class="item " id= "MU1920"><img src="img/Games/Cyberpunk_2077_box_art.jpg" alt="Cyberpunk 2077"/><p class="item_name">Cyberpunk 2077</p><p>Standard Edition</p><p class="price">$79.99</p>
      <noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript>

      </div>
      <div onclick="pointTo('detailedProductTH.html')" class="item " id= "TH1819"><img src="img/Games/phasmaphobia.jpg" alt="Phasmophobia"/><p class="item_name">Phasmophobia</p><p></p>
      <p class="price">$14.99</p>
      <noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript>
      </div>
      <div onclick="pointTo('detailedProductMU.html')" class="item" id= "MC1819"><img src="img/Games/bg3.jpg" alt="Baldur's Gate 3"/><p class="item_name">Baldur's Gate 3</p><p></p>
      <p class="price">$79.99</p>
      <noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript>
      </div>
      <div onclick="pointTo('detailedProductMU.html')" class="item " id= "A1718"><img src="img/Games/squadron.jpg" alt="STAR WARS™: Squadrons"/><p class="item_name">STAR WARS™: Squadrons</p><p></p>
      <p class="price">$79.99</p><noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript></div>
      <div onclick="pointTo('detailedProductMU.html')" class="item " id= "MU1819"><img src="img/Games/spelunky2.jpg" alt="Spelunky 2"/><p class="item_name">Spelunky 2</p><p></p>
      <p class="price">$19.99</p><noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript></div>
      <div onclick="pointTo('detailedProductTH.html')" class="item " id= "C1819"><img src="img/Games/hades.jpg" alt="Hades"/><p class="item_name">Hades</p><p></p>
      <p class="price">$19.99</p><noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript></div>
      <div onclick="pointTo('detailedProductTH.html')" class="item " id= "E1819"><img src="img/Games/iceborne.jpeg" alt="Monster Hunter World: Iceborne"/><p class="item_name">Monster Hunter World: Iceborne</p><p></p>
      <p class="price">$79.99</p><noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript></div>
      <div onclick="pointTo('detailedProductMU.html')" class="item " id= "MU9800"><img src="img/Games/ror2.jpg" alt="Risk of Rain 2"/><p class="item_name">Risk of Rain 2</p><p></p>
      <p class="price">$19.99</p><noscript><a href="detailedProductMU.html" class="noscript-a">More info</a></noscript></div>
    </div>

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
