

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Customer_Login_Servlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          String email=request.getParameter("email3");
          String password=request.getParameter("pass3");
          HttpSession session=request.getSession();
          System.out.println("email="+email+" pass=="+password);
         
             ResultSet rss=DBLoader.executeQuery("select * from customer_signup where email=\'"+email+"\' and password=\'"+password+"\' and status='approved'");
               if(rss.next())
               {
                   String status=rss.getString("status");
                   if(status=="pending")
                   {
                       out.println("pending");
                   }
                  else
                   {
                   session.setAttribute("customeremail",email);
                   out.println("success");
                   }
               }
              else
               {
                       out.println("fail");  
               }
               }
         
          
            catch(Exception ex)
                    {
                     ex.printStackTrace();
                    }
           
        }
    }

    

