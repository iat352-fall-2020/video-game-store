// var myReq = getXMLHTTPRequest();



// function getXMLHTTPRequest() {
//    var req =  false;
//    try {
//       /* for Firefox */
//       req = new XMLHttpRequest();
//    } catch (err) {
//       try {
//          /* for some versions of IE */
//          req = new ActiveXObject("Msxml2.XMLHTTP");
//       } catch (err) {
//          try {
//             /* for some other versions of IE */
//             req = new ActiveXObject("Microsoft.XMLHTTP");
//          } catch (err) {
//             req = false;
//          }
//      }
//    }
//    return req;
// }

// function getQuery()
// {
//     var gametitle = document.getElementById("gameTitle").value;
//     var sortBy = $('input[name="sort"]:checked').val();
//     var features = "Online Multiplayer";
//     var onSale = $('input[name="special"]:checked').val();
//     var price = $('input[name="price"]:checked').val();
//     var features;

//     features = $('[name="feature[]"').serialize();
//     console.log(features)
//    //  var result = $.param(features);

//    //  features=features.split("feature%5B%5D=");
//     console.log(features);
//     alert("HI");

//     // alert($('input[name="special"]:checked').val());

//     myReq = getXMLHTTPRequest();

//     // if(gametitle == "")
//     // {
//     //     alert('NADA');
//     // }

//     var data = "title=" + gametitle + "&features=" + features + "&sort=" + sortBy + "&special=" + onSale + "&price=" + price;
//    console.log(data);

//     myReq.open("POST","filtercatalog.php",true);

    
//     myReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");



//     myReq.send(data);
//     myReq.onreadystatechange = displayQuery;



//     // alert(myReq.responseText);


// }

// function displayQuery()
// {
//     if(myReq.readyState == 4)
//     {
//         if(myReq.status == 200) //if ready to respond
//         {
//             document.getElementById("results").innerHTML = myReq.responseText;
//             // alert(myReq.responseText);
//             console.log()
//         }
//         else
//         {
//             alert("There was a problem with the script");
//         }
//     }
// }