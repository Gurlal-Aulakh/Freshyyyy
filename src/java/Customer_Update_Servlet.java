
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class Customer_Update_Servlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
           
       try
       {
          
        // Receive ALL Files  
          
          Part p1 = request.getPart("photo5");
         
           String city = request.getParameter("city5"); 
          String fullname = request.getParameter("fullname5");
         // String rdesc = request.getParameter("rdesc");
           String email = request.getParameter("email5");
         
            String addr = request.getParameter("addr5");
             String mob5 = request.getParameter("mob5");
                String question = request.getParameter("question5");
              String answer = request.getParameter("answer5");
            
        String customeremail=(String)session.getAttribute("customeremail");
        
          String abspath = getServletContext().getRealPath("/customerPhoto");
          
    
          
          String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis()+".jpg");
   
        
          ResultSet rs = DBLoader.executeQuery("select * from customer_signup where email=\'"+email+"\'");
         
          if(!(rs.next()))
          {
              out.println("fail");
          }
          else
          {
           
                       
            rs.updateString("city", city);
            rs.updateString("fullname", fullname);
            rs.updateString("address", addr);
            rs.updateString("question", question);
            rs.updateString("answer", answer);
            if(filename1!=null)
            {
               rs.updateString("photo", "customerPhoto/"+filename1); 
            }   
           
           rs.updateRow();
           
            out.println("success");
          }
              
        
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}

