<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
     <!--   <title>Customer Sign Up</title>
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
               function readandpreview(fileobj, imageid)
             {
                var firstfile = fileobj.files[0];
                var reader = new FileReader();
                reader.onload = (function (f)
                {
                    return function read(e)
                    {
                        document.getElementById(imageid).src = e.target.result;
                    }
                })(firstfile);
                reader.readAsDataURL(firstfile);
            }
           
            function check()
            {
                var emptyflag=false;
                var emailflag=false;
                var passflag=false;
                var mobflag=false;
               
                var city =document.getElementById("city").value;
                var email=document.getElementById("email").value;
                var fullname =document.getElementById("fullname").value;
            //    var remail=document.getElementById("remail").value;
                var pass=document.getElementById("pass").value;
                var pass1=document.getElementById("pass1").value;
                var addr=document.getElementById("addr").value;
                var mob=document.getElementById("mob").value;
              //  var rcover=document.getElementById("rcover").src;
              //  var rprofile=document.getElementById("rprofile").src;
                var question=document.getElementById("question").value;
                var answer=document.getElementById("answer").value;
               
               
                
                if(city=="" || fullname=="" || email=="" ||  pass=="" || pass1=="" || addr=="" || mob=="" || question=="" || answer=="")
            {
                 document.getElementById("error").style.color="red";
                document.getElementById("l1").innerHTML="All Field are necessary!!!";     
            }
            else
            {
                emptyflag=true;
            }
             var flag=0;
            var len=mob.length;
            if(len!=10)
            {
               document.getElementById("error").style.color="red";
               document.getElementById("l1").innerHTML="Mobile No. must be 10 Digits!!!";  
            }
           
            else
            {
                for(i=0;i<10;i++)
                {
                    var m=mob.charAt(i);
                    if(m<'0' && m>'9')
                    {
                       flag=1;
                       break;
                        document.getElementById("error").style.color="red";
                        document.getElementById("l1").innerHTML="Mobile No. must be all Digits!!!";
                    }
                   
                }
                if(flag==0)
                {
                    mobflag=true;
                }
            }
 
            if(pass==pass1)
            {
                passflag=true;
            }
            else
            {
                 document.getElementById("error").style.color="red";
                document.getElementById("l1").innerHTML="Password and Confirm Password doesn't Match!!!";
            }
            var flagspecial=false;
            var flagdot=false;
            var a=0;
            var b=0;
            for(var i=0;i<email.length;i++)
            {
                if(email.charAt(i)=='@')
                {
                     flagspecial=true;
                     a=i;
                     
                }
               if(email.charAt(i)=='.')
               {
                    flagdot=true;
                   b=i;
               }
              
            }
             if(flagspecial==true &&  flagdot==true && a<b)
                   emailflag=true;
               else
               {
                document.getElementById("error").style.color="red";
                document.getElementById("l1").innerHTML="Please Enter Valid Email Id!!!";
               }
            if(emailflag==true && passflag==true && emptyflag==true && mobflag==true)
                customerSignup();
         
            }
            
            function customerSignup()
            {
                 var ans = "";
                var formdata = new FormData();
                
                var controls = document.getElementById("form2").elements;
                var flag = 0;
                var cids="";
                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }
                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length > 0)
                        {
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } 
                        else
                        {
                            flag = 2;
                        }
                    } 
                  /*  else if(controls[i].type=="checkbox"){
                        if(controls[i].checked==true){
                            cids+=controls[i].name+",";
                        }}*/
                
                    else    // if not file, text control
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
               // formdata.append("cids",cids);
                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } 
                else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } 
                else
                {
                    // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            //alert("result="+r);
                             if(r=="duplicate")
                        {
                             alert("A Duplicate of this already exists");
                        }
                        else if(r=="success")
                        {
                            confirmOtp();
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Customer_Signup_Servlet", true);
                    
                    //alert("Sending Request to Server");
                  //  alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }
            }
            
           
            
          </script>       

    </head>
    <body>
        <jsp:include page="Public_Header2.jsp" />
        <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Customer Sign Up</h1>
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
                
                    
                    <form id="form2" method="post" enctype="multipart/form-data">
                        
                      
                        <div class="form-group form-row">
                            <label for="email" class="col-sm-3">Email</label>
                            <input type="text" name="email" id="email" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="pass" class="col-sm-3">Password</label>
                            <input type="password" name="pass" id="pass" class="form-control col-sm-9" /> 
                        </div>
                    
                          <div class="form-group form-row">
                            <label for="pass1" class="col-sm-3">Confirm Password</label>
                            <input type="password" name="pass1" id="pass1" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="fullname" class="col-sm-3">Full Name</label>
                            <input type="text" name="fullname" id="fullname" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="mob" class="col-sm-3">Mobile Number</label>
                            <input type="text" name="mob" id="mob" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="addr" class="col-sm-3">Address</label>
                            <input type="text" name="addr" id="addr" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="city" class="col-sm-3">City</label>
                            <select  name="city" id="city" onchange="" class="form-control col-sm-9">
                                <option>Amritsar</option>
                                <option>TarnTaran</option>
                                <option>Jalandhar</option>
                                <option>Ludhiana</option>
                            </select>
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="photo" class="col-sm-3">Photo</label>
                            <input type="file"  id="photo" name="photo" accept="image/*" onchange="readandpreview(this, 'img')" class="form-control col-sm-9" /> 
                       <img src="" width="200" height="170" id="img" class="offset-3">
                        </div>
                      
              
                         <div class="form-group form-row">
                            <label for="question" class="col-sm-3">Security Question</label>
                            <select  name="question" id="question" onchange="" class="form-control col-sm-9">
                                <option>What is the Name of your First Pet?</option>
                                <option>What is the name of your hometown?</option>
                                <option>What is your Nickname at Home? </option>
                                <option>What is the name of your Favourite Movie?</option>
                    </select>
                           
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="answer" class="col-sm-3">Security Answer</label>
                            <input type="text" name="answer" id="answer" class="form-control col-sm-9" /> 
                        </div>
               
                    </form>
                    
         
                </div>
               
        
        </div>
        </div>
         <br>
         
         <div class="container">
          
            <div class="row">
                <div class="col-sm-12">
                    <button type="button" class="btn-outline-primary col-sm-12 btn-lg"  onclick="check()">SIGN UP</button>
                    <div id="error" style="color:red"><label id="l1" class="offset-3"></label></div>
             <div id="error1" style="color:red"><label id="l2" class="offset-3"></label></div>
                </div>
                </div>
         </div>
         
            <br>
            <br>
         
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
