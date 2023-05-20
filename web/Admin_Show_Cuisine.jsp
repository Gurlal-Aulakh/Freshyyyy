<%-- 
    Document   : Admin_Show_Cuisine
    Created on : 27 Apr, 2020, 10:18:50 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>ADMIN CHANGE PASSWORD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
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
        function showCuisine()
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
                    ans=ans+"<table class=\"table table-bordered\">";
                    for(var i=0;i<arr.length;i++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        ans=ans+"<td>"+singleobj["cuisine_id"]+"</td>";
                        ans=ans+"<td>"+singleobj["cuisine_name"]+"</td>";
                          ans=ans+"<td>"+singleobj["description"]+"</td>";
                          ans = ans+"<td>"+"<img src=\""+ singleobj["photo"] +"\" width=100 height=100 />"+"</td>";
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Edit\" />"+"</td>"; 
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" />"+"</td>";
                        ans=ans+"</tr>";
                    }
                    ans=ans+"</table>";
                    document.getElementById("d1").innerHTML=ans;
                       
                       
                    }
                };
                xhttp.open("GET","./Show_Cuisine_Servlet",true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
              
             }
         
        </script>   

    </head>
    <body onload="showCuisine()">
         <jsp:include page="Admin_Home_Page_Header.jsp" />
         <br>
         <br>
        
        <div class="container">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="jumbotron"> 
                        <center> <h1 class="h1"> Cuisine List</h1></center>
                    </div>
                </div>
            </div>
           
             <div class="row">
                
                <div class="col-sm-12">
                    <div id="d1">
                        
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
