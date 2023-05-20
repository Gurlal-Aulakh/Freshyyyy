<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="img/express-favicon.png" type="image/x-icon" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>RedCaynne Re</title>
    
        <!-- Icon css link -->
        <link href="vendors/material-icon/css/materialdesignicons.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="vendors/linears-icon/style.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Rev slider css -->
        <link href="vendors/revolution/css/settings.css" rel="stylesheet">
        <link href="vendors/revolution/css/layers.css" rel="stylesheet">
        <link href="vendors/revolution/css/navigation.css" rel="stylesheet">

        <!-- Extra plugin css -->
        <link href="vendors/bootstrap-selector/bootstrap-select.css" rel="stylesheet">
        <link href="vendors/bootatrap-date-time/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <link href="vendors/owl-carousel/assets/owl.carousel.css" rel="stylesheet">

        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <style>
@import url('https://fonts.googleapis.com/css2?family=Barrio&family=Bungee+Shade&family=Ceviche+One&family=Delius+Swash+Caps&family=Monofett&family=Roboto&display=swap');
</style> 
        <style>
                 .btn-outline-primary {
  color: #007bff;
  border-color: #007bff;
  background-color: #fff;
}

.btn-outline-primary:hover {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
}

.btn-outline-primary:focus, .btn-outline-primary.focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
}
</style>

 <style>
                 .btn-outline-primary2 {
  color:green;
  border-color: green;
  background-color: #fff;
}

.btn-outline-primary2:hover {
  color: #fff;
  background-color: green;
  border-color: green;
}

.btn-outline-primary2:focus, .btn-outline-primary2.focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
}
</style>

      <style>
                 .btn-outline-primary1 {
  color: #b10400;
  border-color: #b10400;
  background-color: #fff;
}

.btn-outline-primary1:hover {
  color: #ffffff;
  background-color: #b10400;
  border-color: #b10400;
}

