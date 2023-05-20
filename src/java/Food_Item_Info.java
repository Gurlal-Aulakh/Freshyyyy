
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;


public class Food_Item_Info extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
       // HttpSession session=request.getSession();
        int rid=Integer.parseInt(request.getParameter("rid"));
        String name=request.getParameter("name");
        PrintWriter out = response.getWriter();
      //  int cid=Integer.parseInt(request.getParameter("cid"));
        response.setContentType("text/html");
        //int id=Integer.parseInt(request.getParameter("id"));
        String ans="";
        if(name.equals("All"))
        {
           ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant_food_items where restaurant_id="+rid);
        }
      
        else{
          ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant_food_items where restaurant_id="+rid+" and category_name=\'"+name+"\'");
        }
        out.print(ans);
        
    }
}