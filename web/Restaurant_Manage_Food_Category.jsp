<%-- 
    Document   : Restaurant_Manage_Food_Category
    Created on : 2 May, 2020, 3:56:18 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
       <!-- <title>ADMIN CHANGE PASSWORD</title>
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
            
           
            function check()
            {
                
               
                var cuisine =document.getElementById("cuisine2").value;
                var cname=document.getElementById("cname").value;
             //   var remail=document.getElementById("remail").value;
           //     var rpass=document.getElementById("rpass").value;
            //    var rpass1=document.getElementById("rpass1").value;
                var cdesc=document.getElementById("cdesc").value;
            //    var rmob=document.getElementById("rmob").value;
              //  var rcover=document.getElementById("rcover").value;
             //   var rprofile=document.getElementById("rprofile").value;
               // var rloc=document.getElementById("rloc").value;
               // var rmin=document.getElementById("rmin").value;
               // var rstart=document.getElementById("rstart").value;
               // var rend=document.getElementById("rend").value;
               // var rcharge=document.getElementById("rcharge").value;
               
             // alert("rcover="+rcover);
                
                if(cuisine=="" || cname=="" || cdesc=="")
            {
                 document.getElementById("error").style.color="red";
                document.getElementById("l1").innerHTML="All Field are necessary!!!";
                
            }
            else
            {
                addCategory();
            }
           
            }
          
            
            
            function addCategory()
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
                   // else if(controls[i].type=="checkbox"){
                   //     if(controls[i].checked==true){
                  //          cids+=controls[i].name+",";
                   //     }
                   // }
                    else    // if not file, text control
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
              //  formdata.append("cids",cids);
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
                           alert("A duplicate already exist");  
                        }
                        else if(r=="success")
                        {
                           alert("Food Category Updated");
                           document.getElementById("form2").reset();
                           getFoodCategoryList();
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Restaurant_Manage_Food_Category_Servlet", true);
                    
                    //alert("Sending Request to Server");
                   // alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }
            }
            
            function getCuisineList()
            {
              var xhttp = new XMLHttpRequest();
               
               // Step 4 
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        var ans="";
                        ans=ans+"<select style=\"width: 200px;\" name=\"cuisine\" id=\"cuisine\"  class=\"form-control col-sm-9\">";
                        
                        var r=xhttp.responseText.trim();
                       // alert(r);
                        var x=0;
                        var parts=r.split(",");
                        for(var i=0;i<parts.length-1;i+2)
                        {
                            var s=parts[i];
                            i++;
                            var id=parts[i];
                            if(i%2!=0)
                            {
                            ans=ans+"<option value=\""+id+"\">"+s+"</option>";
                             }
                            
                        }
                     
                    ans=ans+"</select>";
                   
                    document.getElementById("cuisine2").innerHTML=ans;
                    getFoodCategoryList();
                       
                   
                    }
                };
                xhttp.open("GET","./Get_Cuisine_List_Servlet",true);
             
                // Step 2
               // true --> async request
                
                // Step 3
                xhttp.send();  
            }
            
            var arr;
            function getFoodCategoryList()
            {
                // Send AJAX Request to send FORMDATA (text + files) to Server
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            
                            var mainobj=JSON.parse(r);
                             arr=mainobj.ans;
                             var ans="";
                            ans=ans+"<table class=\"table table-hover table-bordered\">";
                             ans=ans+"<thead class=\"bg-dark text-white\">";
                             ans=ans+"<tr>";
                                ans=ans+"<th>Serial No.</th>";
                               ans=ans+"<th>Category Name </th>";
                                ans=ans+"<th> Description </th>";
                                ans=ans+"<th> Cover Photo</th>";
                                ans=ans+"<th> Profile Photo </th>";  
                                ans=ans+"<th> Delete </th>";
                           ans=ans+"</tr>";
                      ans=ans+"</thead>";
                        
                       ans=ans+"<tbody>";
                    for(var i=0,j=1;i<arr.length;i++,j++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        ans=ans+"<td>"+j+"</td>";
                        ans=ans+"<td>"+singleobj["category_name"]+"</td>";
                         ans=ans+"<td>"+singleobj["description"]+"</td>";
                          ans = ans+"<td>"+"<img src=\""+ singleobj["photo_cover"] +"\" width='200' height='100' />"+"</td>";
                           ans = ans+"<td>"+"<img src=\""+ singleobj["photo_profile"] +"\" width='100' height='100' />"+"</td>";
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" class=\"btn-danger\" onclick=\"deleteFoodCategory("+singleobj["restaurant_category_id"]+")\"/>"+"</td>";
                        ans=ans+"</tr>";
                    }
                    ans=ans+"</tbody>";
                    ans=ans+"</table>";
                    document.getElementById("d2").innerHTML=ans;
                    
                    
                    }
                    };
                    
                    xhr.open("GET", "./Get_Food_Category_Servlet", true);
                    
                  //  alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
            }
            
           function deleteFoodCategory(index)
           {
              var w= confirm("Are you sure you want to delete this food Category?");
               // Send AJAX Request to send FORMDATA (text + files) to Server
                    if(w==true)
                    {
                    var xhr = new XMLHttpRequest;
                    
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var r = xhr.responseText.trim();
                            //alert(r);
                              if(r=="fail")
                        {
                            alert("Food Category not Deleted");
                        }
                          
                        else if(r=="success")
                        {
                            alert("Food Category Deleted");
                            getFoodCategoryList();
                        }
                    }
                    };
                    
                    
                    xhr.open("GET", "./Food_Category_Delete_Servlet?index="+index, true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                }
           }
            
          </script>       

    </head>
    <body onload="getCuisineList()" >
        <jsp:include page="Restaurant_Home_Page_Header.jsp" />
         <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h4 style="font-family: 'Barrio', cursive;">Manage Food</h4>
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
                  <div class="jumbotron">
                    <center> <h1 style="font-family: 'Bungee Shade', cursive;">Add Food Categories</h1></center>
                  </div>
                </div>
            </div>
            
            <hr>
            
            <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form2" method="post" enctype="multipart/form-data">
                        
                        <div class="form-group form-row">
                            <label for="cuisine2"  class="col-sm-3"> Select Cuisine</label>
                            <label id="cuisine2" name="cuisine2"></label>
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="cname" class="col-sm-3">Category Name</label>
                            <input type="text" name="cname" id="cname" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="cdesc" class="col-sm-3">Description</label>
                            <textarea type="text" name="cdesc" id="cdesc" class="form-control col-sm-9" > </textarea>
                        </div>
                        
                      
                        <div class="form-group form-row">
                            <label for="ccover" class="col-sm-3">Cover Photo</label>
                            <input type="file"  id="ccover" name="ccover" accept="image/*" onchange="readandpreview(this, 'img')" class="form-control col-sm-9" /> 
                       <img src="" width="200" height="170" id="img" class="offset-3">
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="cprofile" class="col-sm-3">Profile Photo</label>
                            <input type="file"  id="cprofile" name="cprofile" accept="image/*" onchange="readandpreview1(this, 'img1')" class="form-control col-sm-9" /> 
                       <img src="" width="150" height="150" id="img1" class="offset-3">
                        </div>
                        
                       
                     
                        
                    </form>
                    
                     <div class="form-group form-row">
                         <br>
                            <input type="button" value="Add Category" class="btn-outline-primary btn-lg col-sm-12" onclick="check()" />
                        </div>
                
                </div>
            </div>
            <div id="error" style="color:red"><label id="l1" class="offset-3"></label></div>
            </div>
            <br>
            <br>
            <br>
            
             <div class="container">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="jumbotron"> 
                        <center> <h1 style="font-family: 'Bungee Shade', cursive;">Food Categories List</h1></center>
                    </div>
                </div>
            </div>
              <div class="row">
                
                <div class="col-sm-12">
                    <div id="d2">
                
                    </div>
                </div>
                  
              </div>
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
