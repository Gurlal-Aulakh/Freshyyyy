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
        function message()
        {
         
                var xhttp = new XMLHttpRequest();
               
               // Step 4 
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                        var mainobj=JSON.parse(r);
                        var arr=mainobj.ans;
                        var ans="";
                    ans=ans+"<table class=\"table table-hover table-bordered\">"; 
                                ans=ans+"<thead class=\"bg-dark text-white\">";
                                ans=ans+"<tr>";
                                ans=ans+"<th>Serial No.</th>";
                                ans=ans+"<th>First Name </th>";
                                ans=ans+"<th>Last Name </th>";
                                ans=ans+"<th>Email Id</th>";
                                ans=ans+"<th> subject </th>";  
                                ans=ans+"<th> Message </th>";
                           ans=ans+"</tr>";
                      ans=ans+"</thead>";
                        
                       ans=ans+"<tbody>";
                    for(var i=0,j=1;i<arr.length;i++,j++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        ans=ans+"<td>"+j+"</td>";
                        ans=ans+"<td>"+singleobj["firstname"]+"</td>";
                        ans=ans+"<td>"+singleobj["lastname"]+"</td>";
                          ans=ans+"<td>"+singleobj["email"]+"</td>";
                          ans=ans+"<td>"+singleobj["subject"]+"</td>";
                          ans=ans+"<td>"+singleobj["message"]+"</td>";
                       //   ans = ans+"<td>"+"<img src=\""+ singleobj["photo"] +"\" width=100 height=100 />"+"</td>";
                       //   ans=ans+"<td>"+"<input type=\"button\" value=\"Edit\" />"+"</td>"; 
                       //   ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" />"+"</td>";
                        ans=ans+"</tr>";
                    }
                    ans+="</tbody>";
                    ans=ans+"</table>";
                    document.getElementById("msg").innerHTML=ans;
                       
                       
                    }
                };
                xhttp.open("GET","./Message_Servlet",true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
              
             }
         
        </script>   

    </head>
    <body onload="message()">
         <jsp:include page="Admin_Home_Page_Header.jsp" />
         <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Messages</h1>
                    
                    
                </div>
            </div>
        </section>
         <br>
         <br>
        
        <div class="container">
             <div class="row">
                
                <div class="col-sm-12">
                    <div id="msg">
                        
                    </div>
            
            </div>
             </div>
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
