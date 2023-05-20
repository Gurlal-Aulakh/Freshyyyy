
       <script>
          
             
             function restaurantChangePassword1()
             {
           //   var u=document.getElementById("username").value;
            var op=document.getElementById("oldpassword").value;
            var np=document.getElementById("newpassword").value;
            var cp=document.getElementById("confirmpassword").value;
            if( op=="" || np=="" || cp=="")
            {
                 document.getElementById("error").style.color="red";
                document.getElementById("l1").innerHTML="All Field are necessary!!!";
            }
            else
            {
                if((np!=cp))
                {
                    document.getElementById("error").style.color="red";
                    document.getElementById("l1").innerHTML="Confirm Password and New Password must be same";
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
                xhttp.open("GET","./Restaurant_Change_Password_Servlet?op="+op+"&np="+np,true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
              
             }
         }
         
             }
             
        </script> 
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
                            <a class="event_btn" href="event.html"><i class="fa fa-calendar" aria-hidden="true"></i>Book an Event</a>
                      -->  </div>
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
                            <li class="active"><a href="Restaurant_Home_Page.jsp">Home</a></li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Manage Account <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#myModal13" data-toggle="modal">Change Password</a></li>
                                    <li><a href="Restaurant_Edit_Profile.jsp">Edit account</a></li>
                                </ul>
                            </li>
                            <li class="dropdown submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Manage Food Category<i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="Restaurant_Manage_Food_Category.jsp">Add Food Category</a></li>
                                    <li><a href="Restaurant_Add_Food_Item.jsp">Add Food Item</a></li>
                                </ul>
                            </li>
                            <li><a href="Restaurant_View_Orders.jsp">View Orders</a></li>
                            <li><a href="Restaurant_View_Sales.jsp">View Sales</a></li>
                            
                           <!--   <li><a href="About.jsp">About Us</a></li>
                              <li><a href="Contact.jsp">Contact Us</a></li>-->
                            <li class="active"><a href="Restaurant_Logout.jsp">Logout</a></li>
                         <!--     <li class="active"><a href="Place_Order.jsp">Place Order</a></li>
                         <li><a href="gallery.html">Gallery</a></li>
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
                            <li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li> 
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </header>
        
         <div id="myModal13" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <center> <h2 class="modal-title" style="font-family: 'Monofett', cursive;">Change Password</h2></Center>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
             <div class="row">
                <div class="col-sm-12">
                
                    
                    <form>
                        
                        <div class="form-group form-row">
                            <label for="remail" class="col-sm-3">Email</label>
                            <input type="text" name="remail" id="remail" class="form-control col-sm-9" value="<%= session.getAttribute("email").toString()%>"  readonly/>
                        </div>
                        
                          <div class="form-group form-row">
                            <label for=" oldpassword" class="col-sm-3">Old Password</label>
                            <input type="password" name="oldpassword" id="oldpassword" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="newpassword" class="col-sm-3">New Password</label>
                            <input type="password" name="newpassword" id="newpassword" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="confirmpassword" class="col-sm-3">Confirm Password</label>
                            <input type="password" name="confirmpassword" id="confirmpassword" class="form-control col-sm-9" /> 
                        </div>
                        
                    </form>
                   
                </div>
                </div>
                        <br>
                        <div class="form-group form-row">
                            <input type="button" value="Change Password" class="btn-outline-primary btn-lg col-sm-12" onclick="restaurantChangePassword1()" />
                        </div>
                         <div id="error" style="color:red"><label id="l1" class="offset-3"></label></div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div>
     
