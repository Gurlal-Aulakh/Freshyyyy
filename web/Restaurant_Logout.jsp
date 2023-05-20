
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
                <script>
            function restaurantLogout()
            {
                var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                           // alert(r);
                          
                        if(r=="success")
                        {
                           window.location.href="Public_Index.jsp"; 
                        }
                    }
                    };
                    
                    xhr.open("GET", "./Restaurant_Logout_Servlet", true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
            }
            </script>   

    </head>
    <body onload="restaurantLogout()">
     
    </body>
</html>
