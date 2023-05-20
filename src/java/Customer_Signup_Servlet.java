
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;
import javax.servlet.http.HttpSession;
import vmm.sendsms;

@MultipartConfig
public class Customer_Signup_Servlet extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       response.setContentType("text/html");
    
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();  
       String otp;
           
       try
       {
          
        // Receive ALL Files  
          
          Part p1 = request.getPart("photo");
           String city = request.getParameter("city"); 
          String fullname = request.getParameter("fullname");
         // String rdesc = request.getParameter("rdesc");
           String email = request.getParameter("email");
           String pass = request.getParameter("pass");
            String addr = request.getParameter("addr");
             String mob = request.getParameter("mob");
          String rloc = request.getParameter("rloc");
          String question = request.getParameter("question");
          String answer = request.getParameter("answer");
              
           
          String abspath = getServletContext().getRealPath("/customerPhoto");
        
    
          
          String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis()+".jpg");
        
      
          ResultSet rs = DBLoader.executeQuery("select * from customer_signup where email=\'"+email+"\' and mobileno=\'"+mob+"\'");
         
          if(rs.next())
          {
              out.println("duplicate");
          }
          else
          {
              
            otp= ""+(int)(Math.random()*100000);
            rs.moveToInsertRow();
                       
            rs.updateString("city", city);
            rs.updateString("fullname",fullname);
            rs.updateString("email",email);
            rs.updateString("password",pass);
            rs.updateString("address",addr);
            rs.updateString("mobileno",mob);
            rs.updateString("status","pending");
            rs.updateString("question",question);
            rs.updateString("answer",answer);
            rs.updateString("photo", "customerPhoto/"+filename1);
            rs.updateString("otp",otp);
            rs.insertRow();
           
           
            session.setAttribute("customermobile",mob);
            session.setAttribute("otp",otp);
             
            sendsms.send(mob,"The Otp for Customer Sign Up of freshyyyy is "+otp);
            
            out.println("success");
            }
  
       }
       catch(Exception ex)
       {
           out.println(ex.getMessage());
       }
    }   

}

