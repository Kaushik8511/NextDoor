import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/fb")
public class feedback_add extends HttpServlet
{
	
	public void service(HttpServletRequest req,HttpServletResponse rep)
	{
		
	      HttpSession hs=req.getSession();
		  int uid=Integer.parseInt((String)hs.getAttribute("id"));
		 
		   int rate= Integer.parseInt(req.getParameter("rate"));
		   String text=req.getParameter("text");
		   
         		  
		  try
		  {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		     
	    	 Statement st1=con1.createStatement();
	    	 st1.executeUpdate("insert into  feedback(rating,u_id,fb) values("+rate+","+uid+",'"+text+"')");
	         
	    	 System.out.println("inserted successfully");
	    	 
	    	 rep.sendRedirect("feedback.html");
	    	 
	    	 
		  }
		  catch(Exception e)
		  {
			 System.out.println(e.getMessage());  
		  }
	     		  
		  //System.out.println("uid: "+uid+"  ptype:- "+ptype+"  addr1: "+addr1+"  addr2: "+addr2+" city: "+city+"state: "+state+" pcode: "+pcode+" area: "+area+" deposit: "+d+" date: "+date);
		  
		  
		  
		  
	}

}
