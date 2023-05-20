
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;


public class Restaurant_Forget_Passsword_Servlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
       
       String email=request.getParameter("email");
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();  
       String otp= ""+(int)(Math.random()*100000);
       String ans="";
       ans=ans+otp+",";
       try
       {
          
        // Receive ALL Files  
        //String mobile=(String)session.getAttribute("customermobile");
        
        ResultSet rs=DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\'");
        {
         if(rs.next())
            {
               String mobile=rs.getString("mobileno");
                sendsms.send(mobile,"The Otp for your Password Recovery of your Freshyyyy Account is "+otp);
                ans=ans+mobile+",";
                out.print(ans);
            }
          else
         {
             out.print("");
         }
        }
       
         }
     
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}