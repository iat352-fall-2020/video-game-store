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


    $customerID = $_SESSION['valid_user_id'];
    $totalPrice = 0;

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
<main class="main-content">
        <!-- profile information -->
    <div class="cart cart-container">
        <div class="cart-info-box">
            <h3>Store Cart</h3>
            

            
            <?php 
            if(isset($_SESSION['valid_user']) && $_SESSION['valid_user'] !== "")
            {
                $query = "SELECT * from cart INNER JOIN product ON cart.productID = product.productID INNER JOIN customer ON cart.customerID = customer.customerID WHERE cart.customerID = $customerID AND status ='unpaid'";

                $addCartQuery = "";
                
        
                $result = mysqli_query($connect, $query);
        
                if(!$result)
                {
                  echo "Failure: " . mysqli_error($connect);        
                  die("Database query failed.");  
                }
                else
                {  
                  echo '<div class=" cart-box">';
                  while($row = mysqli_fetch_assoc($result))
                  {
                    echo '<form method="POST">';
                    echo '<div class="cart-item">';
                      echo '<img src="img/default-placeholder-image.png" alt="'. $row['productName'].'"/>';

                      echo '<div class="cart-item-description">';
                      echo '<p>'. $row['productName']. '</p>';
                      echo '<p>Unit Price: $'. $row['finalPrice']. '</p>';
                      echo '<p class="price">Subtotal: $'. ($row['finalPrice'] * $row['quantity']). '</p>';
                      echo '<input type="number" name="quantity" min="1" max="99" value="'.$row['quantity'].'">';
                      echo '<input type = "submit" name="updateQuantity" id = "update" value = "Update Quantity">';
                      echo '</div>';
                    echo '</div>';
                    echo '</form>';
                    $totalPrice += $row['finalPrice'] * $row['quantity'];
                  }
                  echo '</div>';
                }
                
            }
              else
              {
                echo 'You must be logged in to check your cart.';
              }
            ?>

            <?php
              if(isset($_POST['update'])) //updating or removing the quantity of items in a cart (WIP)
              { 
                // $oldQuantity = $row['quantity'];
                // $newQuantity = $_POST['quantity'];
                // echo 'Quantity was: ' . $row['quantity'] . ' Now: ' . $_POST['quantity'];
                // $updateQuery = "UPDATE cart SET ";
              }
            ?>
            
              

              
            

            <div class="cart-footer"> <!--Cart Footer-->
              <p class="price">Total: $ <?php echo $totalPrice;?> </p> 

              <div class="add-to-cart-button">
              <button type="button" class="checkout-button" onclick="pointTo('#')">Checkout</button>
              </div>
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
