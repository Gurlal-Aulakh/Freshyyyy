import java.io.*;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class Get_Food_Category_Servlet extends HttpServlet
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
       String email=(String)session.getAttribute("email");
       String ans="";
       int rid=0;
       
        ResultSet rs=DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\'");
        while(rs.next())
        {
            rid=rs.getInt("restaurant_id");
        }
        if(rid!=0)
        {
        ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant_food_category where restaurant_id=\'"+rid+"\'");
        }
        out.print(ans);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
    }
}