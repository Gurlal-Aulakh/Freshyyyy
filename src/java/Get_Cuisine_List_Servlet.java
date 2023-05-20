
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;


public class Get_Cuisine_List_Servlet extends HttpServlet 
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
      ResultSet rs=DBLoader.executeQuery("select * from restaurant_cuisine where restaurant_id="+rid);
     while(rs.next())
     {
         int cid=rs.getInt("cuisine_id");
         ResultSet rs2=DBLoader.executeQuery("select * from cuisine where cuisine_id="+cid);
         while(rs2.next())
         {
             String cname=rs2.getString("cuisine_name");
             ans=ans+cname+","+cid+",";
         }
     }
     out.println(ans);
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}

