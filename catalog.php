<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="js/linkTo.js"></script>
    <script src="js/headerScroll.js"></script>
    <script src="js/functions.js"></script>
    <!-- <script src="js/filtering.js"></script> -->
    <script src="js/jquery-3.5.1.min.js"></script>
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

    <?php
      // unset($genreQuery);
      $titleQuery ="";
      $featureQuery ="";
      $platformQuery ="";
      $dateQuery ="";
      $saleQuery ="";
      $priceQuery ="";
      $query="";
      // unset($filters);
    ?>


    <div class="content-item catalog-filter">
      <div class="sort-style">
        <!-- <p>Search</p> -->
        
        <!-- <form id = "filters" action="catalog.php" method="POST"> -->
          <ul>

          <input id="gameTitle" type="text" name="title" placeholder="Game Title">
          </ul>

          <p>Sort by: </p>
          <ul>
            <li><input type="radio" name="sort" class="sort" value="releaseDate DESC" checked> Arrival: Newest to Oldest</li>
            <li><input type="radio" name="sort" class="sort" value="releaseDate ASC"> Arrival: Oldest to Newest</li>
            <li><input type="radio" name="sort" class="sort" value="finalPrice ASC"> Price: Low to High</li>
            <li><input type="radio" name="sort" class="sort" value="finalPrice DESC"> Price: High to Low</li>
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
        <!-- </form> -->

        <script>
        var features;

        $(document).ready(function()
        {
            getQuery();
        })

          $('input[type=radio][name=sort]').change(function()
          {
            // alert("Sort: " + $('input[name="sort"]:checked').val());
            getQuery();
          });

          $('input[type=radio][name=price]').change(function()
          {
            // alert("Price: " + $('input[name="price"]:checked').val());
            getQuery();
          });

          $('[name="feature[]"]:checkbox').change(function()
          {
            getQuery();
          });

          $('[name="genre[]"]:checkbox').change(function()
          {
            // alert("Genre: " + $('input[name="genre[]"]:checked').val());
            getQuery();
          });

          $('[name="platform[]"]:checkbox').change(function()
          {
            // alert("Platform: " + $('input[name="platform[]"]:checked').val());
            getQuery();
          });

          $('[name="special"]:checkbox').change(function()
          {
            // alert("Specials: " + $('input[name="special"]:checked').val());
            getQuery();
          });

          $('[name="releaseDate"]').change(function()
          {
            // alert("Specials: " + $('input[name="special"]:checked').val());
            getQuery();
          });

          $('[name="title"]:text').keyup(function()
          {
            // alert("Game Title: " + $('input[name="title"]').val());
            getQuery();
          });
        </script>
      </div>


    </div>
    <!-- catalog list -->
    <div class="content-item catalog-list">


      <table id="results">


      </table>


	</main>
  <footer>
    <nav>
      <a href="https://github.com/iat352-fall-2020/video-game-store">GitHub</a>
      <!-- <a href="citations.html">Citations</a> -->
    </nav>
  </footer>
  </body>


<script>
  var myReq = getXMLHTTPRequest();



  function getXMLHTTPRequest() {
    var req =  false;
    try {
        /* for Firefox */
        req = new XMLHttpRequest();
    } catch (err) {
        try {
          /* for some versions of IE */
          req = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (err) {
          try {
              /* for some other versions of IE */
              req = new ActiveXObject("Microsoft.XMLHTTP");
          } catch (err) {
              req = false;
          }
      }
    }
    return req;
  }

  function getQuery()
  {
      var gametitle = $('#gameTitle').serialize();
      var sortBy = $('input[name="sort"]:checked').serialize();
      var onSale = $('input[name="special"]:checked').serialize();
      var price = $('input[name="price"]:checked').serialize();
      var genres = $('[name="genre[]"').serialize();
      var features = $('[name="feature[]"').serialize();
      var platforms = $('[name="platform[]"').serialize();
      var date = $('input[name="releaseDate"]').serialize();
      
      console.log(features);

      myReq = getXMLHTTPRequest();


      var data = gametitle + "&" + features  + "&" + sortBy +"&" +onSale + "&" + price + "&" + genres + "&" + platforms + "&" + date;
      console.log("Data: " + data);

      myReq.open("POST","filtercatalog.php",true);

      
      myReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");



      myReq.send(data);
      myReq.onreadystatechange = displayQuery;



      // alert(myReq.responseText);


  }

  function displayQuery()
  {
      if(myReq.readyState == 4)
      {
          if(myReq.status == 200) //if ready to respond
          {
              document.getElementById("results").innerHTML = myReq.responseText;
              // alert(myReq.responseText);
              // console.log()
          }
          else
          {
              alert("There was a problem with the script");
          }
      }
  }
</script>

  
</html>
