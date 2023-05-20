
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.Cart;
import vmm.DBLoader;
import vmm.sendsms;


public class delete_Cart_Item extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
 
         int id=Integer.parseInt(request.getParameter("i")); 
         
         ArrayList<Cart> al=al=(ArrayList <Cart>)request.getSession().getAttribute("cart");
         
         al.remove(id);
         request.getSession().setAttribute("cart", al);
         out.print("success");
      //  String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant where restaurant_id in ("+cids+")");
    
    }
}