<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="js/linkTo.js"></script>
    <script src="js/headerScroll.js"></script>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/normalize.css">

    <title>Manchester United 2019/2020 Home Kit</title>
    <script src="js/functions.js"></script>

  </head>
  <body>

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
	<div class="main-content container product">
		<!-- detailed product -->
      <section class="product-left">

        <div class="product-img">
          <div class="image-file image-1">
            <img class="image-preview" src="img/item_1_0.png" alt="image 1">
          </div>


          <div class="dot-row">
            <span class="image-dot dot-1 image-dot-active" onClick="showImageMU(1)"></span>
            <span class="image-dot dot-2" onClick="showImageMU(2)"></span>
            <span class="image-dot dot-3" onClick="showImageMU(3)"></span>
          </div>
        </div>

        <article class="product-info">
          <h3>Cyberpunk 2077</h3>
          <p class="price">$79.99</p>
          <p>Cyberpunk 2077 is an open-world, action-adventure story set in Night City, a megalopolis obsessed with power, glamour and body modification. You play as V, a mercenary outlaw going after a one-of-a-kind implant that is the key to immortality.</p>
        <div>
        <p>Console:</p>
        <select>
          <option value="PC">PC</option>
          <option value="XBOX">Xbox</option>
          <option value="PS4">PS4</option>
        </select>
        <p>Quantity:</p>
        <input type="number" name="quantity" min="1" max="99" value="1">
        <div class="add-to-cart-button">
          <button type="button" onclick="pointTo('cart.html')">Add to Cart</button>
        </div>
        </div>
        
        </article>





        <fieldset class="product-review">
          <legend>Product Reviews</legend>
          <div class="review-item">
            <div class="review-top-info">
              <p class="review-username">Ronaldinho1980</p>
              <p class="review-date">June 16, 2019</p>
            </div>
            <div class="review-description">
              <p>Great product, great design and build quality is top-notch. Highly recommend this product to all fans out there!</p>
            </div>
          </div>

          <div class="review-item">
            <div class="review-top-info">
              <p class="review-username">Beckham1975</p>
              <p class="review-date">June 10, 2019</p>
            </div>
            <div class="review-description">
              <p>Great product, great design and build quality is top-notch. Highly recommend this product to all fans out there!</p>
            </div>
          </div>
          <div class="review-item">
            <div class="review-top-info">
              <p class="review-username">CR7</p>
              <p class="review-date">June 10, 2019</p>
            </div>
            <div class="review-description">
              <p>Great product, great design and build quality is top-notch. Highly recommend this product to all fans out there!</p>
            </div>
          </div>
          <div class="review-write">
            <textarea placeholder="Write a review..."></textarea>
              <form>
                <button>Submit Review</button>
              </form>
          </div>


        </fieldset>
        <!-- end left -->
     </section>





	</div>
    <footer>
    <nav>
      <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
      <!-- <a href="citations.html">Citations</a> -->
    </nav>
  </footer>
  </body>
</html>
