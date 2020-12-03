<script src="js/jquery-3.5.1.min.js"></script>

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

    // unset($genreQuery);
    $titleQuery ="";
    $featureQuery ="";
    $platformQuery ="";
    $dateQuery ="";
    $saleQuery ="";
    $priceQuery ="";
    // unset($filters);

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
    // foreach($_POST['feature'] as $check)
    // {
        // echo $check;
        $featureQuery = "features IN (" . "'". implode("','",$_POST['feature']) . "'". ")";
    // }
    $filters[] = $featureQuery;
    }
    else
    {
        // echo "Features Empty! ";
    }

    if(!empty($_POST['genre']))
    {
    // foreach($_POST['genre'] as $check)
    // {
        $genreQuery = "genre IN (" . "'". implode("','",$_POST['genre']) . "'". ")";
    // }
    $filters[] = $genreQuery;
    }
    else
    {
        // echo "Genre Empty! ";
    }

    if(!empty($_POST['releaseDate']))
    {
    $filters[] = "releaseDate = '". $_POST['releaseDate']."'";
    }
    

    if(!empty($_POST['platform']))
    {
    // foreach($_POST['platform'] as $check)
    // {
        $platformQuery = "console IN (" . "'". implode("','",$_POST['platform']) . "'". ")";
    // }
    $filters[] = $platformQuery;
    }
    else
    {
        // echo "Platform Empty! ";
    }

    if(!empty($_POST['special']) && $_POST['special'] != "undefined")
    {
    $saleQuery = " discount > 0 ";
    $filters[] = $saleQuery;
    }
    else
    {
        // echo "Sales Empty! ";
    }


    if(!empty($_POST['price']) && $_POST['price']!= "undefined")
    {
    $priceQuery = " finalPrice <= '" . $_POST['price'] . "'";
    $filters[] = $priceQuery;
    }
    else
    {
        // echo "Price Empty! ";
    }
    
    //query building
    if(isset($_POST['title']) && $_POST['title'] != "") //game title check
    {
        // alert("Title: " .$_POST['title']);
    echo 'Title: ' .$_POST['title'];
    $titleQuery .= "productName LIKE '%" .$_POST['title'] . "%' ";
    // $query .= "productName LIKE '%" .$_POST['title'] . "%' ";
    $filters[] = $titleQuery;
    }
    else
    {
        // echo 'Title Empty!';
    }
    
    if(!empty($filters))
    {
    $query .= " WHERE " . implode(' AND ',$filters);
    }

    $query .= " GROUP BY product.productID"; //left join in order to show products that don't have reviews yet as well as products that do



    // orders it in newest release date order by default
    $query .= " ORDER BY ";
    if(isset($_POST['sort']) && $_POST['sort'] != "")
    {
        // echo 'Sort: '.$_POST['sort'];
    $query.= $_POST['sort'];
    }
    else
    {
    $query .= "releaseDate DESC";
    }


    //debugging for the entire finished query
    // echo '<p>Query: '.$query.'</p>';

    // if(isset($filters))
    // echo 'Filters: '. implode(" ", $filters);


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
        // $output.='<td> 
        // <div class="item " id= "MU1920"><a href="detailedproduct.php?productID=';
        // $output.= $row['productID'];
        // $output .= '"><img src="img/default-placeholder-image.png" class="placeholder-img" alt="';
        // $output.= $row['productName'];
        // $output.= '"/><p class="item_name">';
        // $output.= $row['productName'];
        // $output.= '</p><p>';



        echo'<td>';
        echo '<div class="item " id= "MU1920"><a href="detailedproduct.php?productID=';
        echo $row['productID'];
        echo '"><img src="img/default-placeholder-image.png" class="placeholder-img" alt="';
        echo $row['productName'];
        echo'"/><p class="item_name">';
        echo $row['productName'];
        echo '</p>';
        // echo $output;

        

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