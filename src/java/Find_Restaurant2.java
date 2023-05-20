
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;
import vmm.RDBMS_TO_JSON;


public class Find_Restaurant2 extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          
          String resname=request.getParameter("resname");
           String rescity=request.getParameter("rescity");
          
          
                System.out.println("name"+resname+" "+rescity);
         
          
         String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant where restaurant_name=\'"+resname+"\' and city=\'"+rescity+"\'");
           out.print(ans);
          }
            catch(Exception ex)
                    {
                     ex.printStackTrace();
                    }
           
        }
    }
