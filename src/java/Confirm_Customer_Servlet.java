
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;


public class Confirm_Customer_Servlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
       String otp1=request.getParameter("otp");
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();  
       String otp=(String)session.getAttribute("otp");
       System.out.println("otp=="+otp+"*** and entered is=="+otp1 );
       if(otp.equals(otp1))
       {
           try
       {
          
        // Receive ALL Files  
        String mobile=(String)session.getAttribute("customermobile");
      
          ResultSet rs = DBLoader.executeQuery("select * from customer_signup where mobileno=\'"+mobile+"\'");
         
          if(rs.next())
          {
           rs.updateString("status","approved");
           
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

}

