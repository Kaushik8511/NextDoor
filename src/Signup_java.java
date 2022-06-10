import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/sub")
public class Signup_java extends HttpServlet
{
	
	protected void service(HttpServletRequest req,HttpServletResponse rep) throws IOException
	{  
       String name=req.getParameter("name");
       String pword=req.getParameter("password");
       String email=req.getParameter("email");
       //System.out.println("name: "+name+"  phone: "+mobile+"  pword: "+pword+"  email: "+email);
	    
         PrintWriter pw=rep.getWriter();
         try
         {
        	
        	 
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	     Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
     	
     	 Statement st1=con1.createStatement();
         Statement st2=con1.createStatement();
         ResultSet rs=st2.executeQuery("select * from Signup where email='"+email+"'");
        
         if(rs.next())
         {
        	 
        	 System.out.println("hello");
        	 rep.sendRedirect("Register_error.html");	  
         }
         else
         {
         
         st1.executeUpdate("insert into Signup values('"+name+"','"+email+"','"+pword+"')");
         rep.sendRedirect("login.html");

         
         } 
         st1.close();
         con1.close();
         }
         catch(Exception e)
         {
        	  System.out.println(e.getMessage());
              
         }
          	}

}
