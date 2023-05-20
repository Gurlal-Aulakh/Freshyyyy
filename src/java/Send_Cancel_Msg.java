
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;


public class Send_Cancel_Msg extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();  
      
           
       try
       {
           
          String mobile="";
         String email=request.getParameter("email");
                 
      
          ResultSet rs = DBLoader.executeQuery("select * from customer_signup where email=\'"+email+"\'");
         
          if(rs.next())
          {
              mobile=rs.getString("mobileno");
          }
         sendsms.send(mobile,"Your Order is Cancelled, We are sorry for the inconvenience");
         out.println("success");
           
       
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}

