import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;


public class Admin_Restaurant_List_City_Servlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
        String city=request.getParameter("city");
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant where city=\'"+city+"\'");
        
        out.print(ans);
        
    }
}