<!DOCTYPE html>
<html lang="en">
<?php
        $dbhost = "localhost";
        $dbuser = "root";
        $dbpass = "";
        $dbname = "benedict_wong";
        $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

        if(isset($_GET['productID']))
        $productID = $_GET['productID'];
        else
        {
          header('Location: index.php');
        }
        $productName="";
        $productDesc="";
        $productPrice="";

        $query = "SELECT * from product WHERE productID = $productID";

        $addCartQuery = "";

        $result = mysqli_query($connect, $query);

        if(!$result){
          echo "Failure: " . mysqli_error($connect);        
          die("Database query failed.");  
        }
        else
        {   
          while($row = mysqli_fetch_assoc($result))
            {
              $productName = $row['productName'];
              $productDesc = $row['productDesc'];
              $productPrice = $row['price'];
              $productFinalPrice = $row['finalPrice'];
              $productConsole = $row['console'];
              $productGenre = $row['genre'];
              $productFeatures = $row['features'];
              $productDiscount = $row['discount'];
            }
        }
?>




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

    <title><?php echo $productName;?></title>
    <script src="js/functions.js"></script>

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
	<div class="main-content container product">
		<!-- detailed product -->
      <section class="product-left">

        <div class="product-img">
          <div class="image-file image-1">
            <img class="image-preview" src="img/item_1_0.png" alt="<?php echo $productName?>">
          </div>


          <div class="dot-row">
            <span class="image-dot dot-1 image-dot-active" onClick="showImageMU(1)"></span>
            <span class="image-dot dot-2" onClick="showImageMU(2)"></span>
            <span class="image-dot dot-3" onClick="showImageMU(3)"></span>
          </div>
        </div>

        <article class="product-info">
          <h3><?php echo $productName?></h3>
          <?php echo $productGenre; echo ", " . $productFeatures;?>
          <p class="price"><s><p>$<?php echo $productPrice?></s> $<?php echo $productFinalPrice?></p>
          <p><?php echo $productDesc ?></p>
        <div>
        <p>Console: <?php echo $productConsole ?></p>
        
        <p>Quantity:</p>
        <input type="number" name="quantity" min="1" max="99" value="1">
        <div class="add-to-cart-button">
          <button type="button" onclick="<?php 
          //add cart item to shopping cart

          ?>">Add to Cart</button>
        </div>
        </div>
        
        </article>





        <fieldset class="product-review">
          <legend>Product Reviews</legend>

          <?php 

            $reviewQuery = "SELECT customer.firstName, customer.lastName, review.comment, review.rating, review.reviewDate from review INNER JOIN customer ON customer.customerID = review.customerID WHERE productID = '$productID'";
            $result = mysqli_query($connect, $reviewQuery);
    
            if(!$result){
              echo "Failure: " . mysqli_error($connect);        
              die("Database query failed.");  
            }
            else
            {   
              while($row = mysqli_fetch_assoc($result))
                {
                  echo '<div class="review-item">';
                  echo '<div class="review-top-info">';
                  echo '<p class="review-username">'. $row['firstName'] . ' ' .$row['lastName'].'</p>';
                  echo '<p class="review-date">'. $row['reviewDate'] . '</p>';
                  echo '</div>';
                  echo '<div class="review-description">';
                  echo '<p>'. $row['comment'] . '</p>';
                  echo '</div>';
                  echo '</div>';
                }
            }
          
          ?>



          <?php

          if(isset($_SESSION['valid_user']) && $_SESSION['valid_user'] !== "") //if they are logged in show the profile icon
          {
          echo'<div class="review-write">
            <textarea placeholder="Write a review..."></textarea>
              <form>
                <button type="button" onclick="#">Submit Review</button>
              </form>
          </div>';
          }
          else
          {
            echo'<div class="review-write">
            <p>Please log-in in order to review and comment.</p>
          </div>';
          }
          ?>


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
