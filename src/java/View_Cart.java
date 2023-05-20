
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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import vmm.Cart;
import vmm.DBLoader;
import vmm.sendsms;


public class View_Cart extends HttpServlet
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
           
          
           
           ArrayList<Cart> cartlist=(ArrayList<Cart>)request.getSession().getAttribute("cart");
           int iid=-1;
           int rid=-1;
           int min=-1;
           int charge=-1;
           if(cartlist.size()>0)
           {
               JSONArray ar=new JSONArray();
               for(int i=0;i<cartlist.size();i++)
               {
                   Cart c=cartlist.get(i);
                   JSONObject obj=new JSONObject();
                   obj.put("itemid", c.itemid);
                   iid=c.itemid;
                   obj.put("price", c.price);
                   obj.put("offerprice", c.offerprice);
                   obj.put("qty", c.qty);
                   obj.put("amt",c.amount);
                   obj.put("itemname", c.itemname);
                   obj.put("photo", c.photo);
                   ar.add(obj);
               }
               System.out.println("iid="+iid);
               ResultSet rs = DBLoader.executeQuery("select * from restaurant_food_items where food_item_id="+iid);
               if(rs.next())
               {
                   rid=rs.getInt("restaurant_id");
               }
               System.out.println("rid="+rid);
               ResultSet rs1 = DBLoader.executeQuery("select * from restaurant where restaurant_id="+rid);
               if(rs1.next())
               {
                   min=rs1.getInt("min_order_delivery");
                   charge=rs1.getInt("delivery_charges");
               }
               System.out.println("min="+min);
               System.out.println("charge="+charge);
               JSONObject obj=new JSONObject();
               obj.put("min",min);
               obj.put("charge",charge);
               obj.put("restaurantid", rid);
               ar.add(obj);
               
               out.print(ar.toJSONString());
           }
           
      
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
        
    }
}