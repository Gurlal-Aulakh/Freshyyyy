
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


public class Update_Cart extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
 
         int iid=Integer.parseInt(request.getParameter("iid"));  
         
       
      //  String ans = new RDBMS_TO_JSON().generateJSON("select * from restaurant where restaurant_id in ("+cids+")");
        
       // out.print(ans);
     try
       {
       
          ResultSet rs = DBLoader.executeQuery("select * from restaurant_food_items where food_item_id="+iid);
         
          if(rs.next())
          {
            String itemname=rs.getString("item_name");
            int offerprice=rs.getInt("offer_price");
            int price=rs.getInt("price");
            String photo=rs.getString("photo");
            int qty=1;
            int amt=qty*offerprice;
            ArrayList<Cart> al=null;
            if(request.getSession().getAttribute("cart")==null)
            {
                al=new ArrayList();
            }
            else
            {
                al=(ArrayList <Cart>)request.getSession().getAttribute("cart");
            }
            boolean flag=false;
            int index;
            Cart singleitem=null;
            int i=-1;
                        for(i=0;i<al.size();i++)
                        {
                            singleitem = al.get(i);
                            int iid1= singleitem.itemid; 
                            if(iid==iid1)
                            {
                                flag=true;
                                break;
                            }
                         }
                        if(flag==false)
                        {
                            Cart obj=new Cart(iid,price,offerprice,qty,amt,itemname,photo);
                            al.add(obj);
                        }
                        else
                        {
                           int qty1=singleitem.qty; 
                           qty=qty1+qty;
                           amt=qty*offerprice;
                                                       Cart obj=new Cart(iid,price,offerprice,qty,amt,itemname,photo);

                         al.set(i,obj);
                        }
                       request.getSession().setAttribute("cart",al);
                        out.print("success");
                        for(int j=0;j<al.size();j++){
                            System.out.println("*********************"+al.get(j).itemname+" "+al.get(j).qty);
                        }
          }
          else
          {
        
          
          }
  
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
        
    }
}