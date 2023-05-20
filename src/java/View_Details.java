
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;


public class View_Details extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        HttpSession session=request.getSession();
        
        response.setContentType("text/html");
        int bid=Integer.parseInt(request.getParameter("bid"));
        
        //Step 2
        PrintWriter out = response.getWriter();
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from bill_detail where bill_id="+bid);
        
        out.print(ans);
        
    }
}