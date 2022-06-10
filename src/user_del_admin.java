import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user_del")
public class user_del_admin extends HttpServlet
{
	
	public void service(HttpServletRequest req,HttpServletResponse rep)
	{
		
		
		  
		  
		   
		  
		  
		  try
		  {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		     
	    	 Statement st2=con1.createStatement();
	    	 String mail=(String)req.getParameter("id");
	    	ResultSet rs= st2.executeQuery("select * from Signup where email='"+mail+"'");
	    	rs.next();
	    	
	    	 Statement st1=con1.createStatement();
	    	// String mail=(String)req.getParameter("id");
	    	 st1.executeUpdate("delete from Signup where email='"+mail+"'");
	    	 
	    	
	    	Statement st3=con1.createStatement();
	    	st3.executeUpdate("delete from Property_data where id="+rs.getInt("uid"));
	    	
	    	Statement st4=con1.createStatement();
	    	st4.executeUpdate("delete from agreement where oid="+rs.getInt("uid"));
	    	
	    	
	    	 System.out.println("remove successfully");
	    	 
	    	 rep.sendRedirect("userList.jsp");
	    	 
	    	 
		  }
		  catch(Exception e)
		  {
			 System.out.println(e.getMessage());  
		  }
	     		  
		  //System.out.println("uid: "+uid+"  ptype:- "+ptype+"  addr1: "+addr1+"  addr2: "+addr2+" city: "+city+"state: "+state+" pcode: "+pcode+" area: "+area+" deposit: "+d+" date: "+date);
		  
		  
		  
		  
	}

}
