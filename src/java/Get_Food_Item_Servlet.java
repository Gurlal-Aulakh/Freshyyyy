
import java.io.*;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;



public class Get_Food_Item_Servlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
        try
        {
       HttpSession session=request.getSession();
      // String email=(String)session.getAttribute("email");
       int rid=(Integer)session.getAttribute("restaurant_id");
       String ans="";
   
        ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant_food_items where restaurant_id=\'"+rid+"\'");
    
        out.print(ans);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
    }
}