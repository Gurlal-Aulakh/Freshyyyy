
<!DOCTYPE html>
<html lang="en">
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
            
            function contact()
            {
                var name=document.getElementById("name").value;
                var last=document.getElementById("last").value;
                var email=document.getElementById("email12").value;
                var subject=document.getElementById("subject").value;
                var message=document.getElementById("message").value;
                if(name!="" && last!="" && email!="" && message!="")
                {
                     var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {

                        var r = xhttp.responseText.trim();
                        alert(r);
                        
                      
                    }
                };
              xhttp.open("GET","./Contact_Servlet?name="+name+"&last="+last+"&email="+email+"&subject="+subject+"&message="+message,true);

                // Step 2
                // true --> async request

                // Step 3
                xhttp.send(); 
                }
            }
            
        </script>
    </head>
    <body>
       
     <jsp:include page="Public_Header2.jsp" />
        <!--================End Footer Area =================-->
        
        <!--================Banner Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Contact Us</h1>
                    
                    
                </div>
            </div>
        </section>
        <!--================End Banner Area =================-->
         <section class="contact_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="contact_details">
                            <h3 class="contact_title">Contact Info</h3>
                         <!--   <p>There are many variations of passages of Lorem Ipsum available, but the majori have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a pas of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>-->
                            <div class="media">
                                <div class="media-left">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <div class="media-body">
                                    <h4>Address</h4>
                                    <h5>Kabir Park,NH1, Amritsar, Punjab</h5>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-left">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="media-body">
                                    <h4>Phone</h4>
                                    <h5>+919592082235</h5>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-left">
                                    <i class="fa fa-envelope-o"></i>
                                </div>
                                <div class="media-body">
                                    <h4>Email</h4>
                                    <h5>freshyfood@gmail.com</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row contact_form_area">
                            <h3 class="contact_title">Send Message</h3>
                            <form action="contact_process.php" method="post" id="contactForm">
                                <div class="form-group col-md-12">
                                  <input type="text" class="form-control" id="name" name="name" placeholder="First Name*">
                                </div>
                                <div class="form-group col-md-12">
                                  <input type="text" class="form-control" id="last" name="last" placeholder="Last Name*">
                                </div>
                               
                                <div class="form-group col-md-12">
                                  <input type="email" class="form-control" id="email12" name="email" placeholder="Your Email*">
                                </div>
                                 <div class="form-group col-md-12">
                                  <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject">
                                </div>
                                <div class="form-group col-md-12">
                                  <textarea class="form-control" id="message" name="message" placeholder="Write Message"></textarea>
                                </div>
                                <div class="form-group col-md-12">
                                    <button class="btn btn-default submit_btn" type="button" onclick="contact()">Send Message</button>
                                 </div>
                            </form>
                            <div id="success">
                                <p>Your text message sent successfully!</p>
                            </div>
                            <div id="error">
                                <p>Sorry! Message not sent. Something went wrong!!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--================End Recent Blog Area =================-->
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