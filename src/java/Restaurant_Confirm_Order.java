
        
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Restaurant_Confirm_Order extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          
         int bid=Integer.parseInt(request.getParameter("bid"));
           
         // HttpSession session=request.getSession();
         // String email=(String)session.getAttribute("email");
          ResultSet rs=DBLoader.executeQuery("select * from bill where bill_id="+bid);
          
          if(rs.next())
          {
              rs.updateString("status","confirmed");
              rs.updateRow();
              out.print("success");
          }
         
           
          }
            catch(Exception ex)
                    {
                     ex.printStackTrace();
                    }
           
        }
    }

    