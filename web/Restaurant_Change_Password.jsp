<%-- 
    Document   : Restaurant_Change_Password
    Created on : 1 May, 2020, 3:35:31 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>RESTAURANT CHANGE PASSWORD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    
        <script>
          function restaurantChangePassword()
             {
                   
                $('#myModal13').modal('show');    
             }
             
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
                             window.location.href="Restaurant_Login.jsp";
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

    </head>
    <body onload="restaurantChangePassword()">
         <jsp:include page="Restaurant_Home_Page_Header.jsp" />
         <br>
         <br>
      <!--   <a href="#myModal1" data-toggle="modal">Show</a>-->
        
                         <div id="myModal13" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <center> <h4 class="modal-title">Change Password</h4></Center>
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
                    
                    <div class="form-group form-row">
                            <input type="button" value="Change Password" class="btn-primary btn-lg col-sm-9 offset-3" onclick="restaurantChangePassword1()" />
                        </div>
                         <div id="error" style="color:red"><label id="l1" class="offset-3"></label></div>
                
                </div>
            </div>
                                  
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                                
                            </div>

                        </div>
                    </div> 
                        
                  
        
    </body>
</html>
