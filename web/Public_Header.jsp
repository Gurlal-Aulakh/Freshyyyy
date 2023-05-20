<%-- 
    Document   : Public_Header
    Created on : 6 May, 2020, 3:23:07 PM
    Author     : HP
--%>

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


   <nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
    
    <a class="navbar-brand" href="#">Freshyyyy</a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      
      <li class="nav-item">
          <a class="nav-link" href="#">Home</a>
      </li>
      
      <li class="nav-item">
          <a class="nav-link" href="#">Place Order</a>
      </li>
    
      <!-- Dropdown -->
   <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
     Customer
     
      </a>
      <div class="dropdown-menu">
     <a class="dropdown-item" href="#myModal3" data-toggle="modal">Login</a>
     <a class="dropdown-item" href="Customer_Signup.jsp">Sign Up</a>
     
      </div>
    </li>
    
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
     Restaurant
     
      </a>
      <div class="dropdown-menu">
     <a class="dropdown-item" href="#myModal6" data-toggle="modal" >Login</a>
     <a class="dropdown-item" href="#">Sign Up</a>
      </div>
    </li>
    
      <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
      </li>
     
      
    </ul>
  </div>  
  
  </nav>


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

  

