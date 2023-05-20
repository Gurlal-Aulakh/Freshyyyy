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
        <script>
           

            function fetchOrders()
            {
                // Send AJAX Request to send FORMDATA (text + files) to Server
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                       // alert(r);
                        var mainobj = JSON.parse(r);
                        var arr = mainobj.ans;
                        var ans = "";
                        ans = ans + "<table class=\"table table-striped table-bordered\">";
                        ans = ans + "<thead class=\"bg-dark text-white\">";
                        ans = ans + "<tr>";

                        ans = ans + "<th>Order Id</th>";
                        ans = ans + "<th> Date</th>";
                        ans = ans + "<th> Time </th>";
                        ans = ans + "<th> Amount </th>";
                        ans = ans + "<th> Payment Mode </th>";
                        ans = ans + "<th> Restaurant </th>";
                        ans = ans + "<th> Details </th>";
                        ans = ans + "<th> Cancel Order  </th>";

                        ans = ans + "</tr>";
                        ans = ans + "</thead>";

                        ans = ans + "<tbody>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var singleobj = arr[i];
                            ans = ans + "<tr onclick=\"showRestaurantDetail("+singleobj["restaurant_id"]+")\">";
                            
                            ans = ans + "<td>" + singleobj["bill_id"] + "</td>";
                           /// ans = ans + "<td>" + "<img src=\"" + singleobj["p"] + "\" width='100' height='100' />" + "</td>";
                            ans = ans + "<td>" + singleobj["date"] + "</td>";
                            ans = ans + "<td>" + singleobj["time"] + "</td>";
                            ans = ans + "<td>" + singleobj["subtotal"] + "</td>";
                            ans = ans + "<td>" + singleobj["paymode"] + "</td>";
                            var rid=parseInt(singleobj["restaurant_id"]);
                            
                            
                             ans=ans+"<td>"+singleobj["restaurant_name"]+"</td>";
                             ans=ans+"<td>"+"<input type=\"button\" value=\"View Details\" class=\"btn-primary\" onclick=\"viewDetails("+singleobj["bill_id"]+")\"/>"+"</td>"; 
                             ans=ans+"<td>"+"<input type=\"button\" value=\"Cancel\" class=\"btn-danger\" onclick=\"cancel("+singleobj["bill_id"]+")\"/>"+"</td>";
                            ans = ans + "</tr>";
                        }
                        ans = ans + "</tbody>";
                        ans = ans + "</table>";
                        document.getElementById("d17").innerHTML = ans;

                    }
                };

                xhr.open("GET", "./Customer_Fetch_Orders", true);

                //  alert("Sending Request to Server");

                //console.log(formdata);

                // ALso send FORM-Data with AJAX REQUEST
                xhr.send();
            }

          
 function cancel(bid)
           {
              var w= confirm("Are you sure you want to Cancel this Order?");
               // Send AJAX Request to send FORMDATA (text + files) to Server
                    if(w==true)
                    {
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                           // alert(r);
                         
                         if(r=="success")
                        {
                            fetchOrders();
                        }
                    }
                    };
                    
                    
                    xhr.open("GET", "./Restaurant_Cancel_Order?bid2="+bid, true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                }
           }
            
            function viewDetails(bid)
            {
                var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                           // alert(r);
                             var mainobj=JSON.parse(r);
                             arr=mainobj.ans;
                             var ans="";
                            ans=ans+"<table class=\"table table-hover\">";
                             ans=ans+"<thead class=\"bg-dark text-white\">";
                             ans=ans+"<tr>";
                                ans=ans+"<th>Name</th>";
                               ans=ans+"<th> Price </th>";
                                ans=ans+"<th> Quantity </th>";
                                ans=ans+"<th> Amount</th>";
                              //  ans=ans+"<th> Cancel Order </th>";  
                              //  ans=ans+"<th> Confirm Order </th>";
                           ans=ans+"</tr>";
                      ans=ans+"</thead>";
                        
                       ans=ans+"<tbody>";
                    for(var i=0,j=1;i<arr.length;i++,j++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        ans=ans+"<td>"+singleobj["name"]+"</td>";
                        ans=ans+"<td>"+singleobj["price"]+"</td>";
                         ans=ans+"<td>"+singleobj["quantity"]+"</td>";
                         ans=ans+"<td>"+singleobj["amount"]+"</td>";
                        
                ans=ans+"</tr>";
                    }
                    ans=ans+"</tbody>";
                    ans=ans+"</table>";
                    document.getElementById("d21").innerHTML=ans;
                    $('#myModal21').modal('show');
                    
                    
                            
                       
                    }
                    };
                    
                    
                    xhr.open("GET", "./View_Details?bid="+bid, true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                
            }
          
           

        </script>   

    </head>
    <body onload="fetchOrders()">
         <jsp:include page="Customer_Header.jsp" />
         <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Orders</h1>
                 <!--   <a href="#"></a>
                    <a class="active" href="table.html"></a>-->
                </div>
            </div>
        </section>
         <br>
         <br>
      <div class="container">
                <div class="row">

                <div class="col-sm-12">
                   
                    <div id="d17"></div>

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

 <div id="myModal21" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Order Details</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                
                

               
                   
                    <div id="d21"></div>

             

           
                              
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>