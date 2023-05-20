<%-- 
    Document   : Restaurant_Add_Food_Item
    Created on : 5 May, 2020, 3:20:30 PM
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
       
            function check2()
            {
                
               
                //var category =document.getElementById("category2").value;
                var iname1=document.getElementById("iname1").value;
             //   var remail=document.getElementById("remail").value;
           //     var rpass=document.getElementById("rpass").value;
            //    var rpass1=document.getElementById("rpass1").value;
                var idesc1=document.getElementById("idesc1").value;
               var price1=document.getElementById("price1").value;
                var offerprice1=document.getElementById("offerprice1").value;
             //   var rprofile=document.getElementById("rprofile").value;
               // var rloc=document.getElementById("rloc").value;
               // var rmin=document.getElementById("rmin").value;
               // var rstart=document.getElementById("rstart").value;
               // var rend=document.getElementById("rend").value;
               // var rcharge=document.getElementById("rcharge").value;
               
             // alert("rcover="+rcover);
                
                if( iname=="" || idesc=="" || price=="" || offerprice=="")
            {
                 document.getElementById("error1").style.color="red";
                document.getElementById("l2").innerHTML="All Field are necessary!!!";
                
            }
            else
            {
                editFoodItem2();
            }
           
            }
          
             function check()
            {
                
               
                var category =document.getElementById("category2").value;
                var iname=document.getElementById("iname").value;
             //   var remail=document.getElementById("remail").value;
           //     var rpass=document.getElementById("rpass").value;
            //    var rpass1=document.getElementById("rpass1").value;
                var idesc=document.getElementById("idesc").value;
               var price=document.getElementById("price").value;
                var offerprice=document.getElementById("offerprice").value;
             //   var rprofile=document.getElementById("rprofile").value;
               // var rloc=document.getElementById("rloc").value;
               // var rmin=document.getElementById("rmin").value;
               // var rstart=document.getElementById("rstart").value;
               // var rend=document.getElementById("rend").value;
               // var rcharge=document.getElementById("rcharge").value;
               
             // alert("rcover="+rcover);
                
                if(category=="" || iname=="" || idesc=="" || price=="" || offerprice=="")
            {
                 document.getElementById("error").style.color="red";
                document.getElementById("l1").innerHTML="All Field are necessary!!!";
                
            }
            else
            {
                addItem();
            }
           
            }
            
            
            function addItem()
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
                          //  alert("result="+r);
                         if(r=="duplicate")
                        {
                           alert("A duplicate already exist");  
                        }
                        else if(r=="success")
                        {
                           alert("Food Item Added");
                           document.getElementById("form2").reset();
                           getFoodItemList();
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Restaurant_Add_Item_Servlet", true);
                    
                 //   alert("Sending Request to Server");
                   // alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }
            }
            
            function getCategoryList()
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
                        ans=ans+"<select style=\"width: 200px;\" name=\"category\" id=\"category\"  class=\"form-control col-sm-9\">";
                        
                        var r=xhttp.responseText.trim();
                        //alert(r);
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
                   
                    document.getElementById("category2").innerHTML=ans;
                    getFoodItemList();
              
                    }
                };
                xhttp.open("GET","./Get_Category_List_Servlet",true);
             
                // Step 2
               // true --> async request
                
                // Step 3
                xhttp.send();  
            }
            
            var arr;
            function getFoodItemList()
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
                            ans=ans+"<table class=\"table table-striped table-bordered\">";
                             ans=ans+"<thead class=\"bg-dark text-white\">";
                             ans=ans+"<tr>";
                                ans=ans+"<th>Serial No.</th>";
                               ans=ans+"<th>Item Name </th>";
                                ans=ans+"<th> Description </th>";
                                ans=ans+"<th> Price</th>";
                                ans=ans+"<th> Offer Photo </th>";
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
                        ans=ans+"<td>"+singleobj["item_name"]+"</td>";
                         ans=ans+"<td>"+singleobj["description"]+"</td>";
                         ans=ans+"<td>"+singleobj["price"]+"</td>";
                         ans=ans+"<td>"+singleobj["offer_price"]+"</td>";
                          ans = ans+"<td>"+"<img src=\""+ singleobj["photo"] +"\" width='100' height='100' />"+"</td>";
                         //  ans = ans+"<td>"+"<img src=\""+ singleobj["photo_profile"] +"\" width='100' height='100' />"+"</td>";
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Edit\" class=\"btn-primary\" onclick=\"editFoodItem("+i+")\"/>"+"</td>";
                        ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" class=\"btn-danger\" onclick=\"deleteFoodItem("+singleobj["food_item_id"]+")\"/>"+"</td>";
                          ans=ans+"</tr>";
                        
                    }
                    ans=ans+"</tbody>";
                    ans=ans+"</table>";
                    document.getElementById("d2").innerHTML=ans;
                 
                    }
                    };
                    
                    xhr.open("GET", "./Get_Food_Item_Servlet", true);
                    
                  //  alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
            }
            
           function deleteFoodItem(index)
           {
              var w= confirm("Are you sure you want to delete this food Item?");
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
                            alert("Food Item not Deleted");
                        }
                          
                        else if(r=="success")
                        {
                            alert("Food Item Deleted");
                            getFoodItemList();
                        }
                    }
                    };
                    
                    
                    xhr.open("GET", "./Food_Item_Delete_Servlet?index="+index, true);
                    
                    //alert("Sending Request to Server");
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send();
                }
           }
           
          
           
           function editFoodItem(index)
             {
                   
                 $('#myModal1').modal('show');
                   var singleobj=arr[index];
                   document.getElementById("category1").value=singleobj["food_item_id"];
                 document.getElementById("iname1").value=singleobj["item_name"];
                 document.getElementById("idesc1").value=arr[index].description;
                 document.getElementById("price1").value=arr[index].price;
                 document.getElementById("offerprice1").value=arr[index].offer_price;
                 document.getElementById("img1").src=arr[index].photo;
             //  var singleobj=arr[index];
            //     cid=singleobj["cuisine_id"];
                 
             }
             
             function editFoodItem2()
             {
                  var ans = "";
                var formdata = new FormData();
                
                var controls = document.getElementById("form1").elements;
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
                      /*  else
                        {
                            flag = 2;
                        }*/
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
//            /*   else if (flag == 2)
//                {
//                    alert("CHECK: --> Select Files for file controls");
//                } */
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
                         if(r=="fail")
                        {
                           alert("A duplicate already exist");  
                        }
                        else if(r=="success")
                        {
                           alert("Food Item Edited");
                           document.getElementById("form1").reset();
                           getFoodItemList();
                           $('#myModal1').modal('hide');
                        }
                    }
                    };
                    
                    xhr.open("POST", "./Restaurant_Edit_Item_Servlet", true);
                    
                   // alert("Sending Request to Server");
                   // alert(formdata);
                    
                    //console.log(formdata);
                    
                    // ALso send FORM-Data with AJAX REQUEST
                    xhr.send(formdata);
                }     
        }
            
          </script>       

    </head>
    <body onload="getCategoryList()">
        <jsp:include page="Restaurant_Home_Page_Header.jsp" />
        <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h4 style="font-family: 'Barrio', cursive;">Manage Food Items</h4>
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
                        <center> <h1 class="h1" style="font-family: 'Bungee Shade', cursive;">Add Food Item</h1></center>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form2" method="post" enctype="multipart/form-data">
                        
                        <div class="form-group">
                            <label for="category2"  class="col-sm-3"> Select Category</label>
                            <label id="category2" name="category2"></label>
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="iname" class="col-sm-3">Item Name</label>
                            <input type="text" name="iname" id="iname" class="form-control col-sm-9" /> 
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="idesc" class="col-sm-3">Description</label>
                            <textarea type="text" name="idesc" id="idesc" class="form-control col-sm-9" > </textarea>
                        </div>
                        
                      
                        <div class="form-group form-row">
                            <label for="iphoto" class="col-sm-3">Photo</label>
                            <input type="file"  id="iphoto" name="iphoto" accept="image/*" onchange="readandpreview(this, 'img')" class="form-control col-sm-9" /> 
                       <img src="" width="200" height="170" id="img" class="offset-3">
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="price" class="col-sm-3">Price</label>
                            <input type="text" name="price" id="price" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="offerprice" class="col-sm-3">Offer Price</label>
                            <input type="text" name="offerprice" id="offerprice" class="form-control col-sm-9" /> 
                        </div>
                        
                    
                    </form>
                    
                     <div class="form-group form-row">
                            <input type="button" value="Add" class="btn-primary btn-lg col-sm-12" onclick="check()" />
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
                        <center> <h1 class="h1" style="font-family: 'Bungee Shade', cursive;"> Food Item List</h1></center>
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
                  
           <div id="myModal1" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit Food Item</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <div class="modal-body">
                                   
                                     <div class="row">
                <div class="col-sm-12">
                
                    
                    <form id="form1" method="post" enctype="multipart/form-data">
                        
                         <div class="form-group form-row">
                            <label for="category1" class="col-sm-3">Item Id</label>
                            <input type="text" name="category1" id="category1" class="form-control col-sm-9"  readonly/>
                        </div>
                        
                        <div class="form-group form-row">
                            <label for="iname1" class="col-sm-3">Item Name</label>
                            <input type="text" name="iname1" id="iname1" class="form-control col-sm-9" />
                        </div>
                        
                        <div class="form-group form-row" >
                            <label for="idesc1" class="col-sm-3">Description</label>
                            <textarea name="idesc1"  id="idesc1" class="form-control col-sm-9" /> </textarea>
                        </div>
                        
                           <div class="form-group form-row">
                            <label for="iphoto1" class="col-sm-3">Photo</label>
                            <input type="file"  id="iphoto1" name="iphoto1" accept="image/*" onchange="readandpreview1(this, 'img1')" class="form-control col-sm-9" /> 
                       <img src="" width="200" height="170" id="img1" class="offset-3">
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="price1" class="col-sm-3">Price</label>
                            <input type="text" name="price1" id="price1" class="form-control col-sm-9" /> 
                        </div>
                        
                         <div class="form-group form-row">
                            <label for="offerprice1" class="col-sm-3">Offer Price</label>
                            <input type="text" name="offerprice1" id="offerprice1" class="form-control col-sm-9" /> 
                        </div>
                       
                    </form>
                    
                    <div class="form-group form-row">
                            <input type="button" value="Edit" class="btn-primary btn-lg col-sm-12" onclick="check2()" />
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
