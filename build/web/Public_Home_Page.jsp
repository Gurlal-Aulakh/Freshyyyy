<%-- 
    Document   : Public_Home_Page
    Created on : 7 May, 2020, 3:34:07 PM
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
        
     <!--  <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
          <script src="js/jquery-3.5.0.min.js" type="text/javascript"></script>
          <script src="js/bootstrap.js" type="text/javascript"></script>-->
          
  
        <title>Page</title>
        
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
     
    </head>
    <body>
       <%--<jsp:include page="Public_Header2.jsp" />--%>
       <script>
    function customerLogin()
    {
                   var email3=document.getElementById("email3").value;
                   var pass3=document.getElementById("pass3").value;
                    // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            alert("result="+r);
                             if(r=="fail")
                        {
                             alert("Password Incorrect");
                        }
                        else if(r=="success")
                        {
                            alert("Login succesful");
                            setInterval("3000");
                            document.getElementById("form3").reset;
                            window.location.href="Customer_Home_Page.jsp"
                            
                        }
                        else if(r=="pending")
                        {
                            confirmOtp();
                        }
                       
                    }
                    };
                    
                    xhr.open("GET", "./Customer_Login_Servlet?email3="+email3+"&pass3="+pass3, true);
                    
                   // alert("Sending Request to Server");
                   
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                }
                
                 function confirmOtp()
            {
                 $('#myModal1').modal('show');       
            }
          
            
            function resendOtp()
            {
                
                 var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                           document.getElementById("error1").style.color="green";
                           document.getElementById("l2").innerHTML="OTP Resent";
                      
                        }
                    };
                    
                    xhr.open("GET", "./Resend_Sms_Servlet", true);
                    
                    alert("Sending Request to Server");
                  //  alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
             
            }
            
            function confirmCustomer()
            {
               var otp1= document.getElementById("otp1").value;
                 var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            alert("result="+r);
                             if(r=="fail")
                        {
                             alert("Some Error Occured, Please Try again");
                        }
                        else if(r=="success")
                        {
                               document.getElementById("error").style.color="green";
                               document.getElementById("l1").innerHTML="Signup Succesful";
                               $('#myModal1').modal('hide');
                        }
                    }
                    };
                    
                    xhr.open("GET", "./Confirm_Customer_Servlet?otp="+otp1, true);
                    
                    alert("Sending Request to Server");
                 
                    xhr.send();
            }
            
            function checkRestaurant()
        {
            
            var flagempty=false;
            var flagemail=false;
            var e=document.getElementById("remail").value;
            var p=document.getElementById("rpassword").value;
            if(e=="" || p=="" || e==null || p==null)
            {
                 document.getElementById("d1").style.color="red";
                document.getElementById("l1").innerHTML="All Fields are Mandatory";
            }
            
            else
                flagempty=true;
            
            var flagspecial=false;
            var flagdot=false;
            for(var i=0;i<e.length;i++)
            {
                if(e.charAt(i)=='@')
                flagspecial=true;
               if(e.charAt(i)=='.')
                   flagdot=true;
               if(flagspecial==true &&  flagdot==true)
                   flagemail=true;
            }
            
            if(flagempty==true && flagemail==true)
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
                       
                        //document.getElementById("l2").innerHTML=r;
                        if(r=="success")
                        {
                            document.getElementById("d1").style.color="green";
                            document.getElementById("l1").innerHTML="Login succesful";
                            window.location.href="Restaurant_Home_Page.jsp";
                        }
                        
                         else if(r=="Password Incorrect")
                        {
                            document.getElementById("d1").style.color="red";
                            document.getElementById("l1").innerHTML="Password Incorrect";
                        }
                         else if(r=="This email does not Exist")
                        {
                            document.getElementById("d1").style.color="red";
                            document.getElementById("l1").innerHTML="This Email does not Exist";
                        }
                    }
                };
                xhttp.open("GET","./Restaurant_Login_Servlet?e="+e+"&p="+p,true);
               
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
              
             }
        }
       var otps;
       var mobiles;
        function restaurantForgotPassword()
        {
            var email=document.getElementById("email7").value;
             var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                           var r=xhr.responseText.trim(); 
                          if(r=="")
                          {
                              document.getElementById("d7").style.color="red";
                              document.getElementById("l7").innerHTML="Wrong Email!!!";
                          }
                          else
                          {
                              var parts=r.split(","); 
                              otps=parts[0];
                              mobiles=parts[1];
                             // alert("OTP="+otps+"mobile"+mobiles);
                              document.getElementById("d7").style.color="green";
                              document.getElementById("l7").innerHTML="OTP is sent to your mobile Number";
                              document.getElementById("d7b").style.display="block";
                              document.getElementById("d7c").style.display="block";
                           
                          }
                   
                        }
                    };
                    
                    xhr.open("GET", "./Restaurant_Forget_Passsword_Servlet?email="+email, true);
                    
                  //  alert("Sending Request to Server");
                  //  alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
        }
        
        function restaurantCheckOTP()
        {
            var otp7=document.getElementById("otp7").value;
            if(otp7==otps)
            {
                var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                           var r=xhr.responseText.trim(); 
                          if(r=="fail")
                          {
                              document.getElementById("d7a").style.color="red";
                              document.getElementById("l7a").innerHTML="Some Error Occured Please Try Again Later!!!";
                          }
                          else if(r=="success")
                          {
                              document.getElementById("d7a").style.color="green";
                              document.getElementById("l7a").innerHTML="Password is sent to your Mobile Number "+mobiles;
                          }
                   
                        }
                    };
                    
                    xhr.open("GET", "./Restaurant_Send_Passsword_Servlet?mobiles="+mobiles, true);
                    
                  //  alert("Sending Request to Server");
                  //  alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
            }
            else
            {
                document.getElementById("d7a").style.color="red";
               document.getElementById("l7a").innerHTML="OTP is Wrong!!!";
            }
        }
        
        function CustomerForgotPassword()
        {
            var mobile=document.getElementById("mob8").value;
            var question=document.getElementById("question8").value;
            var answer=document.getElementById("answer8").value;
             var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                           var r=xhr.responseText.trim();
                           alert(r);
                            if(r=="fail")
                          {
                              document.getElementById("d8").style.color="red";
                              document.getElementById("l8").innerHTML="Some Error Occured Please Try Again Later!!!";
                          }
                          else if(r=="success")
                          {
                              document.getElementById("d8").style.color="green";
                              document.getElementById("l8").innerHTML="Password is sent to your Mobile Number";
                          }
                   
                        }
                    };
                    
                    xhr.open("GET", "./Customer_Forget_Passsword_Servlet?mobile="+mobile+"&question="+question+"&answer="+answer, true);
                    
                    alert("Sending Request to Server");
                  //  alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
        }
   
