
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class Restaurant_Add_Item_Servlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
     //  String email=(String)session.getAttribute("email");
        int rid=(Integer)session.getAttribute("restaurant_id");
           
       try
       {
          
        // Receive ALL Files  
          
          Part p1 = request.getPart("iphoto");
          // Part p2 = request.getPart("cprofile");
           String category = request.getParameter("category"); 
        //  String category1 =request.getParameter("category");
          String iname = request.getParameter("iname");
          String idesc = request.getParameter("idesc");
          String price = request.getParameter("price");
          String offerprice = request.getParameter("offerprice");
          
       //  System.out.println("cuisine name="+category1+"cuisine Id="+category);
          String abspath = getServletContext().getRealPath("/foodItemPhoto");
         // String abspath1 = getServletContext().getRealPath("/foodCategoryProfile");
    
          
          String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis()+".jpg");
       //   String filename2 = vmm.FileUploader.savefileonserver(p2, abspath1, System.currentTimeMillis()+".jpg");
        
      //     int rid=0;
           int cid=Integer.parseInt(category);
        //  ResultSet rs = DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\'");
        //  while(rs.next())
        //  {
       //        rid=rs.getInt("restaurant_id");
       //   }
         String category1="";
         ResultSet rs2 = DBLoader.executeQuery("select * from restaurant_food_category where restaurant_category_id ="+cid);
        while(rs2.next())
        {
           category1=rs2.getString("category_name");
       }
        System.out.println("category="+category1);
           System.out.println(cid+" *** "+rid);
          ResultSet rs3 = DBLoader.executeQuery("select * from restaurant_food_items where item_name =\'"+iname+"\' and restaurant_category_id="+cid+" and restaurant_id="+rid);
              if(rs3.next())
              {
                 out.println("duplicate");
              }
              else
              {
                rs3.moveToInsertRow();
                
                rs3.updateInt("restaurant_category_id",cid);
                rs3.updateInt("restaurant_id",rid);
                rs3.updateString("item_name", iname);
                rs3.updateString("category_name", category1);
                rs3.updateString("description",idesc);
                rs3.updateString("photo","foodItemPhoto/"+filename1);
              //  rs3.updateString("photo_profile","foodCategoryProfile/"+filename2);
                rs3.updateString("price",price);
                rs3.updateString("offer_price",offerprice);
                rs3.insertRow();
                
                out.println("success");
              }
        
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}