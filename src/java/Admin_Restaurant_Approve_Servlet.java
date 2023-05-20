
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;


public class Admin_Restaurant_Approve_Servlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
           
       try
       {
           
  
        // Receive ALL Files  
   
            
          // Now receive text data
          String id= request.getParameter("index");
          String status = request.getParameter("status");
          
         // out.println("<h3>Text Data</h3>");
          //out.println("<h4>username : "+un+"</h4>");
          //out.println("<h4>password: "+ps+"</h4>");
          
         
          ResultSet rs = DBLoader.executeQuery("select * from restaurant where restaurant_id=\'"+id+"\'");
         
          if(rs.next())
          {
            rs.updateString("status",status); 
            rs.updateRow();
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
