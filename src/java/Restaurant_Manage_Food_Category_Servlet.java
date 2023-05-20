
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class Restaurant_Manage_Food_Category_Servlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
       String email=(String)session.getAttribute("email");
        int rid=(Integer)session.getAttribute("restaurant_id");
           
       try
       {
          
        // Receive ALL Files  
          
          Part p1 = request.getPart("ccover");
           Part p2 = request.getPart("cprofile");
           String cuisine = request.getParameter("cuisine"); 
          String cname = request.getParameter("cname");
          String cdesc = request.getParameter("cdesc");
          
           System.out.println("cuisine id"+cuisine);
          String abspath = getServletContext().getRealPath("/foodCategoryCover");
          String abspath1 = getServletContext().getRealPath("/foodCategoryProfile");
    
          
          String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis()+".jpg");
          String filename2 = vmm.FileUploader.savefileonserver(p2, abspath1, System.currentTimeMillis()+".jpg");
        
      //     int rid=0;
           int cid=Integer.parseInt(cuisine);
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
           System.out.println(cid+" *** "+rid);
          ResultSet rs3 = DBLoader.executeQuery("select * from restaurant_food_category where category_name =\'"+cname+"\' and cuisine_id="+cid+" and restaurant_id="+rid);
              if(rs3.next())
              {
                 out.println("duplicate");
              }
              else
              {
                rs3.moveToInsertRow();
                
                rs3.updateInt("cuisine_id",cid);
                rs3.updateInt("restaurant_id",rid);
                rs3.updateString("category_name", cname);
                rs3.updateString("description",cdesc);
                rs3.updateString("photo_cover","foodCategoryCover/"+filename1);
                rs3.updateString("photo_profile","foodCategoryProfile/"+filename2);
                
                rs3.insertRow();
                
                out.println("success");
              }
        
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}
