import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/fav")
public class delete_fav extends HttpServlet
{
	
	public void service(HttpServletRequest req,HttpServletResponse rep)
	{
		
//		 Cookie cookies[]=req.getCookies();
//		   int id=0;
//		   for(Cookie c : cookies)
//		   {
//			    
//			     if(c.getName().equals("id"))
//			     {
//			    	  System.out.println("hello");
//			    	    id=Integer.parseInt(c.getValue());
//			    	   
//			       }
//		   }
		
		  int pid=Integer.parseInt(req.getParameter("pid"));
	      HttpSession hs=req.getSession();
		  int uid=Integer.parseInt((String)hs.getAttribute("id"));
		  
		  
		   
		  
		  
		  try
		  {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		     
	    	 Statement st1=con1.createStatement();
	    	 st1.executeUpdate("delete from favorite where uid="+uid+" and pid="+pid);
	    	 
	         
	    	 System.out.println("remove successfully");
	    	 
	    	 rep.sendRedirect("myfavorite.jsp");
	    	 
	    	 
		  }
		  catch(Exception e)
		  {
			 System.out.println(e.getMessage());  
		  }
	     		  
		  //System.out.println("uid: "+uid+"  ptype:- "+ptype+"  addr1: "+addr1+"  addr2: "+addr2+" city: "+city+"state: "+state+" pcode: "+pcode+" area: "+area+" deposit: "+d+" date: "+date);
		  
		  
		  
		  
	}

}
