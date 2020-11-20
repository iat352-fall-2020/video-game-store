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
        $productAvgRating;

        $query = "SELECT * from product WHERE productID = $productID";
        $queryAvgReviews = "SELECT product.productID, format(AVG(review.rating),1) as AverageRating FROM product  INNER JOIN review ON review.productID = product.productID WHERE product.productID = $productID   GROUP BY review.productID";

        $addCartQuery = "";
        $addReviewQuery = "";

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
              $productDate = $row['releaseDate'];
            }
        }

        $result = mysqli_query($connect, $queryAvgReviews);

        if(!$result){
          echo "Failure: " . mysqli_error($connect);        
          die("Database query failed.");  
        }
        else
        {   
          while($row = mysqli_fetch_assoc($result))
            {
              $productAvgRating=$row['AverageRating'];
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
                  <a href="checkout.php" class="cart-nav"><img src="img/cart_icon.png" alt="cart-icon"></a>

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
	<div class="main-content container product">
		<!-- detailed product -->
      <section class="product-left">

        <div class="product-img">
          <!-- <div class="image-file image-1"> -->
            <img class="image-preview" src="img/default-placeholder-image.png" alt="<?php echo $productName?>">
          <!-- </div> -->


          <div class="dot-row">
            <span class="image-dot dot-1 image-dot-active" onClick="showImageMU(1)"></span>
            <span class="image-dot dot-2" onClick="showImageMU(2)"></span>
            <span class="image-dot dot-3" onClick="showImageMU(3)"></span>
          </div>
        </div>
                
        <article class="product-info">  <!--Show the price, details, rating and information of the product-->
          <h3><?php echo $productName?></h3>
          <?php switch($productConsole)
              {
                case 'PC':
                  echo '<img src="img/consoles/pc.png" class="detailedproduct-console" alt="1 star rating">';
                break;
                case 'Xbox':
                  echo '<img src="img/consoles/xbox.png" class="detailedproduct-console" alt="2 star rating">';
                break;
                case 'PS4':
                  echo '<img src="img/consoles/ps4.png" class="detailedproduct-console-ps4-ps5" alt="3 star rating">';
                break;
                case 'PS5':
                  echo '<img src="img/consoles/ps5.png" class="detailedproduct-console-ps4-ps5" alt="4 star rating">';
                break;
                case 'Nintendo Switch':
                  echo '<img src="img/consoles/switch.png" class="detailedproduct-console" alt="Nintendo Switch">';
                break;
              }
              ?>
              <p>
          <?php echo $productGenre; echo ", " . $productFeatures;?></p>
          <p><?php 
          if(!isset($productAvgRating))
          {
            // echo'N/A';
            echo '<img src="img/stars/0.png" class="detailedproduct-rating-img" alt="1 star rating">';
          }
          else
          {
          // echo $productAvgRating;
            switch($productAvgRating)
            {
              case 1:
                echo '<img src="img/stars/1.png" class="detailedproduct-rating-img" alt="1 star rating">';
              break;
              case 2:
                echo '<img src="img/stars/2.png" class="detailedproduct-rating-img" alt="2 star rating">';
              break;
              case 3:
                echo '<img src="img/stars/3.png" class="detailedproduct-rating-img" alt="3 star rating">';
              break;
              case 4:
                echo '<img src="img/stars/4.png" class="detailedproduct-rating-img" alt="4 star rating">';
              break;
              case 5:
                echo '<img src="img/stars/5.png" class="detailedproduct-rating-img" alt="5 star rating">';
              break;
            }
          }
          
          ?></p>
          
          <p><?php echo $productDesc ?></p>
          <p>
          
          <?php echo 'Released on '. $productDate?>
          </p>
          

          
          <?php
          echo '<div class="detailed-product-pricebox">';
            if($productDiscount > 0)
            {
              echo '<s>$';
              echo $productPrice;
              echo '</s>'; 
              echo ' <p class="detailed-product-price">$';
              echo $productFinalPrice;
              echo '</p>';
            }
            else
            {
              echo '<p class="detailed-product-price">';
              echo '$' . $productPrice;
              echo '</p>';
            }
            echo '</div>';
          ?>
          
        <div>
        <!-- <p>Console: <?php echo $productConsole ?></p> -->
        
        <form method="POST">
        <p>Quantity:
        <input type="number" name="quantity" min="1" max="99" value="1">
        <div class="add-to-cart-button">
        <?php
          if(isset($_SESSION['valid_user']) && $_SESSION['valid_user'] !== "") //check if user is logged in
          {
            echo '<input type="submit" class="cartButton" name ="cartSubmit" value="Add to Cart">';
          }
          else
          {
            echo 'You must be logged in to add items to the cart.';
          }
        ?></p>
        </div>
        </form>


        <?php
          if(isset($_POST['cartSubmit']))
          {
            $quantity = $_POST['quantity'];
            $customerID = $_SESSION['valid_user_id'];
            $addCartQuery = "REPLACE into cart (productID,customerID,quantity,status) VALUES ('$productID','$customerID','$quantity','unpaid')"; //updates the cart quantities if it already exists in the cart

            $result = mysqli_query($connect, $addCartQuery);

            if(!$result){
              echo "Failure: " . mysqli_error($connect);        
              die("Database query failed.");  
            }
            else
            {   
              echo "Cart added" . $addCartQuery;
              // while($row = mysqli_fetch_assoc($result))
              //   {
              //   }
            }
            }
        ?>

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
                  echo '<p class="review-username">'. $row['firstName'] . " " .$row['lastName'].'</p>';
                  echo ' <p class="review-date"> '. $row['reviewDate'] . ' </p>';
                  // echo $row['reviewDate'];
                  echo '</div>';
                  echo '<div class="review-description">';
                  echo '<p>'. $row['comment'] . '</p>';
                  switch(round($row['rating']))
                  {
                    case 1:
                      echo '<img src="img/stars/1.png" class="detailedproduct-rating-img" alt="1 star rating">';
                    break;
                    case 2:
                      echo '<img src="img/stars/2.png" class="detailedproduct-rating-img" alt="2 star rating">';
                    break;
                    case 3:
                      echo '<img src="img/stars/3.png" class="detailedproduct-rating-img" alt="3 star rating">';
                    break;
                    case 4:
                      echo '<img src="img/stars/4.png" class="detailedproduct-rating-img" alt="4 star rating">';
                    break;
                    case 5:
                      echo '<img src="img/stars/5.png" class="detailedproduct-rating-img" alt="5 star rating">';
                    break;
                  }
                  // echo '<p>'. $row['rating'] . ' Stars </p>';
                  echo '</div>';
                  echo '</div>';
                }
            }
          
          ?>



          <?php

            if(isset($_SESSION['valid_user']) && $_SESSION['valid_user'] !== "") //if they are logged in show adding review functionality
            {
            echo'<div class="review-write">
            <form action="" method="POST">
              <textarea name="comment" placeholder="Write a review..."></textarea>
                
              <p>
              <label for="stars"> Rating (1-5): </label>
              <select id="stars" name="stars">
                <option value ="1">1</option>
                <option value ="2">2</option>
                <option value ="3">3</option>
                <option value ="4">4</option>
                <option value ="5">5</option>
              </select>
              <input type="submit" name="submitReview" value="Submit Review">
              </p>
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

          <?php
            if(isset($_POST['submitReview']))
            {
              $selectStars = $_POST['stars'];
              $comment = $_POST['comment'];
              $currentDate = date("yy-m-d");
              $customerID = $_SESSION['valid_user_id'];

              $addReviewQuery = "INSERT INTO review (productID,customerID,rating,comment,reviewDate) VALUES ($productID, $customerID,$selectStars,'$comment','$currentDate')";

              $result = mysqli_query($connect, $addReviewQuery);
              
              echo $addReviewQuery;

              if(!$result)
              {
                echo "Failure: " . mysqli_error($connect);        
                die("Database query failed.");  
              }
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
