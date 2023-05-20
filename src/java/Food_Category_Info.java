
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;


public class Food_Category_Info extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
       // HttpSession session=request.getSession();
        int rid=Integer.parseInt(request.getParameter("rid"));
     //   int cid=Integer.parseInt(request.getParameter("cid"));
        response.setContentType("text/html");
        //int id=Integer.parseInt(request.getParameter("id"));
        
        //Step 2
        PrintWriter out = response.getWriter();
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant_food_category where restaurant_id="+rid);
        
        out.print(ans);
        
    }
}