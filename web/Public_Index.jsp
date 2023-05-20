<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="img/express-favicon.png" type="image/x-icon" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Freshy</title>

        <!-- Icon css link -->
        <link href="vendors/material-icon/css/materialdesignicons.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="vendors/linears-icon/style.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
          <style>
            @import url('https://fonts.googleapis.com/css2?family=Barrio&family=Bungee+Shade&family=Ceviche+One&family=Delius+Swash+Caps&family=Monofett&family=Roboto&display=swap');
            
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

        <script>
            function customerLogin()
            {
                var email3 = document.getElementById("email3").value;
                var pass3 = document.getElementById("pass3").value;
                // Send AJAX Request to send FORMDATA (text + files) to Server
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        //alert("result="+r);
                        if (r == "fail")
                        {
                            alert("Password Incorrect");
                        } else if (r == "success")
                        {
                            // alert("Login succesful");
                            setInterval("3000");
                            document.getElementById("form3").reset;
                            window.location.href = "Customer_Home_Page.jsp"

                        } else if (r == "pending")
                        {
                            confirmOtp();
                        }

                    }
                };

                xhr.open("GET", "./Customer_Login_Servlet?email3=" + email3 + "&pass3=" + pass3, true);

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
                        document.getElementById("error1").style.color = "green";
                        document.getElementById("l2").innerHTML = "OTP Resent";

                    }
                };

                xhr.open("GET", "./Resend_Sms_Servlet", true);

               // alert("Sending Request to Server");
                //  alert(formdata);

                //console.log(formdata);

                // ALso send FORM-Data with AJAX REQUEST
                xhr.send();

            }

            function confirmCustomer()
            {
                var otp1 = document.getElementById("otp1").value;
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                       // alert("result=" + r);
                        if (r == "fail")
                        {
                            alert("Some Error Occured, Please Try again");
                        } else if (r == "success")
                        {
                            document.getElementById("error").style.color = "green";
                            document.getElementById("l1").innerHTML = "Signup Succesful";
                            $('#myModal1').modal('hide');
                        }
                    }
                };

                xhr.open("GET", "./Confirm_Customer_Servlet?otp=" + otp1, true);

               // alert("Sending Request to Server");

                xhr.send();
            }

            function checkRestaurant()
            {

                var flagempty = false;
                var flagemail = false;
                var e = document.getElementById("remail").value;
                var p = document.getElementById("rpassword").value;
                if (e == "" || p == "" || e == null || p == null)
                {
                    document.getElementById("d1").style.color = "red";
                    document.getElementById("l1").innerHTML = "All Fields are Mandatory";
                } else
                    flagempty = true;

                var flagspecial = false;
                var flagdot = false;
                for (var i = 0; i < e.length; i++)
                {
                    if (e.charAt(i) == '@')
                        flagspecial = true;
                    if (e.charAt(i) == '.')
                        flagdot = true;
                    if (flagspecial == true && flagdot == true)
                        flagemail = true;
                }

                if (flagempty == true && flagemail == true)
                {
                    var xhttp = new XMLHttpRequest();

                    // Step 4 
                    // Callback method
                    // This method is called when server gives answer
                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {

                            var r = xhttp.responseText.trim();

                            //document.getElementById("l2").innerHTML=r;
                            if (r == "success")
                            {
                               // document.getElementById("d6").style.color = "green";
                              //  document.getElementById("l6").innerHTML = "Login succesful";
                                window.location.href = "Restaurant_Home_Page.jsp";
                            } else if (r == "Password Incorrect")
                            {
                                alert("Password Incorrect");
                              //  document.getElementById("d6").style.color = "red";
                                //document.getElementById("l6").innerHTML = "Password Incorrect";
                            } 
                            else if (r == "This email does not Exist")
                            {
                                alert("This email does not Exist");
                               // document.getElementById("d6").style.color = "red";
                               // document.getElementById("l6").innerHTML = "This Email does not Exist";
                            }
                        }
                    };
                    xhttp.open("GET", "./Restaurant_Login_Servlet?e=" + e + "&p=" + p, true);

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
                var email = document.getElementById("email7").value;
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        var r = xhr.responseText.trim();
                        if (r == "")
                        {
                            document.getElementById("d7").style.color = "red";
                            document.getElementById("l7").innerHTML = "Wrong Email!!!";
                        } else
                        {
                            var parts = r.split(",");
                            otps = parts[0];
                            mobiles = parts[1];
                            // alert("OTP="+otps+"mobile"+mobiles);
                            document.getElementById("d7").style.color = "green";
                            document.getElementById("l7").innerHTML = "OTP is sent to your mobile Number";
                            document.getElementById("d7b").style.display = "block";
                            document.getElementById("d7c").style.display = "block";

                        }

                    }
                };

                xhr.open("GET", "./Restaurant_Forget_Passsword_Servlet?email=" + email, true);

                //  alert("Sending Request to Server");
                //  alert(formdata);

                //console.log(formdata);

                // ALso send FORM-Data with AJAX REQUEST
                xhr.send();
            }

            function restaurantCheckOTP()
            {
                var otp7 = document.getElementById("otp7").value;
                if (otp7 == otps)
                {
                    var xhr = new XMLHttpRequest;

                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var r = xhr.responseText.trim();
                            if (r == "fail")
                            {
                                document.getElementById("d7a").style.color = "red";
                                document.getElementById("l7a").innerHTML = "Some Error Occured Please Try Again Later!!!";
                            } else if (r == "success")
                            {
                                document.getElementById("d7a").style.color = "green";
                                document.getElementById("l7a").innerHTML = "Password is sent to your Mobile Number " + mobiles;
                            }

                        }
                    };

                    xhr.open("GET", "./Restaurant_Send_Passsword_Servlet?mobiles=" + mobiles, true);

                    //  alert("Sending Request to Server");
                    //  alert(formdata);

                    //console.log(formdata);

                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                } else
                {
                    document.getElementById("d7a").style.color = "red";
                    document.getElementById("l7a").innerHTML = "OTP is Wrong!!!";
                }
            }

            function CustomerForgotPassword()
            {
                var mobile = document.getElementById("mob8").value;
                var question = document.getElementById("question8").value;
                var answer = document.getElementById("answer8").value;
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        var r = xhr.responseText.trim();
                      //  alert(r);
                        if (r == "fail")
                        {
                            document.getElementById("d8").style.color = "red";
                            document.getElementById("l8").innerHTML = "Some Error Occured Please Try Again Later!!!";
                        } else if (r == "success")
                        {
                            document.getElementById("d8").style.color = "green";
                            document.getElementById("l8").innerHTML = "Password is sent to your Mobile Number";
                        }

                    }
                };

                xhr.open("GET", "./Customer_Forget_Passsword_Servlet?mobile=" + mobile + "&question=" + question + "&answer=" + answer, true);

             //   alert("Sending Request to Server");
                //  alert(formdata);

                //console.log(formdata);

                // ALso send FORM-Data with AJAX REQUEST
                xhr.send();
            }
            
            function checkIfLogin()
            {
                $('#myModal30').modal('hide');
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        //alert("result=" + r);
                        if (r == "fail")
                        {
                            alert("Please Login before Placing any Orders");
                            $('#myModal3').modal('show');
                        } 
                        else if (r == "success")
                        {
                            window.location.href="Place_Order.jsp";
                        }
                    }
                };

                xhr.open("GET", "./Check_If_Login", true);

              //  alert("Sending Request to Server");

                xhr.send();
                
            }
            var RID;
            function findRestaurant()
            {
                var resname=document.getElementById("resname").value;
                var rescity=document.getElementById("rescity").value;
                var xhr = new XMLHttpRequest;
               if(resname!="" && rescity!="")
               {
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        
                        //alert("result=" + r);
                        var mainobj = JSON.parse(r);
                        
                         var arr4 = mainobj.ans;
                         var obj=arr4[0];
                         RID=obj.restaurant_id;
                         document.getElementById("resname1").innerHTML="Name: "+obj.restaurant_name;
                         document.getElementById("resaddr").innerHTML="Address: "+obj.address;
                         document.getElementById("resemail").innerHTML="Email Id: "+obj.emailid;
                         document.getElementById("resmobile").innerHTML="Mobile No :"+obj.mobileno;
                         document.getElementById("resmin").innerHTML="Minimum Order :"+obj.min_order_delivery;
                         document.getElementById("rescharge").innerHTML="Delivery Charges: "+obj.delivery_charges;
                         
                        $('#myModal30').modal('show');
                    }
                };

                xhr.open("GET","./Find_Restaurant2?resname="+resname+"&rescity="+rescity, true);

              //  alert("Sending Request to Server");

                xhr.send();
                
               }
            }
           var RID2;
           var RID3;
           var RID4;
             function topRestaurant()
             {
               
                var xhr = new XMLHttpRequest;
               
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        
                       // alert("result=" + r);
                        var mainobj = JSON.parse(r);
                        
                         var arr4 = mainobj.ans;
                         var obj=arr4[0];
                         console.log(arr4[0].restaurant_name+" "+arr4[3].restaurant_name);
                         //document.getElementById("ressname").innerHTML=obj.restaurant_name;
                         document.getElementById("ressnamex").innerHTML=obj.restaurant_name;
                         document.getElementById("ressdesc").innerHTML=obj.description;
                         document.getElementById("ressimage").src=obj.photo_square;
                        RID=obj.restaurant_id;
                        
                        var obj2=arr4[1];
                         //document.getElementById("ressname").innerHTML=obj.restaurant_name;
                         document.getElementById("ressnamex2").innerHTML=obj2.restaurant_name;
                         document.getElementById("ressdesc2").innerHTML=obj2.description;
                         document.getElementById("ressimage2").src=obj2.photo_square;
                        RID2=obj2.restaurant_id;
                        
                        var obj3=arr4[2];
                         //document.getElementById("ressname").innerHTML=obj.restaurant_name;
                         document.getElementById("ressnamex3").innerHTML=obj3.restaurant_name;
                         document.getElementById("ressdesc3").innerHTML=obj3.description;
                         document.getElementById("ressimage3").src=obj3.photo_square;
                        RID3=obj3.restaurant_id;
                        
                         
                  
                    }
                };

                xhr.open("GET","./Top_Restaurant", true);

              //  alert("Sending Request to Server");

                xhr.send(); 
             }
