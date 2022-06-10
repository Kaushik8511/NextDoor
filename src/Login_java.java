import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
   
public class Login_java extends HttpServlet
{
	protected void service(HttpServletRequest req,HttpServletResponse rep)
	{
		   
		   String email=req.getParameter("email");
		   String pword=req.getParameter("pword");
		   
		   try
		   {
			   if(email.equals("admin123@gmail.com") && pword.equals("123"))
			   {
				   rep.sendRedirect("AdminHome.html");
			       
			   }
			   else
			   {
		   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   	    
	         Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		   
	         Statement st1=con1.createStatement();
	         ResultSet rs1=st1.executeQuery("select * from Signup where email='"+email+"' and pword='"+pword+"'");
	         
	         if(rs1.next())
	         {
	        	 String name=rs1.getString("name");
	        	 int d=rs1.getInt("uid");
	        	 
	        	 System.out.println("name: "+name+"  id: "+d);
	        	 
	        	 HttpSession hs=req.getSession();
	        	 hs.setAttribute("name", name);
	        	 hs.setAttribute("id", ""+d);
	        	 
	        	 rep.sendRedirect("main1.jsp");
	        	 
//	        	 Cookie cookie=new Cookie("id",d+"");
//	 			rep.addCookie(cookie);
//	 			
	        	 
	        	 
	         }
	         else
	         {
	        	   rep.sendRedirect("login_error.html");
	         }
		   }
		   }
		   catch(Exception e)
		   {
			   
		   }
		  
		 
	}

}
