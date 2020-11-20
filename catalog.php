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
  session_start();
  ?>


<!-- Framework reused from a previous project, approved for use by Professor Serban: http://www.sfu.ca/~bwa44/IAT339-D101-P02/ -->


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
	<main class="main-content container">
		<!-- search and filter -->


    <div class="content-item catalog-filter">
      <div class="sort-style">
        <!-- <p>Search</p> -->

        <form action="catalog.php" method="POST">
          <ul>
          <input type="text" name="title" placeholder="Game Title" value="<?php echo isset($_POST["title"]) ? $_POST["title"] : ''; ?>">
          </ul>

          <p>Sort by: </p>
          <ul>
            <li><input type="radio" name="sort" value="releaseDate DESC"> Arrival: Newest to Oldest</li>
            <li><input type="radio" name="sort" value="releaseDate ASC"> Arrival: Oldest to Newest</li>
            <li><input type="radio" name="sort" value="finalPrice ASC"> Price: Low to High</li>
            <li><input type="radio" name="sort" value="finalPrice DESC"> Price: High to Low</li>
          </ul>

          <p>Features</p>
          <ul>
            <li><input type="checkbox" name="feature[]" value="Online Multiplayer" onclick="">Online Multiplayer</li>
            <li><input type="checkbox" name="feature[]" value="Split-screen" onclick="">Split-screen</li>
            <li><input type="checkbox" name="feature[]" value="Story-based" onclick="">Story-based</li>
            <li><input type="checkbox" name="feature[]" value="Controller Support" onclick="">Controller Support</li>
            <li><input type="checkbox" name="feature[]" value="Cross-Platform" onclick="">Cross-Platform</li>
          </li>
          </ul>

          <p>Genre</p>
          <ul>
          <li><input type="checkbox" name="genre[]" value="Singleplayer" onclick="">Singleplayer</li>
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
            <li><input type="checkbox" name="genre[]" value="Sports" onclick="">Sports</li>
          </ul>

          <p>Release Date</p>
          <ul>
          <li><input type="date" name="releaseDate" value="releaseDate"></li>
          </ul>

          <p>Platform</p>
          <ul>
          <li><input type="checkbox" name="platform[]" value="PC">PC</li>
          <li><input type="checkbox" name="platform[]" value="PS4">PS4</li>
          <li><input type="checkbox" name="platform[]" value="Xbox">Xbox</li>
          <li><input type="checkbox" name="platform[]" value="Nintendo Switch">Nintendo Switch</li>
          <li><input type="checkbox" name="platform[]" value="PS5">PS5</li>
          </ul>

          <p>Special Deals</p>
          <ul>
          <li><input type="checkbox" name="special" value="sale" onclick="">On Sale</li>
          </ul>

          <p>Price</p>
          <ul>
          <li><input type="radio" name="price" value="5" onclick="">Less than $5</li>
          <li><input type="radio" name="price" value="10" onclick="">Less than $10</li>
          <li><input type="radio" name="price" value="20" onclick="">Less than $20</li>
          </ul>

          <input type="submit" name="search" value="Search">
        </form>
        <?php


        ?>
      </div>


    </div>
    <!-- catalog list -->
    <div class="content-item catalog-list">


      <table>
      <?php //catalogue filtering and pagination
        $dbhost = "localhost";
        $dbuser = "root";
        $dbpass = "";
        $dbname = "benedict_wong";
        $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);


        //pagination settings (WIP)
        if(isset($_GET['pageno']))
        {
          $pageno = $_GET['pageno'];
        }
        else
        {
          $pageno = 1;
        }
        $recordsPerPage = 10; //results per page
        $offset = ($pageno-1) * $recordsPerPage;

        $itemsPerRow = 5;

        unset($genreQuery);
        $titleQuery ="";
        $featureQuery ="";
        $platformQuery ="";
        $dateQuery ="";
        $saleQuery ="";
        $priceQuery ="";
        unset($filters);

        if($connect){ //check connection
        }
        else{
          die("exit");
        }

        $query = "SELECT product.productID,productName, price, discount,genre,finalPrice,genre,console,releaseDate,features, format(AVG(review.rating),1) as AverageRating 
        FROM product  
        LEFT JOIN review 
        ON review.productID = product.productID"; 

if(!empty($_POST['feature']))
{
  foreach($_POST['feature'] as $check)
  {
    // echo $check;
    $featureQuery = "features IN (" . "'". implode("','",$_POST['feature']) . "'". ")";
  }
  $filters[] = $featureQuery;
}

if(!empty($_POST['genre']))
{
  foreach($_POST['genre'] as $check)
  {
    $genreQuery = "genre IN (" . "'". implode("','",$_POST['genre']) . "'". ")";
  }
  $filters[] = $genreQuery;
}

if(!empty($_POST['releaseDate']))
{
  $filters[] = "releaseDate = '". $_POST['releaseDate']."'";
}

