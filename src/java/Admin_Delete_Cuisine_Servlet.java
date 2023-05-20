import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Admin_Delete_Cuisine_Servlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          int id=Integer.parseInt(request.getParameter("id"));

          ResultSet rs=DBLoader.executeQuery("select * from cuisine where cuisine_id=\'"+id+"\'");
          
          if(rs.next())
          {
              out.println("success");
              rs.deleteRow();
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

    