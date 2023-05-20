<%-- 
    Document   : Restaurant_Login
    Created on : 30 Apr, 2020, 5:20:53 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>RESTAURANT LOGIN</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script>
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
        </script>   

    </head>
    <body>
     
        <div class="container">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="jumbotron"> 
                        <center> <h1 class="h1"> Restaurant Login</h1></center>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <div class="row">
                <div class="col-sm-12">
                
                    
                    <form>
                        
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
                    
                
                </div>
            </div>
            <div>
            <div id="d1" style="color:red"><label id="l1" class="offset-3"></label></div>
            <div class="row">
                <div class="col-sm-12">
                    <div id="d2"  class="offset-3"><a href="">Forgot Password</a></div>
                            
                    <div id="d2" class="offset-3"><a href="Restaurant_Signup.jsp">Don't have an Account</a></div>
               
            </div>
                
            </div>
        </div>
        
    </body>
</html>
