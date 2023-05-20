
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;


public class Restaurant_Send_Passsword_Servlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
       
       String mobile=request.getParameter("mobiles");
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession(); 
       
      // String otp= ""+(int)(Math.random()*100000);
     
       try
       {
      
        ResultSet rs=DBLoader.executeQuery("select * from restaurant where mobileno=\'"+mobile+"\'");
        {
         if(rs.next())
            {
               String password=rs.getString("password");
               String email=rs.getString("emailid");
               sendsms.send(mobile,"The Password for Freshyyyy Account with Email Id "+email+" is "+password);
               out.print("success");
            }
          else
         {
             out.print("fail");
         }
        }
       
         }
     
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}