
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;


public class Customer_Fetch_Orders extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        HttpSession session=request.getSession();
        
        response.setContentType("text/html");
        String email=(String)session.getAttribute("customeremail");
        System.out.print("email="+email);
        //Step 2
        PrintWriter out = response.getWriter();
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from bill inner join restaurant on bill.restaurant_id=restaurant.restaurant_id where bill.emailid='"+email+"' and bill.status='pending'");
        
        out.print(ans);
        
    }
}