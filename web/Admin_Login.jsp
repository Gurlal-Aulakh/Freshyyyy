<%-- 
    Document   : Admin_Login
    Created on : 25 Apr, 2020, 3:30:31 PM
    Author     : HP
--%>

<!DOCTYPE html>

<html>
    <head>
        <title>ADMIN LOGIN</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
          <script src="js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        
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
        function checkAdmin()
        {
            var u=document.getElementById("username").value;
            var p=document.getElementById("password").value;
            if(u=="" || p=="" || u==null || p==null)
            {
                 document.getElementById("error").style.color="red";
                document.getElementById("l1").innerHTML="please add username and password";
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
                        //document.getElementById("l2").innerHTML=r;
                        if(r=="success")
                        {
                            document.getElementById("error").style.color="green";
                            document.getElementById("l1").innerHTML="Login succesful";
                            window.location.href="Admin_Home_Page.jsp";
                        }
                        
                         else if(r=="Password Incorrect")
                        {
                            document.getElementById("error").style.color="red";
                            document.getElementById("l1").innerHTML="Password Incorrect";
                        }
                         else if(r=="This Username does not Exist")
                        {
                            document.getElementById("error").style.color="red";
                            document.getElementById("l1").innerHTML="This Username does not Exist";
                        }
                    }
                };
                xhttp.open("GET","./Admin_Login_Servlet?u="+u+"&p="+p,true);
               
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
              
             }
        }
        </script>   

    </head>
    <body>
        <a href="Admin_Login.jsp"></a>
        <div class="container">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="jumbotron"> 
                        <center> <h1 style="font-family: 'Bungee Shade', cursive;">Admin Login</h1></center>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <div class="row">
                <div class="col-sm-12">
                
                    
                    <form>
                        
                        <div class="form-group">
                          <strong>  <label for="username" class="col-sm-3">Username</label></strong>
                            <input type="text" name="username" id="username" class="form-control col-sm-12" />
                        </div>
                        
                        <div class="form-group">
                            <strong>   <label for="password" class="col-sm-3" style="">Password</label></strong>
                            <input type="password" name="password" id="password" class="form-control col-sm-12" /> 
                        </div>
                        
                        <div class="form-group">
                            <input type="button" value="Login" class="btn-outline-primary btn-lg col-sm-12" onclick="checkAdmin()" />
                        </div>
                        
                    </form>
                    
                
                </div>
            </div>
            <div id="error" style="color:red"><label id="l1"></label></div>
            <div id="error1" style="color:red"><label id="l2" ></label></div>
        </div>
        
    </body>
</html>