//             $(document).ready(function(){
  // we call the functi
//});
             
             function checkIfLogin1()
            {
                window.location.href="Place_Order_2.jsp?index="+RID;    
             }
              function checkIfLogin2()
            {
                window.location.href="Place_Order_2.jsp?index="+RID2;    
             }
              function checkIfLogin3()
            {
                window.location.href="Place_Order_2.jsp?index="+RID3;    
             }
             
        </script>

    </head>
    <body onload="topRestaurant()">

        <div id="preloader">
            <div class="loader absolute-center">
                <div class="loader__box"><b class="top"></b></div>
                <div class="loader__box"><b class="top"></b></div>
                <div class="loader__box"><b class="top"></b></div>
            </div>
        </div>

        <!--================ Frist hader Area =================-->
        <div class="first_header">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="header_contact_details">
                            <a href="#"><i class="fa fa-phone"></i>+919592082235</a>
                            <a href="#"><i class="fa fa-envelope-o"></i>freshyfood@gmail.com</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="event_btn_inner">
                            <!--    <a class="event_btn" href="table.html"><i class="fa fa-table" aria-hidden="true"></i>Book a Table</a>
                                <a class="event_btn" href="event.html"><i class="fa fa-calendar" aria-hidden="true"></i>Book an Event</a>-->
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="header_social">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Footer Area =================-->

        <!--================End Footer Area =================-->
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
                            <li class="active"><a href="Public_Index.jsp">Home</a></li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Customer <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#myModal3" data-toggle="modal">Login</a></li>
                                    <li><a href="Customer_Signup.jsp">Sign Up</a></li>
                                </ul>
                            </li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Restaurant<i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#myModal6" data-toggle="modal">Login</a></li>
                                    <li><a href="Restaurant_Signup.jsp">Sign Up</a></li>
                                </ul>
                            </li>
                            <li><a href="Place_Order.jsp">Place Order</a></li>
                            <li><a href="Gallery.jsp">Gallery</a></li>
                              <li><a href="About.jsp">About Us</a></li>
                              <li><a href="Contact.jsp">Contact Us</a></li>
                            <!--   <li><a href="gallery.html">Gallery</a></li>
                                <li class="dropdown submenu">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="event.html">Event</a></li>
                                        <li><a href="table.html">Table</a></li>
                                    </ul>
                                </li>
                            <!-- <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">News <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-gallery.html">Blog Gallery</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact US</a></li>-->
                            <li><a><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li> 
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        <!--================End Footer Area =================-->

        <!--================Slider Area =================-->
        <section class="slider_area">
            <div class=slider_inner>
                <div class="rev_slider fullwidthabanner"  data-version="5.3.0.2" id="home-slider">
                    <ul> 
                        <li data-slotamount="7" data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="600" data-rotate="0" data-saveperformance="off">
                            <!-- MAIN IMAGE -->
                            <img src="img/home-slider/slider-1.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <!-- LAYERS -->

                            <!-- LAYER NR. 1 -->
                            <div class="slider_text_box">
                                <div class="tp-caption bg_box" 
                                     data-width="none"
                                     data-height="none"
                                     data-whitespace="nowrap"
                                     data-x="center" 
                                     data-y="['350','350','300','250','0']"
                                     data-fontsize="['55']" 
                                     data-lineheight="['60']" 
                                     data-transform_idle="o:1;"
                                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:0px;" 
                                     data-mask_out="x:inherit;y:inherit;" 
                                     data-start="2000" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on">
                                </div>
                                <div class="tp-caption first_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['-20']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['42','42','42','42','25']"
                                     data-lineheight="['52','52','52','52','35']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1000" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" >Welcome To 
                                </div>
                                <div class="tp-caption secand_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['45']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['36']"
                                     data-lineheight="['42']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1000" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" >Freshy
                                </div>
                                <div class="tp-caption third_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['100']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['24','24','24','24','16']"
                                     data-lineheight="['34','34','34','34','26']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1200" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" >A PREMIUM FOOD DELIVERY SERVICE
                                </div>
                                <div class="tp-caption btn_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['180']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['16.75']"
                                     data-lineheight="['26']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1200" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" ><a class="submit_btn_bg" href="Place_Order.jsp">Place Order</a>
                                </div>
                            </div>
                        </li>
                        <li data-slotamount="7" data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="600" data-rotate="0" data-saveperformance="off">
                            <!-- MAIN IMAGE -->
                            <img src="img/home-slider/slider-2.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <!-- LAYERS -->

                            <!-- LAYER NR. 1 -->
                            <div class="slider_text_box text_box2">
                                <div class="tp-caption bg_box" 
                                     data-width="none"
                                     data-height="none"
                                     data-whitespace="nowrap"
                                     data-x="center" 
                                     data-y="['350','350','300','250']"
                                     data-fontsize="['55']" 
                                     data-lineheight="['60']" 
                                     data-transform_idle="o:1;"
                                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:0px;" 
                                     data-mask_out="x:inherit;y:inherit;" 
                                     data-start="2000" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on">
                                </div>
                                <div class="tp-caption first_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['-20']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['42','42','42','42','25']"
                                     data-lineheight="['52','52','52','52','35']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1000" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" >Welcome To
                                </div>
                                <div class="tp-caption secand_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['45']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['36']"
                                     data-lineheight="['42']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1000" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" >Freshy
                                </div>
                                <div class="tp-caption third_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['100']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['24','24','24','24','16']"
                                     data-lineheight="['34','34','34','34','26']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1200" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" >A PREMIUM FOOD DELIVERY SERVICE
                                </div>
                                <div class="tp-caption btn_text" 
                                     data-x="center" 
                                     data-y="center" 
                                     data-voffset="['180']"
                                     data-Hoffset="['0']"
                                     data-fontsize="['16.75']"
                                     data-lineheight="['26']"
                                     data-width="none"
                                     data-height="none"
                                     data-transform_idle="o:1;"
                                     data-whitespace="nowrap"
                                     data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                                     data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                                     data-start="1200" 
                                     data-splitin="none" 
                                     data-splitout="none" 
                                     data-responsive_offset="on" 
                                     data-elementdelay="0.05" ><a class="submit_btn_bg" href="Place_Order.jsp">Place Order</a>
                                </div>
                            </div>
                        </li>
                    </ul> 
                </div><!-- END REVOLUTION SLIDER -->
            </div>
        </section>
        <!--================End Slider Area =================-->

        <!--================Service Area =================-->
        <section class="service_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="service_item">
                            <img src="img/service-icon/service-1.png" alt="">
                            <h3>Pizzas</h3>
                            <p>Pizza is a savory dish of Italian origin, consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients.</p>
                            <a class="read_mor_btn" href="Place_Order.jsp">Order</a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="service_item">
                            <img src="img/service-icon/service-2.png" alt="">
                            <h3>Coffee</h3>
                            <p>Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffee species. Once ripe, coffee berries are picked, processed, and dried.</p>
                            <a class="read_mor_btn" href="Place_Order.jsp">Order</a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="service_item">
                            <img src="img/service-icon/service-3.png" alt="">
                            <h3>Burgers</h3>
                            <p>A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun.</p>
                            <a class="read_mor_btn" href="Place_Order.jsp">Order</a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="service_item">
                            <img src="img/service-icon/service-4.png" alt="">
                            <h3>Drinks</h3>
                            <p>From cocktails to punch for kids,Discover your new favorite cocktail recipe or learn how to make a classic drink— like the Old Fashioned, mojito, or White Russian—right at home.</p>
                            <a class="read_mor_btn" href="Place_Order.jsp">Order</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Service Area =================-->

        <!--================Booking Table Area =================-->
     <section class="booking_table_area">
            <div class="container">
                <div class="s_white_title">
                    <h3>Find Resataurant</h3>
                   
                   
                </div>
               <div class="row">
                    <div class="col-sm-4">
                        <div class="input-append">
                            <input size="" type="text" value="" id="resname" placeholder="Name">
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                    </div>
                   <!-- <div class="col-sm-4">
                        <div class="input-append">
                            < size="16" type="text" id="rescity" value="" placeholder="City">
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                    </div>-->
                   <div class="col-sm-4">
                        <div class="party_size">
                            <select class="selectpicker"id="rescity">
                                <option>Amritsar</option>
                                <option>TarnTaran</option>
                                <option>Jalandhar</option>
                                <option>Ludhiana</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-default submit_btn" onclick="findRestaurant()">FIND RESTAURANT</button>
                    </div>
                </div>
                <div class="s_white_title">
                 
                </div>
            </div>
        </section>
        <!--================End Booking Table Area =================-->

        <!--================Our feature Area =================-->
        <br>
        <br>
      <!--  <section class="our_feature_area">
            <div class="container">
                <div class="s_black_title">
                    <h3>Today's</h3>
                    <h2>Special</h2>
                </div>
                <div class="feature_slider">
                    <div class="item">
                        <div class="feature_item">
                            <div class="feature_item_inner">
                                <img src="img/feature/feature-1.jpg" alt="">
                                <div class="icon_hover">
                                    <i class="fa fa-search"></i>
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                            </div>
                            <div class="title_text">
                                <div class="feature_left"><a href="table.html"><span>Grilled Chicken</span></a></div>
                                <div class="restaurant_feature_dots"></div>
                                <div class="feature_right">$32</div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="feature_item">
                            <div class="feature_item_inner">
                                <img src="img/feature/feature-2.jpg" alt="">
                                <div class="icon_hover">
                                    <i class="fa fa-search"></i>
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                            </div>
                            <div class="title_text">
                                <div class="feature_left"><a href="table"><span>Lasagne Pasta</span></a></div>
                                <div class="restaurant_feature_dots"></div>
                                <div class="feature_right">$16</div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="feature_item">
                            <div class="feature_item_inner">
                                <img src="img/feature/feature-3.jpg" alt="">
                                <div class="icon_hover">
                                    <i class="fa fa-search"></i>
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                            </div>
                            <div class="title_text">
                                <div class="feature_left"><a href="table"><span>Hamburger</span></a></div>
                                <div class="restaurant_feature_dots"></div>
                                <div class="feature_right">$25</div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="feature_item">
                            <div class="feature_item_inner">
                                <img src="img/feature/feature-1.jpg" alt="">
                                <div class="icon_hover">
                                    <i class="fa fa-search"></i>
                                    <i class="fa fa-shopping-cart"></i>
                                </div>
                            </div>
                            <div class="title_text">
                                <div class="feature_left"><a href="table"><span>Grilled Chicken.</span></a></div>
                                <div class="restaurant_feature_dots"></div>
                                <div class="feature_right">$32</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->
        <!--================End Our feature Area =================-->

        <!--================End Our feature Area =================-->
   <!--    <section class="most_popular_item_area">
            <div class="container">
                <div class="s_white_title">
                    <h3>Most Popular</h3>
                    <h2>Today's Menu</h2>
                </div>
                <div class="popular_filter">
                    <ul>
                        <li class="active" data-filter="*"><a href="">All</a></li>
                        <li data-filter=".break"><a href="">Breakfast</a></li>
                        <li data-filter=".lunch"><a href="">Lunch</a></li>
                        <li data-filter=".dinner"><a href="">Dinner</a></li>
                        <li data-filter=".snacks"><a href="">Snacks</a></li>
                        <li data-filter=".coffee"><a href="">Coffee</a></li>
                    </ul>
                </div>
                <div class="p_recype_item_main">
                    <div class="row p_recype_item_active">
                        <div class="col-md-6 break snacks">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-1.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>Rs.32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 break coffee">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-2.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 lunch snacks">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-3.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 lunch dinner">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-4.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 break coffee">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-5.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 break coffee">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-6.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 lunch coffee">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-7.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 dinner snacks">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-8.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 dinner coffee">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-9.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 dinner coffee">
                            <div class="media">
                                <div class="media-left">
                                    <img src="img/recype/recype-10.jpg" alt="">
                                </div>
                                <div class="media-body">
                                    <a href="#"><h3>Vegetable Flavour</h3></a>
                                    <h4>$32</h4>
                                    <p>Lorem ipsum dolor sit amets, consectetur adipiscing </p>
                                    <a class="read_mor_btn" href="#">Add To Cart</a>
                                    <ul>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                        <li><a href="#"><i class="fa fa-star-half-o"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->
        <!--================End Our feature Area =================-->

        <!--================Our Chefs Area =================-->
        <section class="our_chefs_area">
            
                <div class="s_black_title">
                    <h3>Top</h3>
                    <h2>RESTAURANTS</h2>
                </div>
            <center>
                <div class="chefs_slider_active">
                    <div class="item">
                        <div class="chef_item_inner">
                            <div class="chef_img">
                                <img id="ressimage" style="width:357px; height:335px;" src="img/chef/chef-1.jpg" alt="">
                                <div class="chef_hover">
                                    <a onclick="checkIfLogin1()"><h4>PLACE ORDER</h4></a>
                                    <h5></h5>
                                    <p id="ressdesc"></p>
                                </div>
                            </div>
                            <div class="chef_name">
                                <div class="name_chef_text">
                                    <h3 id="ressnamex"></h3>
                                    <h4></h4>
                                </div>
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class="chef_item_inner">
                            <div class="chef_img">
                                <img id="ressimage2" style="width:357px; height:335px;"  alt="">
                                <div class="chef_hover">
                                    <a onclick="checkIfLogin2()"><h4>PLACE ORDER</h4></a>
                                    <h5></h5>
                                    <p id="ressdesc2"></p>
                                </div>
                            </div>
                            <div class="chef_name">
                                <div class="name_chef_text">
                                    <h3 id="ressnamex2"></h3>
                                    <h4></h4>
                                </div>
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                     <div class="item">
                        <div class="chef_item_inner">
                            <div class="chef_img">
                                <img id="ressimage3" style="width:357px; height:335px;"  alt="">
                                <div class="chef_hover">
                                    <a onclick="checkIfLogin3()"><h4>PLACE ORDER</h4></a>
                                    <h5></h5>
                                    <p id="ressdesc3"></p>
                                </div>
                            </div>
                            <div class="chef_name">
                                <div class="name_chef_text">
                                    <h3 id="ressnamex3"></h3>
                                    <h4></h4>
                                </div>
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                   
                    
                   
                    
                              
                        </div>
            </center>
               
        </section>
        <!--================End Our Chefs Area =================-->

        <!--================End Our Chefs Area =================-->
       <!-- <section class="next_event_area">
            <div class="container">
                <div class="s_white_red_title">
                    <h3>Events</h3>
                    <h2>Next Event</h2>
                </div>
                <div class="next_event_slider">
                    <div class="item">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="left_event_img">
                                    <img src="img/next-event/next-event-1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="right_event_text">
                                    <a href="#"><h3>Opening Party - themeXart IT Farm</h3></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusqs enm tempor incididunt ut labore et dolore magna aliqua. Ut enim advastmi sunt veniam, quis nostrud exercitation... <a href="#">View Detail</a></p>
                                    <div class="event_shedule">
                                        <time datetime="P65DT05H16M22S"></time>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="left_event_img">
                                    <img src="img/next-event/next-event-1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="right_event_text">
                                    <a href="#"><h3>Opening Party - themeXart IT Farm</h3></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusqs enm tempor incididunt ut labore et dolore magna aliqua. Ut enim advastmi sunt veniam, quis nostrud exercitation... <a href="#">View Detail</a></p>
                                    <div class="event_shedule">
                                        <time datetime="P65DT05H16M22S"></time>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="left_event_img">
                                    <img src="img/next-event/next-event-1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="right_event_text">
                                    <a href="#"><h3>Opening Party - themeXart IT Farm</h3></a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusqs enm tempor incididunt ut labore et dolore magna aliqua. Ut enim advastmi sunt veniam, quis nostrud exercitation... <a href="#">View Detail</a></p>
                                    <div class="event_shedule">
                                        <time datetime="P65DT05H16M22S"></time>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->
        <!--================End Our Chefs Area =================-->

        <!--================Recent Blog Area =================-->
       
        <!--================End Recent Blog Area =================-->

        <!--================End Recent Blog Area =================-->
        <footer class="footer_area">
            <div class="footer_widget_area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <aside class="f_widget about_widget">
                                <div class="f_w_title">
                                    <h4>ABOUT Freshy</h4>
                                </div>
                                <p>We are committed to nurturing a neutral platform and are helping food establishments maintain high standards through Hyperpure. Food Hygiene Ratings is a coveted mark of quality among our restaurant partners.</p>
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </aside>
                        </div>
                        <div class="col-md-4">
                            <aside class="f_widget contact_widget">
                                <div class="f_w_title">
                                    <h4>CONTACT US</h4>
                                </div>
                                <p>Have questions, comments or just want to say hello:</p>
                                <ul>
                                    <li><a href="#"><i class="fa fa-envelope"></i>freshyfood@gmail.com</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+919592082235</a></li>
                                    <li><a href="#"><i class="fa fa-map-marker"></i>23, Kabir Park, NH1<br /> Amritsar, Punjab</a></li>
                                </ul>
                            </aside>
                        </div>
                      <!--  <div class="col-md-3">
                            <aside class="f_widget twitter_widget">
                                <div class="f_w_title">
                                    <h4>Twitter Feed</h4>
                                </div>
                                <ul>
                                    <li>
                                        <a href="#">@_sumonrahman:</a> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.
                                    </li>
                                    <li>
                                        <a href="#">@_sumonrahman:</a> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.
                                    </li>
                                </ul>
                            </aside>
                        </div>-->
                        <div class="col-md-4">
                            <aside class="f_widget gallery_widget">
                                <div class="f_w_title">
                                    <h4>Gallery On Flickr</h4>
                                </div>
                                <ul>
                                    <li><img src="img/gallery/f-w-gallery/f-w-gallery-1.jpg" alt=""></li>
                                    <li><img src="img/gallery/f-w-gallery/f-w-gallery-2.jpg" alt=""></li>
                                    <li><img src="img/gallery/f-w-gallery/f-w-gallery-3.jpg" alt=""></li>
                                    <li><img src="img/gallery/f-w-gallery/f-w-gallery-4.jpg" alt=""></li>
                                    <li><img src="img/gallery/f-w-gallery/f-w-gallery-5.jpg" alt=""></li>
                                    <li><img src="img/gallery/f-w-gallery/f-w-gallery-6.jpg" alt=""></li>
                                </ul>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy_right_area">
                <div class="container">
                    <div class="pull-left">
                        <h5><p>Name: Gurlal Singh &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         Roll No.: 2016ECA1028&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          Course: B-Tech, ECE(8th Semester)
                            </p></h5>
                    </div>
                    <div class="pull-right">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Gallery.jsp">Gallery</a></li>
                              <li><a href="About.jsp">About Us</a></li>
                              <li><a href="Contact.jsp">Contact Us</a></li>
                         <!--<li class="active"><a href="#">Home</a></li>
                         
                            
                            <li><a href="#">Menu</a></li>
                           
                            <li><a href="#">Reservation</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Contact Us</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!--================End Recent Blog Area =================-->



        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
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





