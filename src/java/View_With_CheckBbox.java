
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;

@MultipartConfig
public class View_With_CheckBbox extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
 
         String cids=request.getParameter("cids");  
        if(cids.length()>0)
        {
            cids=cids.substring(0,cids.length()-1);
        }
        String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant_cuisine where cuisine_id in ("+cids+")");
        
        out.print(ans);
        
    }
}