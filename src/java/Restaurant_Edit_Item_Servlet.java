
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class Restaurant_Edit_Item_Servlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
     //  String email=(String)session.getAttribute("email");
        int rid=(Integer)session.getAttribute("restaurant_id");
           
       try
       {
          
        // Receive ALL Files  
          
          Part p1 = request.getPart("iphoto1");
          // Part p2 = request.getPart("cprofile");
          String category = request.getParameter("category1"); 
          String iname = request.getParameter("iname1");
          String idesc = request.getParameter("idesc1");
          String price = request.getParameter("price1");
          String offerprice = request.getParameter("offerprice1");
          
         //  System.out.println("cuisine id"+category);
          String abspath = getServletContext().getRealPath("/foodItemPhoto");
         // String abspath1 = getServletContext().getRealPath("/foodCategoryProfile");
    
          System.out.println("category="+category);
          String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis()+".jpg");
       //   String filename2 = vmm.FileUploader.savefileonserver(p2, abspath1, System.currentTimeMillis()+".jpg");
        
      //     int rid=0;
         int cid=Integer.parseInt(category);
        //  ResultSet rs = DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\'");
        //  while(rs.next())
        //  {
       //        rid=rs.getInt("restaurant_id");
       //   }
          
//          ResultSet rs2 = DBLoader.executeQuery("select * from cuisine where cuisine_name =\'"+cuisine+"\'");
//         while(rs2.next())
//         {
//             cid=rs2.getInt("cuisine_id");
//         }
         //  System.out.println(cid+" *** "+rid);
          ResultSet rs3 = DBLoader.executeQuery("select * from restaurant_food_items where food_item_id="+cid);
              if(rs3.next())
              {
                  
//                rs3.updateInt("restaurant_category_id",cid);
                rs3.updateInt("restaurant_id",rid);
                rs3.updateString("item_name", iname);
                rs3.updateString("description",idesc);
                if(filename1!=null)
                {
                rs3.updateString("photo","foodItemPhoto/"+filename1);
                }
              //  rs3.updateString("photo_profile","foodCategoryProfile/"+filename2);
                rs3.updateString("price",price);
                rs3.updateString("offer_price",offerprice);
                rs3.updateRow();
                
                out.println("success");
                 
              }
              else
              {
             
                out.println("fail");
              }
        
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}