</script> 


<header class="main_menu_area">
            <nav class="navbar navbar-default">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><img src="img/logo-1.png" alt=""></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#">Home</a></li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Customer<i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#myModal3" data-toggle="modal">Login</a></li>
                                    <li><a class="dropdown-item" href="Customer_Signup.jsp">Sign Up</a></li>
                                </ul>
                            </li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Restaurant<i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#myModal6" data-toggle="modal">Login</a></li>
                                    <li><a class="dropdown-item" href="Restaurant_Signup.jsp">Sign Up</a></li>
                                </ul>
                            </li>
                         
                            <li><a href="gallery.html">Gallery</a></li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="event.html">Event</a></li>
                                    <li><a href="table.html">Table</a></li>
                                </ul>
                            </li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">News <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-gallery.html">Blog Gallery</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact US</a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>



<div id="myModal3" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Customer Login</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                          <div class="col-sm-12">
                
                    
                    <form id="form3" >
                        
                         <div class="form-group form-row">
                            <label for="email3" class="col-sm-3">Email Id</label>
                            <input type="text" name="email3" id="email3" class="form-control col-sm-9"/>
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="pass3" class="col-sm-3">Password</label>
                            <input type="password" name="pass3" id="pass3" class="form-control col-sm-9"/>
                        </div>
                        
                    </form>
                    
                    <div class="form-group form-row">
                            <input type="button" value="Login" class="btn-primary btn-lg col-sm-9 offset-3" onclick="customerLogin()" />
                        </div>
                  
                    <div id="d3" style="color:red"><label id="l3" class="offset-3"></label></div>
                    
             <div class="row">
                <div class="col-sm-12">
                    <div id="d6a"  class="offset-3"><a href="#myModal8" data-toggle="modal" >Forgot Password</a></div>
                            
                    <div id="d6b" class="offset-3"><a href="Customer_Signup.jsp">Don't have an Account</a></div>
               
               </div> 
            </div>
                
                </div>
            </div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>


    <div id="myModal1" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Verify Mobile Number</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form1">
                        
                         <div class="form-group form-row">
                            <label for="otp1" class="col-sm-3">Enter OTP </label>
                            <input type="text" name="otp1" id="otp1" class="form-control col-sm-9"/>
                        </div>
                        
                    </form>
                    
                    <div class="form-group form-row">
                            <input type="button" value="Resend" class="btn-warning btn-lg col-sm-9 offset-3" onclick="resendOtp()" />
                        </div>
                    
                    
                      <div class="form-group form-row">
                            <input type="button" value="Verify" class="btn-primary btn-lg col-sm-9 offset-3" onclick="confirmCustomer()" />
                     </div>
                    
                    <div id="error1" style="color:red"><label id="l2" class="offset-3"></label></div>
                
                </div>
            </div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>

                       

                     <div id="myModal6" class="modal fade" role="dialog">
                        <div class="modal-dialog">


                        <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Restaurant Login</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form6">
                        
                        <div class="form-group form-row">
                            <label for="remail" class="col-sm-3">Email</label>
                            <input type="remail" name="remail" id="remail" class="form-control col-sm-9" />
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rpassword" class="col-sm-3">Password</label>
                            <input type="password" name="rpassword" id="rpassword" class="form-control col-sm-9" /> 
                        </div>
                       
                        
                    </form>
                    
                      <div class="form-group form-row">
                            <input type="button" value="Login" class="btn-primary btn-lg col-sm-9 offset-3" onclick="checkRestaurant()" />
                        </div>
                   
                    
                    <div id="d6" style="color:red"><label id="l6" class="offset-3"></label></div>
                    
                      <div class="row">
                <div class="col-sm-12">
                    <div id="d6a"  class="offset-3"><a href="#myModal7" data-toggle="modal" >Forgot Password</a></div>
                            
                    <div id="d6b" class="offset-3"><a href="Restaurant_Signup.jsp">Don't have an Account</a></div>
               
            </div>
                
            </div>
                
                </div>
            </div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>



