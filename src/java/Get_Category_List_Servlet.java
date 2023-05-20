
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;


public class Get_Category_List_Servlet extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();
     
        int rid=(Integer)session.getAttribute("restaurant_id");
        String ans="";
           
       try
       {
          
        // Receive ALL Files  
      ResultSet rs=DBLoader.executeQuery("select * from restaurant_food_category where restaurant_id="+rid);
     while(rs.next())
     {
         int cid=rs.getInt("restaurant_category_id");
         String cname=rs.getString("category_name");
         ans=ans+cname+","+cid+",";
         
     }
     out.print(ans);
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}
