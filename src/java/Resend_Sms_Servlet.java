
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;


public class Resend_Sms_Servlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();  
       String otp="";
           
       try
       {
          
        // Receive ALL Files  
        String mobile=(String)session.getAttribute("customermobile");
        
        ResultSet rs=DBLoader.executeQuery("select * from customer_signup where mobileno=\'"+mobile+"\'");
        {
            while(rs.next())
            {
               otp=rs.getString("otp");
            }
        }
         
       if(otp!="")
       {
        sendsms.send(mobile,"The Otp for Customer Sign Up of freshyyyy is "+otp);
        
       }
         }
     
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}

