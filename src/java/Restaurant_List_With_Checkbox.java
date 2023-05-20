
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


public class Restaurant_List_With_Checkbox extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
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
        System.out.println("cids="+cids);
        String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant where restaurant_id in ("+cids+")");
        
        out.print(ans);
        
    }
}