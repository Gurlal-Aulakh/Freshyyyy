 <%-- 
    Document   : Admin_Manage_Cuisine
    Created on : 27 Apr, 2020, 4:28:37 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
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
            
        function addCuisine()
         {
                var ans = "";
                var formdata = new FormData();
                
                var controls = document.getElementById("form1").elements;
                var flag = 0;
                
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
                    else    // if not file, text control
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
                
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
                            
                             if(r=="fail")
                        {
                           document.getElementById("error").style.color="red";
                           document.getElementById("l1").innerHTML="This Cuisine already Exists";  
                        }
                        else if(r=="success")
                        {
                             document.getElementById("error").style.color="green";
                             document.getElementById("l1").innerHTML="Cuisine added"; 
                             showCuisine();
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Admin_Manage_Cuisine_Servlet", true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }
            }
            var arr;
             function showCuisine()
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
                   ans=ans+"<table class=\"table table-hover table-bordered\">";
                   ans=ans+"<thead class=\"bg-dark text-white\">";
                            ans=ans+"<tr>";
                                ans=ans+"<th>"+"Id"+"</th>";
                               ans=ans+"<th> Cuisine Name </th>";
                                ans=ans+"<th> Cuisine Description </th>";
                                ans=ans+"<th> Photo </th>";
                                ans=ans+"<th> Edit </th>";
                                ans=ans+"<th> Delete </th>";
                           ans=ans+"</tr>";
                      ans=ans+"</thead>";
                        
                       ans=ans+"<tbody>";
                    for(var i=0,j=1;i<arr.length;i++,j++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        ans=ans+"<td>"+j+"</td>";
                        ans=ans+"<td>"+singleobj["cuisine_name"]+"</td>";
                          ans=ans+"<td>"+singleobj["description"]+"</td>";
                          ans = ans+"<td>"+"<img src=\""+ singleobj["photo"] +"\" width=100 height=100 /><br>"+"<input type=\"button\" value=\"Change\" class=\"btn-primary\" onclick=\"changeCuisinePhoto("+i+")\"/>"+"</td>";
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Edit\" class=\"btn-success\" onclick=\"editCuisine("+i+")\"/>"+"</td>"; 
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" class=\"btn-danger\" onclick=\" deleteCuisine("+singleobj["cuisine_id"]+") \" />"+"</td>";
                        ans=ans+"</tr>";
                    }
                    ans=ans+"</tbody>"
                    ans=ans+"</table>";
                    document.getElementById("d1").innerHTML=ans;
                       
                       
                    }
                };
                xhttp.open("GET","./Show_Cuisine_Servlet",true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send();
              
             }
             
             function deleteCuisine(id)
             {
                 
                 var result=confirm("Are you sure you want to delete?");
                 if(result)
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
                        if(r=="success")
                        {
                            showCuisine();
                            alert("Cuisine Deleted");
                        }
                        else if(r=="fail")
                        {
                            alert("Cuisine not Deleted");
                            showCuisine(); 
                        }
                   
                       
                       
                    }
                };
                xhttp.open("GET","./Admin_Delete_Cuisine_Servlet?id="+id,true);
             
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send();
                 }
             }
             var cid;
             function editCuisine(index)
             {
                   
                 $('#myModal1').modal('show');
                 document.getElementById("cname").value=arr[index].cuisine_name;
                 document.getElementById("cdesc").value=arr[index].description;
             // document.getElementById("cname").value=singleobj["cuisine_name"];
                 var singleobj=arr[index];
                 cid=singleobj["cuisine_id"];
                 
             }
             function editCuisine2()
             {   
                  var result=confirm("Are you sure you want to edit?");
                   var name=document.getElementById("cname").value;
                   var desc=document.getElementById("cdesc").value;
                 if(result)
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
                        if(r=="success")
                        {
                            showCuisine();
                            alert("Cuisine Edited");
                            $('#myModal1').modal('hide');
                        }
                        else if(r=="fail")
                        {
                            alert("Cuisine not DEdited");
                            showCuisine(); 
                        }
                   
                       
                       
                    }
                };
                xhttp.open("GET","./Admin_Edit_Cuisine_Servlet?cid="+cid+"&cname="+name+"&cdesc="+desc,true);
             
                // Step 2
                    // true --> async request
               // alert("sending to edit servlet");
                // Step 3
                xhttp.send();
                 }
             }
            
            function changeCuisinePhoto(index)
            {
                 $('#myModal2').modal('show');
                 document.getElementById("cid1").value=arr[index].cuisine_id;
                 document.getElementById("cname1").value=arr[index].cuisine_name;
                 document.getElementById("img1").src=arr[index].photo;
             // document.getElementById("cname").value=singleobj["cuisine_name"];
                 var singleobj=arr[index];
                 cid=singleobj["cuisine_id"];
            }
            
            function changeCuisinePhoto1()
            {
               // alert("change photo");
                var ans = "";
                var formdata = new FormData();
                
                var controls = document.getElementById("form2").elements;
                var flag = 0;
                
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
                    else    // if not file, text control
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
                
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
                           // alert(r);
                             if(r=="fail")
                        {
                          alert("Photo not Changed");
                          showCuisine();
                        }
                        else if(r=="success")
                        {
                             alert("Photo changed");
                             showCuisine();
                             $('#myModal2').modal('hide');
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Admin_Change_Cuisine_Photo_Servlet", true);
                    
                   // alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }
            }
       
        </script>   

    </head>
    <body onload="showCuisine()">
        <jsp:include page="Admin_Home_Page_Header.jsp" />
        <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Manage Cuisine</h1>
                 <!--   <a href="#"></a>
                    <a class="active" href="table.html"></a>-->
                </div>
            </div>
        </section>
        
        <div class="container">
           
            
            <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form1" method="post" enctype="multipart/form-data">
                        
                        <div class="form-group form-row">
                            <label for="cuisine" class="col-sm-3">Cuisine Name</label>
                            <input type="text" name="cuisine" id="cuisine" class="form-control col-sm-9" />
                        </div>
                        
                        <div class="form-group form-row" >
                            <label for="description" class="col-sm-3">Description</label>
                            <textarea name="description" height= id="description" class="form-control col-sm-9" /> </textarea>
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="photo" class="col-sm-3">Photo</label>
                            <input type="file"  id="photo" name="photo" accept="image/*" onchange="readandpreview(this, 'img')" class="form-control col-sm-9" /> 
                       <img src="" width="200" height="200" id="img" class="offset-3">
                        </div>
                        
                        
                        
                    </form>
                    
                    <div class="form-group form-row">
                            <input type="button" value="Add Cuisine" class="btn-outline-primary btn-lg col-sm-12" onclick="addCuisine()" />
                        </div>
                
                </div>
            </div>
            <div id="error" style="color:red"><label id="l1" class="offset-3"></label></div>
            <div id="error1" style="color:red"><label id="l2" class="offset-3"></label></div>
        </div>
        <br>
        <hr>
        <br>
         <div class="container">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="jumbotron"> 
                                                <center> <h1 style="font-family: 'Bungee Shade', cursive;">Cuisine List</h1></center>

                    </div>
                </div>
            </div>
              <div class="row">
                
                <div class="col-sm-12">
                    <div id="d1">
                
                    </div>
                </div>
              </div>
         </div>

        
        
        <div id="myModal1" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit Cuisine</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form1" method="post" enctype="multipart/form-data">
                        
                        <div class="form-group form-row">
                            <label for="cname" class="col-sm-3">Cuisine Name</label>
                            <input type="text" name="cname" id="cname" class="form-control col-sm-9" />
                        </div>
                        
                        <div class="form-group form-row" >
                            <label for="cdesc" class="col-sm-3">Description</label>
                            <textarea name="cdesc"  id="cdesc" class="form-control col-sm-9" /> </textarea>
                        </div>
                       
                    </form>
                    
                    <div class="form-group form-row">
                            <input type="button" value="Edit" class="btn-primary btn-lg col-sm-12" onclick="editCuisine2()" />
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
                  
                  <!-- Model Popup Code -->
                    <div id="myModal2" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Change Photo</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                    
                                      <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form2" method="post" enctype="multipart/form-data">
                        
                        <div class="form-group form-row" for="cid1" class="col-sm-3" >
                       <!--     <label for="cid1" class="col-sm-3">Cuisine Id</label>-->
                            <input type="hidden" name="cid1" id="cid1"  />
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="cname1" class="col-sm-3">Cuisine Name</label>
                            <input type="text" name="cname1" id="cname1" class="form-control col-sm-9" readonly="enabled" />
                        </div>
                       
                        
                        <div class="form-group form-row">
                            <label for="photo1" class="col-sm-3">Photo</label>
                            <input type="file"  id="photo1" name="photo1" accept="image/*" onchange="readandpreview1(this, 'img1')" class="form-control col-sm-9" /> 
                       <img src="" width="200" height="200" id="img1" class="offset-3">
                        </div>
                        
                        
                        
                    </form>
                    
                    <div class="form-group form-row">
                            <input type="button" value="Change Photo" class="btn-primary btn-lg col-sm-12" onclick="changeCuisinePhoto1()" />
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

