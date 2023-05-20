
import java.io.*;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;


public class View_Sales extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        HttpSession session=request.getSession();
        
        response.setContentType("text/html");
        String email=(String)session.getAttribute("email");
        int rid=-1;
       // System.out.print("email="+rid);
        //Step 2
        String sdate=request.getParameter("sdate");
        String edate=request.getParameter("edate");
        
        try
        {
        ResultSet rs = DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\'");
        if(rs.next())
        {
            rid=rs.getInt("restaurant_id");
        }
        PrintWriter out = response.getWriter();
        
        String ans = new RDBMS_TO_JSON().generateJSON("select date,sum(total) as amount from bill where restaurant_id="+rid+" and date between '"+sdate+"' and '"+edate+"' and status='confirmed' group by date order by date");
    
        
        out.print(ans);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}