
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Restaurant_Change_Password_Servlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          
          String oldpassword=request.getParameter("op");
           String newpassword=request.getParameter("np");
          HttpSession session=request.getSession();
          String email=(String)session.getAttribute("email");
          ResultSet rs=DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\' and password=\'"+oldpassword+"\'");
          
          if(rs.next())
          {
              out.println("success");
              rs.updateString("password",newpassword);
              rs.updateRow();
              
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

    