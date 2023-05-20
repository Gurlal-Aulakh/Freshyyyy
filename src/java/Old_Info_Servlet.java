import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;


public class Old_Info_Servlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
         HttpSession session=request.getSession();
          String email=(String)session.getAttribute("email");
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant where emailid=\'"+email+"\'");
        
        out.print(ans);
        
    }
}