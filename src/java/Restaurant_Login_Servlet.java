
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Restaurant_Login_Servlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          String email=request.getParameter("e");
          String password=request.getParameter("p");
          HttpSession session=request.getSession();
          ResultSet rs=DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\'");
          
          if(rs.next())
          {
             ResultSet rss=DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\' and password=\'"+password+"\'");
               if(rss.next())
               {
                   int rid=rss.getInt("restaurant_id");
                   session.setAttribute("email",email);
                   session.setAttribute("restaurant_id",rid);
                   out.println("success");
               }
              else
                  out.println("Password Incorrect");
          }
          else
          {
              out.println("This email does not Exist");
          }
          }
            catch(Exception ex)
                    {
                     ex.printStackTrace();
                    }
           
        }
    }

    

