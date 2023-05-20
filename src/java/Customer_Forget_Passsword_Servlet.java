
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;


public class Customer_Forget_Passsword_Servlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        System.out.print("der");
       response.setContentType("text/html");
       
       String mobile=request.getParameter("mobile");
       String question=request.getParameter("question");
       String answer=request.getParameter("answer");
       PrintWriter out = response.getWriter();
      // HttpSession session=request.getSession();  
     
       try
       {
          
        // Receive ALL Files  
        //String mobile=(String)session.getAttribute("customermobile");
        
        ResultSet rs=DBLoader.executeQuery("select * from customer_signup where mobileno=\'"+mobile+"\' and question=\'"+question+"\' and answer=\'"+answer+"\'");
        {
         if(rs.next())
            {
               String password=rs.getString("password");
               String email=rs.getString("email");
               System.out.print("pass=="+password+" email=="+email);
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