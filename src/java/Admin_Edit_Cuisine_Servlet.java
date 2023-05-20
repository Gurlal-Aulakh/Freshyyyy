import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;


public class Admin_Edit_Cuisine_Servlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          int cid=Integer.parseInt(request.getParameter("cid"));
          String cname=request.getParameter("cname");
          String cdesc=request.getParameter("cdesc");
          

          ResultSet rs=DBLoader.executeQuery("select * from cuisine where cuisine_id=\'"+cid+"\'");
          
          if(rs.next())
          {
              out.println("success");
              rs.updateString("cuisine_name",cname);
              rs.updateString("description",cdesc);
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
