
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;


public class Add_Review extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
       
       int rating=Integer.parseInt(request.getParameter("rating"));
       int rid=Integer.parseInt(request.getParameter("rid"));
       String comment=request.getParameter("comment");
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();  
      
       try
       {
          
        // Receive ALL Files  
        //String mobile=(String)session.getAttribute("customermobile");
        
        ResultSet rs=DBLoader.executeQuery("select * from review");
        
        rs.moveToInsertRow();
        
        rs.updateInt("rating",rating);
        rs.updateInt("restaurant_id", rid);
        rs.updateString("comment", comment);
       
        rs.insertRow();
        out.print("success");
         }
     
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}