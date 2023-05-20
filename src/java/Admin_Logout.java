

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import vmm.RDBMS_TO_JSON;
import javax.servlet.http.HttpSession;
import java.io.*;
//import java.sql.Date;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import static javax.print.attribute.Size2DSyntax.MM;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.Cart;
import vmm.DBLoader;
import vmm.sendsms;


public class Admin_Logout extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        
        // Step 1
        response.setContentType("text/html");
        
        //Step 2
        PrintWriter out = response.getWriter();
      
      
      
         HttpSession session=request.getSession();
      
       session.setAttribute("username",null);
       System.out.print("admin logged out"+" username="+(String)session.getAttribute("username"));
        out.print("success");
    }
}