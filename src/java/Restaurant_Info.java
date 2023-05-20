
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;


public class Restaurant_Info extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        HttpSession session=request.getSession();
        
        response.setContentType("text/html");
        int id=Integer.parseInt(request.getParameter("id"));
        
        //Step 2
        PrintWriter out = response.getWriter();
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant where restaurant_id="+id);
        
        out.print(ans);
        
    }
}