<div id="myModal3" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-header">
                <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Customer Login </h1></center>
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

                       

                    </div>
                </div>
                
                   
                        <div class="form-group form-row">
                            <br>
                            <input type="button" value="Login" class="btn-outline-primary btn-lg col-sm-12" onclick="customerLogin()" />
                        </div>

                        <div id="d3" style="color:red"><label id="l3" class="offset-3"></label></div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div id="d6a"  class="offset-3"><a href="#myModal8" data-toggle="modal" >Forgot Password</a></div>

                                <div id="d6b" class="offset-3"><a href="Customer_Signup.jsp">Don't have an Account</a></div>

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
                <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Verify Mobile Number </h1></center>
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
                <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Restaurant Login </h1></center>
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
                            <br>
                            <div class="row">
                            <div class="form-group form-row" id="d6" style="color:red">
                                <h3 id="l6" class="offset-3"></h3>
                            </div>
                            </div>

                        </form>

                        <div class="form-group form-row">
                            <br>
                            <input type="button" value="Login" class="btn-outline-primary btn-lg col-sm-12" onclick="checkRestaurant()" />
                        </div>



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
                <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Forgot Password </h1></center>
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
                            <br>
                            <input type="button" value="Submit" class="btn-outline-primary btn-lg col-sm-12 " onclick="restaurantForgotPassword()" />
                        </div>

                        <div id="d7" style="color:red"><label id="l7" ></label></div>

                        <form id="form7a" >

                            <div class="form-group " id="d7b" style="display: none;">
                                <label for="otp7" class="col-sm-3">Enter OTP</label>
                                <input type="text" name="otp7" id="otp7" class="form-control col-sm-12"/>

                            </div>

                        </form>

                        <div class="form-group " id="d7c" style="display: none;">
                            <input type="button" value="Submit" class="btn-outline-primary btn-lg col-sm-12 " onclick="restaurantCheckOTP()" />
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
                <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Forgot Password</h1></center>
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

                    </div>
                </div>
                <br>
                <div class="form-group ">
                            
                      <input type="button" value="Submit" class="btn-outline-primary btn-lg col-sm-12" onclick="CustomerForgotPassword()" />
                        </div>

                        <div id="d8" style="color:red"><label id="l8" ></label></div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>

    </div>
</div>


<div id="myModal30" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-header">
                <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Restaurant Info </h1></center>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">

                <div class="row">
                    <div class="col-sm-12">

                        
                       <div class="col-md-6">
                        <div class="about_left_content">
                           
                          <!--  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typeting, remaining essentially unchanged.</p>-->
                            <ul>
                                <li><i class="fa fa-arrow-circle-right" aria-hidden="true"></i><label id="resname1"></label> </li>
                                <li><i class="fa fa-arrow-circle-right" aria-hidden="true"></i><label id="resaddr"></label> </li>
                                <li><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <label id="resemail"></label></li>
                                <li><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <label id="resmobile"></label></li>
                                <li><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <label id="resmin"></label></li>
                                <li><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <label id="rescharge"></label></li>
                            
                            </ul>
                          
                        </div>
                       </div>

                        <div class="form-group ">
                            
                              <center>   <input type="button" value="PLACE ORDER" class="btn-outline-primary btn-lg col-sm-12" onclick="checkIfLogin1()" /></center>
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
<!--<script src="js/jquery-3.5.0.min.js" type="text/javascript"></script>-->
<!--<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>-->