if(!empty($_POST['platform']))
{
  foreach($_POST['platform'] as $check)
  {
    $platformQuery = "console IN (" . "'". implode("','",$_POST['platform']) . "'". ")";
  }
  $filters[] = $platformQuery;
}

if(!empty($_POST['special']))
{
  $saleQuery = " discount > 0 ";
  $filters[] = $saleQuery;
}

if(!empty($_POST['price']))
{
  $priceQuery = " finalPrice <= '" . $_POST['price'] . "'";
  $filters[] = $priceQuery;
}

if(!empty($filters))
{
$query .= " WHERE " . implode(' AND ',$filters);
}

        $query .= " GROUP BY product.productID"; //left join in order to show products that don't have reviews yet as well as products that do

        //query building
        if(isset($_POST['title']) && $_POST['title'] != "") //game title check
        {
          // echo 'Title: ' .$_POST['title'];
          $titleQuery .= "productName LIKE '%" .$_POST['title'] . "%' ";
          // $query .= "productName LIKE '%" .$_POST['title'] . "%' ";
          $filters[] = $titleQuery;
        }





        // orders it in newest release date order by default
        $query .= " ORDER BY ";
        if(isset($_POST['sort']) && $_POST['sort'] != "")
        {
          $query.= $_POST['sort'];
        }
        else
        {
          $query .= "releaseDate DESC";
        }


        //debugging for the entire finished query
		// echo '<p>Query: '.$query.'</p>';


        $result = mysqli_query($connect, $query);


        if(!$result){
          echo "Failure: " . mysqli_error($connect);
          die("Database query failed.");
        }
        else
        {
          $num = mysqli_num_rows($result); //total count of results
          $resultindex = 1; //current index of results


          echo'<tr>';
            while($row = mysqli_fetch_assoc($result))
            {
              
              echo'<td>';
              echo '<div class="item " id= "MU1920"><a href="detailedproduct.php?productID=';
              echo $row['productID'];
              echo '"><img src="img/default-placeholder-image.png" class="placeholder-img" alt="';
              echo $row['productName'];
              echo'"/><p class="item_name">';
              echo $row['productName'];
              echo '</p>';

             

              echo '<p>';
              // echo $row['console'];
              switch($row['console'])
              {
                case 'PC':
                  echo '<img src="img/consoles/pc.png" class="console" alt="1 star rating">';
                break;
                case 'Xbox':
                  echo '<img src="img/consoles/xbox.png" class="console" alt="2 star rating">';
                break;
                case 'PS4':
                  echo '<img src="img/consoles/ps4.png" class="console-ps4-ps5" alt="3 star rating">';
                break;
                case 'PS5':
                  echo '<img src="img/consoles/ps5.png" class="console-ps4-ps5" alt="4 star rating">';
                break;
                case 'Nintendo Switch':
                  echo '<img src="img/consoles/switch.png" class="console" alt="Nintendo Switch">';
                break;
              }
              echo '</p>';
              echo '<p>';
              echo $row['genre'];
              echo ' ';
              echo $row['features'];
              echo '</p>';
               // echo 'Average Rating: ';
               if(!isset($row['AverageRating']))
               {
                 // $row['AverageRating'] = 'N/A';
                 echo '<img src="img/stars/0.png" class="rating-img" alt="1 star rating">';
               }
               else
               {
                 switch(round($row['AverageRating']))
                 {
                   case 1:
                     echo '<img src="img/stars/1.png" class="rating-img" alt="1 star rating">';
                   break;
                   case 2:
                     echo '<img src="img/stars/2.png" class="rating-img" alt="2 star rating">';
                   break;
                   case 3:
                     echo '<img src="img/stars/3.png" class="rating-img" alt="3 star rating">';
                   break;
                   case 4:
                     echo '<img src="img/stars/4.png" class="rating-img" alt="4 star rating">';
                   break;
                   case 5:
                     echo '<img src="img/stars/5.png" class="rating-img" alt="5 star rating">';
                   break;
                 }
               }
               // echo $row['AverageRating'];
              // echo '<p> Released on: ';
              // echo $row['releaseDate'];
              // echo '</p>';
              echo '<p>';
              if($row['discount']>0)
              {
                echo'<strike>$'. $row['price'] . '</strike>';
                echo ' %'.$row['discount'] . ' off!';
              }
              echo '<p class="price">$';
              echo $row['finalPrice'];
              echo'</p></a>';
              // echo'<noscript><a href="detailedproduct.php';
              // echo '" class="noscript-a">More info</a></noscript></div>';
              echo'</td>';
              if($resultindex % $itemsPerRow == 0)
              {
                echo'</tr>';
              }
              $resultindex++;
            }
        }




      ?>

      </table>


	</main>
  <footer>
    <nav>
      <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
      <!-- <a href="citations.html">Citations</a> -->
    </nav>
  </footer>
  </body>
</html>