.btn-outline-primary1:focus, .btn-outline-primary1.focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
}
</style>

        <script>
           var arr;
           var arr1;
            var id=<%= request.getParameter("index") %>;
            function showRestaurantDetail()
            {
                
               // alert("id="+id);
               var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        //alert(r);
                        var mainobj = JSON.parse(r);

                         arr = mainobj.ans;
                        
                       
                       restaurantDetails();
                    }
                };

                xhr.open("GET", "./Restaurant_Info?id="+id, true);

               
                xhr.send();
            }

             function getFoodItems(name,photo)
            {
                if(name=="All")
                {
                    photo="foodItemPhoto/all.jpg";
                }
               // alert(name);
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                 if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        //alert("food items="+r);
                        var mainobj = JSON.parse(r);
                        var ans="";
                         var arr4 = mainobj.ans;
          ans+="<div class=\"container\">";
            ans+="<div class=\"row\">";
                ans+="<div class=\"col-sm-12\">";
                   // ans+="<div class=\"jumbotron\">"; 
                   //     ans+="<center> <h1 class=\"h1\">"+name+"</h1></center>";
                   // ans+="</div>";
                   ans+="<div class=\"jumbotron\">";
                  
                    ans+="<center> <h1 style=\"font-family: \'Delius Swash Caps\', cursive;\">"+name+"</h1></center>";
                    //<h2>LIST</h2>
                ans+="</div>";
                ans+="</div>";
                ans+="</div>";
           ans+="</div>";
            ans+="</div>";
            
            ans+="<div class=\"container\">";
             ans+="<div class=\"row\">";
                ans+="<div class=\"col-sm-12\">";
                    //ans+="<div class=\"jumbotron\">";  
                        ans+="<center><img src=\""+photo+"\" style=\"width:80%; height:250px;\"></center>";
                    ans+="</div>";
                //ans+="</div>";
           ans+="</div>";
           ans+="</div>";
           ans+="<br>";
              ans+="<div class=\"container\">";
          
                 for(var i=0;i<arr4.length;i++)
                 {   
                     var singleobj=arr4[i];
                     
                    // ans+="<div class=\"row\">";
                     ans+="<div class=\"col-sm-12 col-lg-6 col-md-12\">";
                     ans=ans+"<table class=\"table table-hover\">";
                     ans=ans+"<tr>";
                         ans = ans+"<td width=\"20%\"><img src=\""+ singleobj["photo"] +"\" width='110' height='100' /></td>";
                       
                        ans=ans+"<td width=\"60%\"><h4>"+singleobj["item_name"]+"</h4> <br> <h5>"+singleobj["description"]+"</h5></td>";
                         ans+="<td width=\"10%\">"+singleobj["price"]+"</td>";
                        //  ans = ans+"<td>"+"<img src=\""+ singleobj["photo_cover"] +"\" width='100' height='100' />"+"</td>";
                        //   ans = ans+"<td>"+"<img src=\""+ singleobj["photo_profile"] +"\" width='100' height='100' />"+"</td>";
                          ans=ans+"<td width=\"10%\">"+"<input type=\"button\" value=\"ADD\" class=\"btn-outline-primary2\" onclick=\"updateCart("+singleobj["food_item_id"]+")\"/>"+"</td>";
                        ans=ans+"</tr>";
                        ans=ans+"</table>";

                     ans+="</div>";
                
                  }  
                  ans+="</div>";
                  document.getElementById("categories2").innerHTML=ans;
                  }
                };

                xhr.open("GET", "./Food_Item_Info?name="+name+"&rid="+id, true);

               // alert("Sending Request to Server");

                // ALso send FORM-Data with AJAX REQUEST
                xhr.send();
            }
            
             function restaurantDetails()
             {
                       var singleobj=arr[0];
                       
                        document.getElementById("restaurant-name").innerHTML=singleobj["restaurant_name"];
                        document.getElementById("restaurant-image").src=singleobj["photo_wide"];
                        getCategoryButtons();
                     
             }        
                

            function getCategoryButtons()
            {
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                 if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                       // alert(r);
                        var mainobj = JSON.parse(r);
                      //  alert("mainobj="+mainobj);
                        var ans="";
                          arr1 = mainobj.ans;
                         // alert("arr1="+arr1);
                         ans+="<div class=\"container\">";
                         ans+="<div class=\"row\">";
                         
                           // ans+="<div class=\"col-sm-5\">";

                      //  ans+="<div class=\"form-group\">";
                            ans+="<input type=\"button\" value=\"All\" style=\"font-family: \'Delius Swash Caps\', cursive;\" class=\"btn-outline-primary1 btn-lg col-sm-2 \" onclick=\"getFoodItems(\'All\')\" />";
                      // ans+="</div>";
               
               // ans+="</div>";
                         for(var i=0;i<arr1.length;i++)
                         {
                             var obj=arr1[i];
                          
              
            //    ans+="<div class=\"col-sm-5\">";

                      //  ans+="<div class=\"form-group\">";
                            ans+="<input type=\"button\" value=\""+obj["category_name"]+"\" class=\"btn-outline-primary1 btn-lg col-sm-2 \" style=\"font-family: \'Delius Swash Caps\', cursive;\" onclick=\"getFoodItems('"+obj["category_name"]+"','"+obj["photo_cover"]+"')\" />";                     
                      // ans+="</div>";
               
            //    ans+="</div>";

             

       
                         }
                           ans+="</div>";
                  ans+="</div>";
                       document.getElementById("categories").innerHTML=ans;   
                          
                    }
                };

                xhr.open("GET", "./Food_Category_Info?rid="+id, true);

             // alert("Sending Request to  Server");

                // ALso send FORM-Data with AJAX REQUEST
                xhr.send();
            }
            
            function updateCart(index)
            {
                 var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        //alert(r);
                       // alert(r);
                        
                       
                      
                    }
                };

                xhr.open("GET", "./Update_Cart?iid="+index, true);

               
                xhr.send();
            }
            
        </script>   

    </head>
    <body onload="showRestaurantDetail()">
         <jsp:include page="Public_Header2.jsp" />
         <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Restaurant Details</h1>
                 <!--   <a href="#"></a>
                    <a class="active" href="table.html"></a>-->
                </div>
            </div>
        </section>
        <br>
       
           <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <div class="jumbotron"> 
                        <div style="font-family: 'Bungee Shade', cursive;"> <center> <h1 class="h1" id="restaurant-name"></h1></center></div>
                    </div>
                </div>
            </div>
           </div>    
        
        
       
           <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    
                        <center> <img src="" class="h1" style="width:90%; height:250px;" id="restaurant-image"></img></center>
                    
                </div>
            </div>
           </div>
        <br>
        
        <div id="categories" class="row"></div>
       
        <br>
       
        <br>
        
         <div class="row" id="categories2"></div>
    

        <jsp:include page="Public_Footer.jsp" />

        <script src="js/jquery-2.1.4.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Rev slider js -->
        <script src="vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <!-- Extra plugin js -->
        <script src="vendors/bootstrap-selector/bootstrap-select.js"></script>
        <script src="vendors/bootatrap-date-time/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="vendors/countdown/jquery.countdown.js"></script>
        <script src="vendors/js-calender/zabuto_calendar.min.js"></script>
        <!--gmaps Js-->
        <!--        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>-->
        <!--        <script src="js/gmaps.min.js"></script>-->


        <!--        <script src="js/video_player.js"></script>-->
        <script src="js/theme.js"></script>



    </body>
</html>