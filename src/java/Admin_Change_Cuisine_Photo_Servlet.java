

import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;

@MultipartConfig
public class Admin_Change_Cuisine_Photo_Servlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
           
       try
       {
           

        // Receive ALL Files  
          
          Part p1 = request.getPart("photo1");
          int cid =Integer.parseInt(request.getParameter("cid1"));
          
          String abspath = getServletContext().getRealPath("/cuisine");
    
          
          String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis()+".jpg");
        
//        out.println("File 1 "+filename1);
          System.out.println("File name"+filename1);
         
          //out.println("<h2>All Files Uploaded to Server</h2>");
            
          // Now receive text data
         
        
         // out.println("<h3>Text Data</h3>");
          //out.println("<h4>username : "+un+"</h4>");
          //out.println("<h4>password: "+ps+"</h4>");
          
         
          ResultSet rs = DBLoader.executeQuery("select * from cuisine where cuisine_id=\'"+cid+"\'");
         
          if(rs.next())
          {
               out.println("success");
               rs.updateString("photo", "cuisine/"+filename1);
               rs.updateRow();
       
              
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
