
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class Restaurant_Edit_Profile_Servlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
           
       try
       {
          
        // Receive ALL Files  
          
          Part p1 = request.getPart("rcover1");
           Part p2 = request.getPart("rprofile1");
           String city = request.getParameter("city1"); 
          String rname = request.getParameter("rname1");
          String rdesc = request.getParameter("rdesc1");
           String remail = request.getParameter("remail1");
         
            String raddr = request.getParameter("raddr1");
             String rmob = request.getParameter("rmob1");
              String rloc = request.getParameter("rloc1");
               int rmin = Integer.parseInt(request.getParameter("rmin1"));
                int rcharge = Integer.parseInt(request.getParameter("rcharge1"));
                 String rstart = request.getParameter("rstart1");
                  String rend = request.getParameter("rend1");
                   String email=(String)session.getAttribute("email");
            int rid=0;
            ResultSet rs2=DBLoader.executeQuery("select * from restaurant where emailid=\'"+email+"\'");
            if(rs2.next())
            {
               rid=rs2.getInt("restaurant_id");
            }
           
          String abspath = getServletContext().getRealPath("/restaurantCover");
          String abspath1 = getServletContext().getRealPath("/restaurantProfile");
    
          
          String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis()+".jpg");
          String filename2 = vmm.FileUploader.savefileonserver(p2, abspath1, System.currentTimeMillis()+".jpg");
        
//          out.println("File 1 "+filename1);
//System.out.println("File name"+filename1);
         
          //out.println("<h2>All Files Uploaded to Server</h2>");
            
          // Now receive text data
          
          
         // out.println("<h3>Text Data</h3>");
          //out.println("<h4>username : "+un+"</h4>");
          //out.println("<h4>password: "+ps+"</h4>");
          
        
          ResultSet rs = DBLoader.executeQuery("select * from restaurant where restaurant_id=\'"+rid+"\'");
         
          if(!(rs.next()))
          {
              out.println("duplicate");
          }
          else
          {
           
                       
            rs.updateString("city", city);
            rs.updateString("restaurant_name",rname);
            rs.updateString("description",rdesc);
            rs.updateString("emailid",remail);
          //  rs.updateString("password",rpass);
            rs.updateString("address",raddr);
            rs.updateString("mobileno",rmob);
            rs.updateString("location",rloc);
            rs.updateString("status","pending");
            rs.updateInt("min_order_delivery",rmin);
            rs.updateInt("delivery_charges",rcharge);
            rs.updateString("delivery_starts",rstart);
            rs.updateString("delivery_ends",rend);
            if(filename1!=null)
            {
               rs.updateString("photo_wide", "restaurantCover/"+filename1); 
            }   
            if(filename2!=null)
            {
                rs.updateString("photo_square", "restaurantProfile/"+filename2);
            }
            
           rs.updateRow();
            
            if(rid!=0)
            {
                ResultSet rs4=DBLoader.executeQuery("select * from restaurant_cuisine where restaurant_id=\'"+rid+"\'");
               while(rs4.next())
               {
                   rs4.deleteRow();
               }
            } 
                String cids[]=request.getParameter("cids").split(",");
                for(int i=0;i<cids.length;i++)
                {
                    ResultSet rs3=DBLoader.executeQuery("select * from restaurant_cuisine");
                    int cid=Integer.parseInt(cids[i]);
                    ////////
                     rs3.moveToInsertRow();
                     
                       rs3.updateInt("restaurant_id",rid);
                         rs3.updateInt("cuisine_id",cid);
                         
                         rs3.insertRow();
                }
            
            
            out.println("success");
          }
              
        
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}