<div id="myModal7" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Forgot Password</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form7" >
                        
                         <div class="form-group ">
                            <label for="email7" class="col-sm-3">Enter Email</label>
                            <input type="text" name="email7" id="email7" class="form-control col-sm-12"/>
                        </div>
                     
                    </form>
                    
                    <div class="form-group ">
                            <input type="button" value="Submit" class="btn-primary btn-lg col-sm-12 " onclick="restaurantForgotPassword()" />
                        </div>
                  
                    <div id="d7" style="color:red"><label id="l7" ></label></div>
                    
                    <form id="form7a" >
                        
                         <div class="form-group " id="d7b" style="display: none;">
                            <label for="otp7" class="col-sm-3">Enter OTP</label>
                            <input type="text" name="otp7" id="otp7" class="form-control col-sm-12"/>
                            
                        </div>
                     
                    </form>
                    
                     <div class="form-group " id="d7c" style="display: none;">
                            <input type="button" value="Submit" class="btn-primary btn-lg col-sm-12 " onclick="restaurantCheckOTP()" />
                            </div>
                   
                    <div id="d7a" style="color:red"><label id="l7a" ></label></div>
                
                </div>
            </div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>


<div id="myModal8" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Forgot Password</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form8" >
                        
                         <div class="form-group form-row">
                            <label for="mob8" class="col-sm-3">Mobile No.</label>
                            <input type="text" name="mob8" id="mob8" class="form-control col-sm-9"/>
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="question8" class="col-sm-3">security Question</label>
                            <select  name="question8" id="question8" onchange="" class="form-control col-sm-9">
                                <option>What is the Name of your First Pet?</option>
                                <option>What is the name of your hometown?</option>
                                <option>What is your Nickname at Home? </option>
                                <option>What is the name of your Favourite Movie?</option>
                            </select> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="answer8" class="col-sm-3">Security Answer</label>
                            <input type="text" name="answer8" id="answer8" class="form-control col-sm-9"/>
                        </div>
                     
                    </form>
                    
                    <div class="form-group ">
                            <input type="button" value="Submit" class="btn-primary btn-lg col-sm-9 offset-3 " onclick="CustomerForgotPassword()" />
                     </div>
                  
                    <div id="d8" style="color:red"><label id="l8" ></label></div>
                
                </div>
            </div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>

  

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
   
              <jsp:include page="Public_Footer.jsp" />
    </body>
</html>

