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
    <a href="View_Cart.jsp"></a>

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
            
            function deleteItem(index)
            {
               
              var xhttp = new XMLHttpRequest();
                  
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                       // alert(r);
                        
                        if(r=="success")
                        {
                            alert("Food Item Deleted");
                            viewCart();
                            
                        }
                
              
                    }
                };
                xhttp.open("GET","./delete_Cart_Item?i="+index,true);
               
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
  
            }
            
            var subtotal=0;
            var CGST;
            var charge; 
            var total;
            var discount=0;
            var restaurantid;
             
             function viewCart()
             {
                 subtotal=0;
                 CGST=0;
                 charge=0;
                 total=0;
                 discount=0;
                  var xhttp = new XMLHttpRequest();
                  
               // Step 4 
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                       // alert(r);
                       if(r==null)
                       {
                           
                       }
                       else
                       {
                        var mainobj=JSON.parse(r);
                        var arr=mainobj;
                       // alert(arr);
                             var ans="";
                            ans=ans+"<table class=\"table table-striped table-bordered\">";
                             ans=ans+"<thead class=\"bg-dark text-white\">";
                             ans=ans+"<tr>";
                                ans=ans+"<th>Serial No.</th>";
                               ans=ans+"<th>Item Name </th>";
                                ans=ans+"<th> Price </th>";
                                ans=ans+"<th> Quantity </th>";
                                ans=ans+"<th> Amount </th>";  
                                ans=ans+"<th> Delete </th>";
                           ans=ans+"</tr>";
                      ans=ans+"</thead>";
                        
                       ans=ans+"<tbody>";
                       var i=-1;
                    for( i=0,j=1;i<arr.length-1;i++,j++)
                    {
                        ans=ans+"<tr>";
                        var singleobj=arr[i];
                        
                        ans=ans+"<td>"+j+"</td>";
                        ans=ans+"<td>"+singleobj["itemname"]+"</td>";
                         ans=ans+"<td>"+singleobj["offerprice"]+"</td>";
                         ans=ans+"<td> <input type=\"number\" id=\""+singleobj["itemid"]+"\" onchange=\"updateQuantity("+i+","+singleobj["itemid"]+")\" value=\""+singleobj["qty"]+"\"/></td>";
                         ans=ans+"<td>"+singleobj["amt"]+"</td>";
                       //   ans = ans+"<td>"+"<img src=\""+ singleobj["photo_cover"] +"\" width='100' height='100' />"+"</td>";
                       //    ans = ans+"<td>"+"<img src=\""+ singleobj["photo_profile"] +"\" width='100' height='100' />"+"</td>";
                          ans=ans+"<td>"+"<input type=\"button\" value=\"Delete\" class=\"btn-danger\" onclick=\"deleteItem("+i+")\"/>"+"</td>";
                        ans=ans+"</tr>";
                        subtotal+=singleobj["amt"];
                        discount+=singleobj["price"]-singleobj["offerprice"];
                       
                    }
                    
                    
                   var singleobj=arr[i];
                   var min=singleobj["min"];
                   restaurantid=parseInt(singleobj["restaurantid"]);
                   if(subtotal<min)
                   {
                     charge=singleobj["charge"];  
                   }
                   else
                   {
                       charge=0;
                   }
                   CGST=parseInt(0.05*subtotal);
                    ans=ans+"</tbody>";
                    ans=ans+"</table>";
                    total=subtotal+charge+CGST;
                    
                    document.getElementById("d11").innerHTML=ans;
                   // alert("sub="+subtotal);
                   // alert("CGST="+CGST);
                    var x="";
                      x=x+"<table class=\"table\">";
                      x=x+"<tr>";
                      x=x+"<td width=\"60%\"> Subtotal</td>";
                      x=x+"<td width=\"20%\"> = </td>";
                      x=x+"<td width=\"20%\">"+subtotal+"</td>";
                      x=x+"</tr>";
                      x=x+"<tr>";
                      x=x+"<td width=\"60%\"> Delivery Charges</td>";
                      x=x+"<td width=\"20%\"> = </td>";
                      x=x+"<td width=\"20%\">"+charge+"</td>";
                      x=x+"</tr>";
                      
                      x=x+"<tr>";
                      x=x+"<td width=\"60%\"> CGST</td>";
                      x=x+"<td width=\"20%\"> = </td>";
                      x=x+"<td width=\"20%\">"+CGST+"</td>";
                      x=x+"</tr>";
                      x=x+"<tr>";
                      x=x+"<td width=\"60%\"> Total </td>";
                      x=x+"<td width=\"20%\"> = </td>";
                      x=x+"<td width=\"20%\">"+total+"</td>";
                      x=x+"</tr>";
                      x=x+"</table>";
                      document.getElementById("d12").innerHTML=x;
                    }
                }
                };
                xhttp.open("GET","./View_Cart",true);
               
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
             }
        
            function updateQuantity(index,id)
            {
                 var xhttp = new XMLHttpRequest();
                  var qty=document.getElementById(id).value;
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                      //  alert(r);
                        
                        if(r=="success")
                        {
                            //alert("Food Item Quantity Updated");
                            viewCart();
                        }
                
              
                    }
                };
                xhttp.open("GET","./Update_Cart_Item_Quantity?i="+index+"&qty="+qty,true);
               
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
  
            }
            
            function pay()
            {
                //var mode=document.getElementByN("mode").value;
                if(document.getElementById("cod").checked==true)
                {
                    var mode="cod";
                    pay1(mode);
                }
                 else if(document.getElementById("pay now").checked==true)
                 {
                     book();
                     
                 }
            }
            
            function pay1(mode)
            {
               // alert(subtotal+" "+charge+" "+CGST+" "+discount);
                var xhttp = new XMLHttpRequest();
                  
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                       // alert(r);
                        
                        if(r=="success")
                        {
                           alert("success");
                           viewCart();
                           sendSmsCon();
                           $('#myModal14').modal('show');
                        }
                
              
                    }
                };
                xhttp.open("GET","./Payment?sub="+subtotal+"&charge="+charge+"&CGST="+CGST+"&discount="+discount+"&total="+total+"&mode="+mode,true);
               
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send();
            }
            
            var n = 0;
        function fill(obj)
        {
            var img = obj.src;
            var id = obj.id;
            var val = parseInt(id.substring(id.indexOf("_") + 1));
            var i;
            if (n === 0)
            {
                i = 1;
            } else
            {
                i = n + 1;
            }
            for (; i <= 5; i++)
            {
                if (i <= val)
                {
                    document.getElementById("rating_" + i).src = "rating/filled_star.png";

                } else
                {
                    document.getElementById("rating_" + i).src = "rating/empty_star.png";
                }
            }

        }
        function selected(obj)
        {
            var id = obj.id;
            var val = parseInt(id.substring(id.indexOf("_") + 1));
            n = val;
        }
        function unfill(obj)
        {
            var i;
            if (n === 0)
            {
                i = 1;
            } else
            {
                i = n + 1;
            }
            for (; i <= 5; i++)
            {
                document.getElementById("rating_" + i).src = "rating/empty_star.png";
            }
        }
           
        function goo()
        {
            var comment=document.getElementById("comment").value;
            //alert(comment+"  "+n);
            if(n==0){
                alert("please add review");
                
            }
            else{
                 var xhttp = new XMLHttpRequest();
                  
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                        //alert(r);
                        
                        if(r=="success")
                        {
                           alert("review added");
                           window.location.href="Customer_Home_Page.jsp";
                        }
               
              
                    }
                };
                
               xhttp.open("GET","./Add_Review?rating="+n+"&comment="+comment+"&rid="+restaurantid,true);
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send();
        }
                
              
            
            
        }
        
       
        
    
       function sendSmsCon()
       {
           var xhttp = new XMLHttpRequest();
                  
               // Callback method
               // This method is called when server gives answer
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        
                        var r=xhttp.responseText.trim();
                        //alert(r);
                        
                        
                
              
                    }
                };
                xhttp.open("GET","./Send_Sms_Con",true);
               
                // Step 2
                    // true --> async request
                
                // Step 3
                xhttp.send()
       }
       
       function checkIfLogin()
            {
                
                var xhr = new XMLHttpRequest;

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var r = xhr.responseText.trim();
                        //alert("result=" + r);
                        if (r == "fail")
                        {
                            alert("Please Login before Placing any Orders");
                            $('#myModal3').modal('show');
                        } 
                        else if (r == "success")
                        {
                            pay();
                        }
                    }
                };

                xhr.open("GET", "./Check_If_Login", true);

              //  alert("Sending Request to Server");

                xhr.send();
                
            }
       </script>

    </head>
    <body onload="viewCart()">
         <jsp:include page="Public_Header2.jsp" />
         <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h1 style="font-family: 'Barrio', cursive; color: #fff;">Cart</h1>
                 <!--   <a href="#"></a>
                    <a class="active" href="table.html"></a>-->
                </div>
            </div>
        </section>
        <br>
        <br>
        <br>
      

        <br>
        <hr>
        <br>
        <div class="container">

            <div class="row">
            
            <div class="row">

                <div class="col-sm-12">
                    
                    <div id="d11" class="offset-3"><label id="l11" class="offset-3"></label></div>
                </div>
                </div>
                <div  class="row">
                    <div id="d12" class="col-lg-offset-9"></div>
                </div>
                
                <center> 
                   
                    <h2 style="font-family: 'Delius Swash Caps', cursive;">Payment Mode</h2><br>
                    <input type="radio" id="cod" name="mode" value="cod"/><label for="cod">COD</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                        
                        <input type="radio" id="pay now" name="mode" value="pay now" checked="true"/><label for="online">Pay Now</label>
               </center>
                <center><input type="button" value="PAY" class="btn-outline-primary btn-lg col-sm-4 col-lg-offset-4" onclick="checkIfLogin()"/></center>
               

            </div>
            <br>
            <br>
       <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
       function book() {
                                                   //                  alert(document.getElementById("amount1").value);
        var options = {

           "key": "rzp_test_96HeaVmgRvbrfT", // Enter the Key ID generated from the Dashboard
            "amount": parseInt(total) * 100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise or INR 500.
           "currency": "INR",
            "name": "Freshy",
            "description": "Food Order Payment",
            "image": "img/online.jpg",
            "handler": function (response) {
             alert(response.razorpay_payment_id);

            <%session.setAttribute("status", "booked");%>

                                                           //                     var offerp=document.getElementById("amount1").value
                                                           //               var gid= document.getElementById("gymid").value;
                                                           //                var dur=document.getElementById("duration").value;
                                                           //               var gpid= document.getElementById("gpid").value;
                                                           //               alert(gpid);
                                                           //                var status=document.getElementById("status").value;
                                                           //                var offerp=document.getElementById("offerprice").value;

                                                            //             window.location.href = "Bookingsuccess.jsp?mid=" + mid + "&duration=" + duration + "&charges=" + price;
             pay1("pay now");
              },
              "prefill": {
              "name": "", "email": "",
                "contact": ""
                },
                  "notes": {
                 "address": ""
                 },
                  "theme": {
                  "color": "#F37254"
                     }
                  };
                   var rzp1 = new Razorpay(options);
                                                   //            document.getElementById('rzp-button1').onclick = function (e) {
                   rzp1.open();
                                                   //                e.preventDefault();
                                                   //            }

                   }
        </script>


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

   <div class="modal" id="myModal14" >
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header " style="background: yellowgreen;" >
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="color: white;"> Add Review</h4>
                        </div>
                        <div class="modal-body " >
                            <div>



                                <div id="all">

                                    <form action="" method="post" id="form14">
                                        <table>
                                            <tr> <label class="form-group"> Give Ratings..</label>
                                            <td>
                                                <img id="rating_1" src="rating/empty_star.png" onmouseover="fill(this);" onmouseout="unfill(this);" onclick="selected(this);" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img id="rating_2" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img id="rating_3" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img id="rating_4" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img  id="rating_5" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            </tr>
                                        </table>
                                        <br>
                                        <label> Write Comment : </label> <input style="border-radius: 20px;" type="text" id="comment"  class="form-group"/>
                                        <input type="button" value="Submit" class="btn btn-primary" style="border-radius: 10px;text-shadow: 2px 2px 5px black" onclick="goo()"/>
                                        <label style="display: none;color: tomato;" id="label1">Please Select Any Rating</label>

                                    </form>
                                </div>
                             
                            </div>   
                        </div>
                            <!--</div>-->
                            <div class="modal-footer " style="background: yellowgreen;" >
                                <button type="button" class="btn btn-default" style="border-radius: 10px;" data-dismiss="modal" style="" >Close</button>
                            </div>
                        

                    </div>
                </div>
            </div>

<div id="myModal3" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-header">
                <center> <h1 class="modal-title" style="font-family: 'Monofett', cursive;">Customer Login </h1></center>
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

                       

                    </div>
                </div>
                
                   
                        <div class="form-group form-row">
                            <br>
                            <input type="button" value="Login" class="btn-outline-primary btn-lg col-sm-12" onclick="customerLogin()" />
                        </div>

                        <div id="d3" style="color:red"><label id="l3" class="offset-3"></label></div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div id="d6a"  class="offset-3"><a href="#myModal8" data-toggle="modal" >Forgot Password</a></div>

                                <div id="d6b" class="offset-3"><a href="Customer_Signup.jsp">Don't have an Account</a></div>

                            </div> 
                        </div>
                 

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>

    </div>
</div>