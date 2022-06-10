
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/agree")

public class agreement_delete extends HttpServlet 
{
	protected void doGet(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try
		  {
			  HttpSession hs=req.getSession();
			  System.out.print("hello");
			  int aid=(int)hs.getAttribute("aid");
			  System.out.println("aid: "+aid);
			  
			  
			 
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		     
	    	 Statement st1=con1.createStatement();
	    	 st1.executeUpdate("delete from agreement where aid="+aid);
	    	 
	         
	    	 System.out.println("remove successfully");
	    	 
	    	 rep.sendRedirect("Agreement.jsp?aid="+aid);
	    	 
	    	 
		  }
		  catch(Exception e)
		  {
			 System.out.println(e.getMessage());  
		  }
	

	
}
}





