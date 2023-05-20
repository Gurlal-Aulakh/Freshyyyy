
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Restaurant_Cancel_Order extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
                System.out.println("hello");
                System.out.println(request.getParameter("bid2"));
          int bid=Integer.parseInt(request.getParameter("bid2"));
           System.out.println("bid="+bid);
          ResultSet rs=DBLoader.executeQuery("select * from bill where bill_id="+bid);
          
          if(rs.next())
          {
              rs.updateString("status","cancel");
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

    