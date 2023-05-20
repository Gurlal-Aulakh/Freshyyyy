<%-- 
    Document   : Restaurant_Edit_Profile
    Created on : 1 May, 2020, 4:30:21 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
      <!--  <title>ADMIN CHANGE PASSWORD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
          <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
          <script src="js/jquery-3.5.0.min.js" type="text/javsascript"></script>
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
@import url('https://fonts.googleapis.com/css2?family=Barrio&family=Bungee+Shade&family=Ceviche+One&family=Delius+Swash+Caps&family=Roboto&display=swap');
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
            
              function readandpreview1(fileobj, imageid)
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
            
            function oldInfoCuisine()
            {
                var xhttp = new XMLHttpRequest();
                 var singleobj=arr[0];
                 var rid=singleobj["restaurant_id"];
                 
                  xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                        var mainobj=JSON.parse(r);
                        arr=mainobj.ans;
                        
                  //  ans=ans+"<table class=\"table table-bordered\">";
                    for(var i=0;i<arr.length;i++)
                    {
                        var singleobj=arr[i];
                        var n=singleobj["cuisine_id"];
                        
                        document.getElementById(n).checked=true;
                       //ans=ans+singleobj["cuisine_id"]+",";
                    }
                    
                   
                  //  getCuisine1(ans);
                       
                       
                    }
                };
                xhttp.open("GET","./Old_Info_Cuisine_Servlet?rid="+rid,true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send();
                 
            }
            
            function getCuisine()
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
                        arr=mainobj.ans;
                        var ans="";
                  //  ans=ans+"<table class=\"table table-bordered\">";
                    for(var i=0;i<arr.length;i++)
                    {
                        var singleobj=arr[i];
                      
                        ans=ans+"<div class\"col-sm-3\">"+"<input type=\"checkbox\" name=\""+singleobj["cuisine_id"]+"\" value=\""+singleobj["cuisine_name"]+"\" id=\""+singleobj["cuisine_id"]+"\"/>"+singleobj["cuisine_name"]+"</div>";
                      /// <div class\"col-sm-3\">  +"</div>"
                      
                    }
                   
                    document.getElementById("cuisine11").innerHTML=ans;
                       
                    oldInfo();
                    }
                };
                xhttp.open("GET","./Get_Cuisine_Servlet",true);
             
                // Step 2
               // true --> async request
                
                // Step 3
                xhttp.send();    
            }
            
            
         
            
            function check()
            {
                var emptyflag=false;
                var emailflag=false;
               
               
                var city =document.getElementById("city1").value;
                var rname=document.getElementById("rname1").value;
                var remail=document.getElementById("remail1").value;
           //     var rpass=document.getElementById("rpass").value;
            //    var rpass1=document.getElementById("rpass1").value;
            var rdesc=document.getElementById("rdesc1").value;
                var raddr=document.getElementById("raddr1").value;
                var rmob=document.getElementById("rmob1").value;
                var rcover=document.getElementById("rcover1").value;
                var rprofile=document.getElementById("rprofile1").value;
                var rloc=document.getElementById("rloc1").value;
                var rmin=document.getElementById("rmin1").value;
                var rstart=document.getElementById("rstart1").value;
                var rend=document.getElementById("rend1").value;
                var rcharge=document.getElementById("rcharge1").value;
               
             // alert("rcover="+rcover);
                
                if(city=="" || rname=="" || remail==""  || rdesc=="" || raddr=="" || rmob=="" || rloc=="" || rmin=="" || rstart=="" || rend=="" || rcharge=="")
            {
                 document.getElementById("error").style.color="red";
                document.getElementById("l11").innerHTML="All Field are necessary!!!";
                emptyflag=true;
            }
            else
            {
                emptyflag=true;
            }
            
           
            var flagspecial=false;
            var flagdot=false;
            for(var i=0;i<remail.length;i++)
            {
                if(remail.charAt(i)=='@')
                flagspecial=true;
               if(remail.charAt(i)=='.')
                   flagdot=true;
               if(flagspecial==true &&  flagdot==true)
                   emailflag=true;
            }
            if(emailflag==true && emptyflag==true)
               editRestaurantprofile();
            else
            {
                document.getElementById("error").style.color="red";
                document.getElementById("l11").innerHTML="Please enter correct information!!!";
            }
                
            
            }
            
            function editRestaurantprofile()
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
                      
                    } 
                    else if(controls[i].type=="checkbox"){
                        if(controls[i].checked==true){
                            cids+=controls[i].name+",";
                        }
                    }
                    else    // if not file, text control
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
                formdata.append("cids",cids);
                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } 
               // else if (flag == 2)
              //  {
              //      alert("CHECK: --> Select Files for file controls");
              //  } 
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
                          // alert("result="+r);
                             if(r=="duplicate")
                        {
                            alert("error");
                        }
                        else if(r=="success")
                        {
                            alert("Profile Edited");
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Restaurant_Edit_Profile_Servlet", true);
                    
                    //alert("Sending Request to Server");
                   // alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }
            }
            
            function oldInfo()
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
                        arr=mainobj.ans;
                        var singleobj=arr[0];
                        document.getElementById("rname1").value=singleobj["restaurant_name"];
                       document.getElementById("rdesc1").value=singleobj["description"];
                       document.getElementById("remail1").value=singleobj["emailid"];
                       document.getElementById("raddr1").value=singleobj["address"];
                       document.getElementById("rmob1").value=singleobj["mobileno"];
                       document.getElementById("rloc1").value=singleobj["location"];
                       document.getElementById("rmin1").value=singleobj["min_order_delivery"];
                       document.getElementById("rstart1").value=singleobj["delivery_starts"];
                       document.getElementById("rend1").value=singleobj["delivery_ends"];
                       document.getElementById("rcharge1").value=singleobj["delivery_charges"];
                       document.getElementById("img").src=singleobj["photo_wide"];
                       document.getElementById("img1").src=singleobj["photo_square"];
                      // document.getElementById("rcover").value=singleobj["photo_wide"];
                      // document.getElementById("rprofile").value=singleobj["photo_square"];
                       
                       oldInfoCuisine();  
                       
                    }
                };
                xhttp.open("GET","./Old_Info_Servlet",true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send();
            }
          
          </script>       

    </head>
    <body  onload="getCuisine()" >
        <jsp:include page="Restaurant_Home_Page_Header.jsp" />
        <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h4 style="font-family: 'Barrio', cursive;">Edit Profile</h4>
                 <!--   <a href="#"></a>
                    <a class="active" href="table.html"></a>-->
                </div>
            </div>
        </section>
         
         <br>
         <br>
        
        <div class="container">
         
            <hr>
            
            <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form2" method="post" enctype="multipart/form-data">
                        
                        <div class="form-group form-row">
                            <label for="city1" class="col-sm-3">City</label>
                            <select  name="city1" id="city1" onchange="" class="form-control col-sm-9">
                                <option>Amritsar</option>
                                <option>TarnTaran</option>
                                <option>Jalandhar</option>
                                <option>Ludhiana</option>
                            </select>
                           
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rname1" class="col-sm-3">Restaurant Name</label>
                            <input type="text" name="rname1" id="rname1" value="" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rdesc1" class="col-sm-3">Description</label>
                            <textarea type="text" name="rdesc1" id="rdesc1" class="form-control col-sm-9" > </textarea>
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="remail1" class="col-sm-3">Email ID</label>
                            <input type="text" name="remail1" id="remail1" class="form-control col-sm-9" readonly /> 
                        </div>
                       
                        
                         <div class="form-group form-row">
                            <label for="raddr1" class="col-sm-3">Address</label>
                            <input type="text" name="raddr1" id="raddr1" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rmob1" class="col-sm-3">Mobile Number</label>
                            <input type="text" name="rmob1" id="rmob1" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rcover1" class="col-sm-3">Cover Photo</label>
                            <input type="file"  id="rcover1" name="rcover1" accept="image/*" onchange="readandpreview(this, 'img')" class="form-control col-sm-9" /> 
                       <img src="" width="300" height="150" id="img" class="offset-3">
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rprofile1" class="col-sm-3">Profile Photo</label>
                            <input type="file"  id="rprofile1" name="rprofile1" accept="image/*" onchange="readandpreview1(this, 'img1')" class="form-control col-sm-9" /> 
                       <img src="" width="150" height="150" id="img1" class="offset-3">
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="rloc1" class="col-sm-3">Location</label>
                            <input type="text" name="rloc1" id="rloc1" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="rmin1" class="col-sm-3">Minimum order for Delivery</label>
                            <input type="text" name="rmin1" id="rmin1" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rstart1" class="col-sm-3">Delivery Start Time</label>
                            <input type="time" name="rstart1" id="rstart1" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rend1" class="col-sm-3">Delivery end Time</label>
                            <input type="time" name="rend1" id="rend1" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="rcharge1" class="col-sm-3">Delivery Charges</label>
                            <input type="text" name="rcharge1" id="rcharge1" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="cuisine11"  class="col-sm-3">Cuisine</label>
                            <label id="cuisine11" name="cuisine11"></label>
                        </div>
                        
                        
                        
                    </form>
                    
                     <div class="form-group form-row">
                         <br>
                            <input type="button" value="Edit Profile" class="btn-outline-primary btn-lg col-sm-12" onclick="check()" />
                        </div>
                
                </div>
            </div>
            <div id="error" style="color:red"><label id="l11" class="offset-3"></label></div>
             <div id="error1" style="color:red"><label id="l21" class="offset-3"></label></div>
            
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
