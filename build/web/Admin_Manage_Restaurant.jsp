<%-- 
    Document   : Admin_Manage_Restaurant
    Created on : 30 Apr, 2020, 3:16:34 PM
    Author     : HP
--%>

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

        <script>
            var arr;
           function restaurantList()
           {
              
               var city=document.getElementById("city").value;
               if(city=="All")
                   restaurantListAll();
               else
                   restaurantListCity();
           }
          
           function restaurantListAll()
           {
                // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            
                            var mainobj=JSON.parse(r);
                             arr=mainobj.ans;
                             var ans="";
                            ans=ans+"<table class=\"table table-striped table-bordered\">";
                             ans=ans+"<thead class=\"bg-dark text-white\">";
                             ans=ans+"<tr>";
                                ans=ans+"<th>Serial No.</th>";
                               ans=ans+"<th> Name </th>";
                                ans=ans+"<th> Photo </th>";
                                ans=ans+"<th> city </th>";
                                ans=ans+"<th> Mobile No. </th>";
                                ans=ans+"<th> Min. Order </th>";
                                ans=ans+"<th> Status </th>";
                                ans=ans+"<th> Approve </th>";
                                ans=ans+"<th> Block </th>";
                           ans=ans+"</tr>";
                      ans=ans+"</thead>";
                        
                       ans=ans+"<tbody>";
                    for(var i=0,j=1;i<arr.length;i++,j++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        ans=ans+"<td>"+j+"</td>";
                        ans=ans+"<td>"+singleobj["restaurant_name"]+"</td>";
                          ans = ans+"<td>"+"<img src=\""+ singleobj["photo_square"] +"\" width='100' height='100' />"+"</td>";
                          ans=ans+"<td>"+singleobj["city"]+"</td>";
                          ans=ans+"<td>"+singleobj["mobileno"]+"</td>";
                          ans=ans+"<td>"+singleobj["min_order_delivery"]+"</td>";
                          ans=ans+"<td>"+singleobj["status"]+"</td>";
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Approve\" class=\"btn-success\" onclick=\"approveRestaurant("+singleobj["restaurant_id"]+")\"/>"+"</td>"; 
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" class=\"btn-danger\" onclick=\"blockRestaurant("+singleobj["restaurant_id"]+")\"/>"+"</td>";
                        ans=ans+"</tr>";
                    }
                    ans=ans+"</tbody>";
                    ans=ans+"</table>";
                    document.getElementById("l1").innerHTML=ans;
                    }
                    };
                    
                    xhr.open("GET", "./Admin_Restaurant_List_All_Servlet", true);
                    
                  //  alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
           }
           
           function restaurantListCity()
           {
               var city=document.getElementById("city").value;
                // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            
                            var mainobj=JSON.parse(r);
                            arr=mainobj.ans;
                             var ans="";
                            ans=ans+"<table class=\"table table-striped table-bordered\">";
                             ans=ans+"<thead class=\"bg-dark text-white\">";
                             ans=ans+"<tr>";
                                ans=ans+"<th>"+"Id"+"</th>";
                               ans=ans+"<th> Name </th>";
                                ans=ans+"<th> Photo </th>";
                                ans=ans+"<th> city </th>";
                                ans=ans+"<th> Mobile No. </th>";
                                ans=ans+"<th> Min. Order </th>";
                                ans=ans+"<th> Status </th>";
                                ans=ans+"<th> Approve </th>";
                                ans=ans+"<th> Block </th>";
                           ans=ans+"</tr>";
                      ans=ans+"</thead>";
                        
                       ans=ans+"<tbody>";
                    for(var i=0,j=1;i<arr.length;i++,j++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        ans=ans+"<td>"+j+"</td>";
                        ans=ans+"<td>"+singleobj["restaurant_name"]+"</td>";
                          ans = ans+"<td>"+"<img src=\""+ singleobj["photo_square"] +"\" width=100 height=100 />"+"</td>";
                          ans=ans+"<td>"+singleobj["city"]+"</td>";
                          ans=ans+"<td>"+singleobj["mobileno"]+"</td>";
                          ans=ans+"<td>"+singleobj["min_order_delivery"]+"</td>";
                          ans=ans+"<td>"+singleobj["status"]+"</td>";
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Approve\" class=\"btn-success\" onclick=\"approveRestaurant("+singleobj["restaurant_id"]+")\"/>"+"</td>"; 
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" class=\"btn-danger\" onclick=\"blockRestaurant("+singleobj["restaurant_id"]+")\"/>"+"</td>";
                        ans=ans+"</tr>";
                    }
                    ans=ans+"</tbody>";
                    ans=ans+"</table>";
                    document.getElementById("l1").innerHTML=ans;
                    }
                    };
                    
                    xhr.open("GET", "./Admin_Restaurant_List_City_Servlet?city="+city, true);
                    
                   // alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
           }
          
          function approveRestaurant(index)
          {
               // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            alert(r);
                              if(r=="fail")
                        {
                            alert("Status not Updated");
                        }
                          
                        else if(r=="success")
                        {
                            alert("Status Updated");
                            restaurantList();
                        }
                    }
                    };
                    
                    xhr.open("GET", "./Admin_Restaurant_Approve_Servlet?index="+index+"&status=approved", true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                }
                
                function blockRestaurant(index)
          {
               // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            alert(r);
                              if(r=="fail")
                        {
                            alert("Status not Updated");
                        }
                          
                        else if(r=="success")
                        {
                            alert("Status Updated");
                            restaurantList();
                        }
                    }
                    };
                    
                    xhr.open("GET", "./Admin_Restaurant_Approve_Servlet?index="+index+"&status=blocked", true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                }
          
          
          
          
          
        </script>   

    </head>
    <body onload="restaurantListAll()">
        <jsp:include page="Admin_Home_Page_Header.jsp" />
        <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Manage Restaurant</h1>
                 <!--   <a href="#"></a>
                    <a class="active" href="table.html"></a>-->
                </div>
            </div>
        </section>
        
        <div class="container">
            
            
            
           
            
            <div class="row">
                <div class="col-sm-12">
                
                    
                    <form>
                        
                          <div class="form-group form-row">
                            <label for="city" class="col-sm-3">City</label>
                            <select  name="city" id="city" onchange="" class="col-sm-9">
                                <option>All</option>                               
                                <option>Amritsar</option>
                                <option>TarnTaran</option>
                                <option>Jalandhar</option>
                                <option>Ludhiana</option>
                           </select>
                            </div>
                            </form>
                            
                        </div>
                </div>
            </div>
        <br>
               
                        <div class="form-group form-row">
                        <input type="button" value="View" class="btn-outline-primary btn-lg col-sm-2 col-sm-offset-5" onclick="restaurantList()" />
                        </div>
        
 
        <br>
        <hr>
        <br>
         <div class="container">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="jumbotron"> 
                        <center> <h1 style="font-family: 'Bungee Shade', cursive;">Restaurant List</h1></center>>
                    </div>
                </div>
            </div>
                  <div class="row">
                
                <div class="col-sm-12">
                    <div id="l1">
                 
                </div>
                 <div id="error1" style="color:red"><label id="l2" class="offset-3"></label></div>
            
              </div>
                      
                  </diV>
         </div>
                        
       
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

