
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;


public class Restaurant_View_Orders extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        HttpSession session=request.getSession();
        
        response.setContentType("text/html");
        int rid=(Integer)session.getAttribute("restaurant_id");
        System.out.print("email="+rid);
        //Step 2
        PrintWriter out = response.getWriter();
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from bill where restaurant_id="+rid+" and status=\'pending\'");
        
        out.print(ans);
        
    }
}