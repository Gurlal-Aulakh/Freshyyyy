
         <script>                 
        function changePass()
      {
             var op=document.getElementById("oldpassword4").value;
            var np=document.getElementById("newpassword4").value;
            var cp=document.getElementById("confirmpassword4").value;
            if( op=="" || np=="" || cp=="")
            {
                 document.getElementById("d4").style.color="red";
                document.getElementById("l4").innerHTML="All Field are necessary!!!";
            }
            else
            {
                if((np!=cp))
                {
                    document.getElementById("d4").style.color="red";
                    document.getElementById("l4").innerHTML="Confirm Password and New Password must be same";
                }
            else
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
                       // document.getElementById("l2").innerHTML=r;
                        if(r=="fail")
                        {
                          alert("Password entered is incorrect"); 
                        }
                        else if(r=="success")
                        {
                           alert("Password Changed");
                           setInterval(3000);
                           window.location.href="Public_Index.jsp";
                           
                        }
                    }
                };
                xhttp.open("GET","./Customer_Change_Password_Servlet?op="+op+"&np="+np,true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
              
             }
         }
         
    }
    
    function readandpreview5(fileobj, imageid)
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
           
            function check5()
            {
            
               
                var city =document.getElementById("city5").value;
                var email=document.getElementById("email5").value;
                var fullname =document.getElementById("fullname5").value;
            //    var remail=document.getElementById("remail").value;
               // var pass=document.getElementById("pass").value;
               // var pass1=document.getElementById("pass1").value;
                var addr=document.getElementById("addr5").value;
                //var mob=document.getElementById("mob").value;
              //  var rcover=document.getElementById("rcover").src;
              //  var rprofile=document.getElementById("rprofile").src;
                var question=document.getElementById("question5").value;
                var answer=document.getElementById("answer5").value;
               
               
                
                if(city=="" || fullname==""  || addr==""  || question=="" || answer=="")
            {
                 document.getElementById("d5").style.color="red";
                document.getElementById("l5").innerHTML="All Field are necessary!!!";     
            }
            else
            {
               updateProfile();
            }

            }
            
            function updateProfile()
            {
                 var ans = "";
                var formdata = new FormData();
                
                var controls = document.getElementById("form5").elements;
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
                    /*    else
                        {
                            flag = 2;
                        }*/
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
            /*    else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } */
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
                             if(r=="fail")
                        {
                             alert("Profile not Updated");
                        }
                        else if(r=="success")
                        {
                            alert("Profile Updated");
                            document.getElementById("form5").reset();
                            $('#myModal5').modal('hide'); 
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Customer_Update_Servlet", true);
                    
                    alert("Sending Request to Server");
                  //  alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }
            }
            
            function go()
            {
                var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            //alert(r);
                            var mainobj=JSON.parse(r);
                             var arr=mainobj.ans;
                             var singleobj=arr[0];
                             document.getElementById("email5").value=singleobj["email"];
                             document.getElementById("mob5").value=singleobj["mobileno"];
                             document.getElementById("addr5").value=singleobj["address"];
                             document.getElementById("fullname5").value=singleobj["fullname"];
                             document.getElementById("question5").value=singleobj["question"];
                             document.getElementById("answer5").value=singleobj["answer"];
                             document.getElementById("img5").src=singleobj["photo"];
                       
                    }
                    };
                    
                    xhr.open("GET", "./Go_Servlet", true);
                    
                  //  alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
            }
    
 </script>
                           
                           
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
                        <a class="navbar-brand" href="Public_Index.jsp"><img src="img/logo-1.png" alt=""></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="Customer_Home_Page.jsp">Home</a></li>
                            <li class="active"><a href="#myModal5" data-toggle="modal" onclick="go()">Edit profile</a></li>
                            <li class="active"><a href="#myModal4" data-toggle="modal">Change Password</a></li>
                       <!--     <li class="dropdown submenu">
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
                            </li>-->
                            <li><a href="Place_Order.jsp">Place Order</a></li>
                            <li><a href="View_Orders.jsp">View Orders</a></li>
                            <li><a href="Customer_History.jsp">History</a></li>
                           
                          <!--    <li><a href="About.jsp">About Us</a></li>
                              <li><a href="Contact.jsp">Contact Us</a></li>-->
                            <li class="active"><a href="Customer_Logout.jsp">Logout</a></li>
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
                            <li><a href="View_Cart.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li> 
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
       
        
        <div id="myModal4" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Change Password </h1></center>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form4" >
                        
                       <div class="form-group form-row">
                            <label for="email4" class="col-sm-3">Email</label>
                            <input type="text" name="email4" id="remail4" class="form-control col-sm-9" value="<%= session.getAttribute("customeremail").toString()%>"  readonly/>
                        </div>
                        
                          <div class="form-group form-row">
                            <label for=" oldpassword4" class="col-sm-3">Old Password</label>
                            <input type="password" name="oldpassword4" id="oldpassword4" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="newpassword4" class="col-sm-3">New Password</label>
                            <input type="password" name="newpassword4" id="newpassword4" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="confirmpassword4" class="col-sm-3">Confirm Password</label>
                            <input type="password" name="confirmpassword4" id="confirmpassword4" class="form-control col-sm-9" /> 
                        </div>
                        
                    </form>
                    
                   
                
                </div>
                                     </div>
                        <br>
                        <div>
                        
                            <input type="button" value="Change Password" class="btn-outline-primary btn-lg col-sm-12" onclick="changePass()" />
                        </div>
                  
                    <div id="d4" style="color:red"><label id="l4"></label></div>
            </div>
                                  
                             
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>
    
  
                        <br>
