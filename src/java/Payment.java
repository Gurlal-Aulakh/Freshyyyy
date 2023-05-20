

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;
import java.io.*;
//import java.sql.Date;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import static javax.print.attribute.Size2DSyntax.MM;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.Cart;
import vmm.DBLoader;
import vmm.sendsms;


public class Payment extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
         String pattern = "yyyy-MM-dd";
            DateFormat df = new SimpleDateFormat(pattern);
            Date today = Calendar.getInstance().getTime();
            String todayAsString = df.format(today);
            String pattern2="hh:mm:ss aa";
             DateFormat df2 = new SimpleDateFormat(pattern2);
            Date today2 = Calendar.getInstance().getTime();
            String todayAsString2 = df2.format(today2);
        System.out.println("date"+todayAsString+" "+todayAsString2);
         int subtotal=Integer.parseInt(request.getParameter("sub"));  
         int charge=Integer.parseInt(request.getParameter("charge"));
         int CGST=Integer.parseInt(request.getParameter("CGST"));
       int discount=Integer.parseInt(request.getParameter("discount"));
                  System.out.println("disocunt"+discount);

         int total=Integer.parseInt(request.getParameter("total"));
         String mode=request.getParameter("mode");
         HttpSession session=request.getSession();
         int iid=-1;
         int rid=-1;
         String email=(String)session.getAttribute("customeremail");
         try
       {
         ArrayList<Cart> cartlist=(ArrayList <Cart>)request.getSession().getAttribute("cart");
          for(int i=0;i<cartlist.size();i++)
               {
                   Cart c=cartlist.get(i);
                   iid=c.itemid;
               }
         
            ResultSet rs = DBLoader.executeQuery("select * from restaurant_food_items where food_item_id="+iid);
               if(rs.next())
               {
                   rid=rs.getInt("restaurant_id");
               }  
               
               ResultSet rs1 = DBLoader.executeQuery("select * from bill");
               {
               
                   
                   rs1.moveToInsertRow();
                   rs1.updateInt("restaurant_id",rid);
                   rs1.updateInt("subtotal",subtotal);
                   rs1.updateInt("delivery_charges",charge);
                   rs1.updateInt("CGST",CGST);
                   rs1.updateInt("discount",discount);
                   rs1.updateInt("total",total);
                   rs1.updateString("paymode",mode);
                   rs1.updateString("status","pending");
                   rs1.updateString("date",todayAsString);
                   rs1.updateString("time",todayAsString2);
                   rs1.updateString("emailid",email);
                   
                   rs1.insertRow();
               }
                  
              ResultSet rs2 = DBLoader.executeQuery("select max(bill_id) as bid from bill");    
              rs2.next();
              int billid=rs2.getInt("bid");
              
               for(int i=0;i<cartlist.size();i++)
               {
                   Cart c=cartlist.get(i);
                   ResultSet rs3 = DBLoader.executeQuery("select * from bill_detail");
                   rs3.moveToInsertRow();
                   
                   rs3.updateInt("bill_id",billid);
                   rs3.updateInt("item_id",c.itemid);
                   rs3.updateString("name",c.itemname);
                   rs3.updateInt("price",c.price);
                   rs3.updateInt("quantity",c.qty);
                   rs3.updateInt("amount",c.amount);
                   
                   rs3.insertRow();
               }
              
               request.getSession().setAttribute("cart",null);
               out.print("success");
     
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
        
    }
}