
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Contact_Servlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          
          String name=request.getParameter("name");
           String last=request.getParameter("last");
           String email=request.getParameter("email");
           String subject=request.getParameter("subject");
           String message=request.getParameter("message");
   
         
          ResultSet rs=DBLoader.executeQuery("select * from customer_signup where email=\'"+email+"\'");
          
          if(rs.next())
          {
            ResultSet rs1=DBLoader.executeQuery("select * from contact");
            rs1.moveToInsertRow();
            
            rs1.updateString("firstname", name);
            rs1.updateString("lastname", last);
            rs1.updateString("email", email);
            rs1.updateString("subject", subject);
            rs1.updateString("message", message);
            
            rs1.insertRow();
            out.print("success");
              
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
