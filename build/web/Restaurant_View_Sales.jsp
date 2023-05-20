<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
       <!-- <title>ADMIN CHANGE PASSWORD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>-->
       
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
            
       
            function viewSales()
            {
                var xhr = new XMLHttpRequest;
                    var sdate=document.getElementById("date").value;
                    var edate=document.getElementById("date1").value;
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                             //alert(r);
                             var mainobj=JSON.parse(r);
                             var arr=mainobj.ans;
                             var ans="";
                            ans=ans+"<table class=\"table table-hover table-bordered\">";
                             ans=ans+"<thead class=\"bg-dark text-white\">";
                             ans=ans+"<tr>";
                                ans=ans+"<th>Date</th>";
                             //  ans=ans+"<th> Price </th>";
                             //   ans=ans+"<th> Quantity </th>";
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
                        ans=ans+"<td>"+singleobj["date"]+"</td>";
                        ans=ans+"<td>"+singleobj["amount"]+"</td>";
                      //   ans=ans+"<td>"+singleobj["quantity"]+"</td>";
                      //   ans=ans+"<td>"+singleobj["amount"]+"</td>";
                        
                ans=ans+"</tr>";
                    }
                    ans=ans+"</tbody>";
                    ans=ans+"</table>";
                    document.getElementById("d26").innerHTML=ans;
                   // $('#myModal21').modal('show');
                   
                    }
                    };
                    
                    
                    xhr.open("GET", "./View_Sales?sdate="+sdate+"&edate="+edate, true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                
            }
            
     
           
          </script>       

    </head>
    <body>
        <jsp:include page="Restaurant_Home_Page_Header.jsp" />
         <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h4 style="font-family: 'Barrio', cursive;">View sales</h4>
                 <!--   <a href="#"></a>
                    <a class="active" href="table.html"></a>-->
                </div>
            </div>
        </section>
         <br>
         <br>
         <div class="container">
         <div class="row">
            
               
                     
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          Start Date&nbsp; <input type="date" id="date"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           End Date&nbsp;   <input type="date" id="date1"/>
                    
             </div> 
             </div>
         <br>
         <br>
           <div class="row">  
    <center>  
                         <input type="button" value="View" id="view" class="btn-lg btn-outline-primary col-sm-2 col-sm-offset-5" onclick="viewSales()"/>
    </center>           
                   
             </div>
     
         <br>
         <br>
             
        
                <div class="container">
                <div class="row">

                <div class="col-sm-12">
                   
                    <div id="d26"></div>

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