<div id="myModal5" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                           <div class="modal-content">
                                
                                <div class="modal-header">
                                    <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Edit Profile </h1></center>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form5" method="post" enctype="multipart/form-data">
                        
                       <div class="form-group form-row">
                            <label for="email5" class="col-sm-3">Email</label>
                            <input type="text" name="email5" id="email5" class="form-control col-sm-9" readonly /> 
                        </div>
                        
                       
                         <div class="form-group form-row">
                            <label for="fullname5" class="col-sm-3">Full Name</label>
                            <input type="text" name="fullname5" id="fullname5" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="mob5" class="col-sm-3">Mobile Number</label>
                            <input type="text" name="mob5" id="mob5" class="form-control col-sm-9" readonly /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="addr5" class="col-sm-3">Address</label>
                            <input type="text" name="addr5" id="addr5" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="city5" class="col-sm-3">City</label>
                            <select  name="city5" id="city5" onchange="" class="form-control col-sm-9">
                                <option>Amritsar</option>
                                <option>TarnTaran</option>
                                <option>Jalandhar</option>
                                <option>Ludhiana</option>
                            </select>
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="photo5" class="col-sm-3">Photo</label>
                            <input type="file"  id="photo5" name="photo5" accept="image/*" onchange="readandpreview5(this, 'img5')" class="form-control col-sm-9" /> 
                       <img src="" width="200" height="170" id="img5" class="offset-3">
                        </div>
                      
              
                         <div class="form-group form-row">
                            <label for="question5" class="col-sm-3">City</label>
                            <select  name="question5" id="question5" onchange="" class="form-control col-sm-9">
                                <option>What is the Name of your First Pet?</option>
                                <option>What is the name of your hometown?</option>
                                <option>What is your Nickname at Home? </option>
                                <option>What is the name of your Favourite Movie?</option>
                    </select>
                           
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="answer5" class="col-sm-3">Security Answer</label>
                            <input type="text" name="answer5" id="answer5" class="form-control col-sm-9" /> 
                        </div>
                        
                    </form>
                    
                   
                
                </div>
            </div>
                                    <br>
                    <div class="form-group form-row">
                    <input type="button" value="Edit" class="btn-outline-primary btn-lg col-sm-12" onclick="check5()" />
                    </div>
                  
                    <div id="d5" style="color:red"><label id="l5" class="offset-3"></label></div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>


    
  

    
  
