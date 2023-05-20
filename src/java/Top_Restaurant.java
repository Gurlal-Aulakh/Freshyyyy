

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;
import vmm.RDBMS_TO_JSON;


public class Top_Restaurant extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            
            try
            {
          
          
         String ans = new RDBMS_TO_JSON().generateJSON("select review.restaurant_id, description, restaurant_name, photo_square, avg(rating) as rating from review inner join restaurant on review.restaurant_id=restaurant.restaurant_id group by restaurant.restaurant_id order by rating desc limit 4;");
           out.print(ans);
          }
            catch(Exception ex)
                    {
                     ex.printStackTrace();
                    }
           
        }
    }
