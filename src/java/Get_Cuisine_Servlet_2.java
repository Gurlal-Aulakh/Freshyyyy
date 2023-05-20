
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;


public class Get_Cuisine_Servlet_2 extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
           
       try
       {
          String ans="";
        // Receive ALL Files  
          
       String cids[]=request.getParameter("cuisine").split(",");
                for(int i=0;i<cids.length;i++)
                {
                     int cid=Integer.parseInt(cids[i]);
                    ResultSet rs3=DBLoader.executeQuery("select * from cuisine where cuisine_id=\'"+cid+"\'");
                   while(rs3.next())
                   {
                       ans=ans+rs3.getString("cuisine_name")+",";
                   }
                 
                }
             //   System.out.println(ans);
                out.println(ans);
     
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}

