import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/comp")
public class Complaint_user extends HttpServlet
{
	
	public void service(HttpServletRequest req,HttpServletResponse rep)
	{
		
		  String date=req.getParameter("date");
		  String name=req.getParameter("name");
		  String email=req.getParameter("email");
		  String  mno= req.getParameter("mno");
		  String pname=req.getParameter("pname");
		  String comp=req.getParameter("compl");
		  
		   
		  
		 // System.out.println("file: "+file);
		  
		  try
		  {
			   HttpSession hs=req.getSession();
			   int uid=Integer.parseInt((String)hs.getAttribute("id"));
			   
			  
			  PrintWriter pw=rep.getWriter();
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		     
	    	 Statement st1=con1.createStatement();
	    	 st1.executeUpdate("insert into complaint (doc,name,email,mno,person_name,comp,uid) values('"+date+"','"+name+"','"+email+"','"+mno+"','"+pname+"','"+comp+"',"+uid+")");
	         
	    	 System.out.println("inserted successfully");
	    	 
	    	 pw.println("<script>");
	    	 pw.println("alert(\" Complaint Filed Successfully \")");
	    	 pw.println("</script>");
	    	 
	    	 rep.sendRedirect("Complaint.html");
	    	 
	    	 
		  }
		  catch(Exception e)
		  {
			 System.out.println(e.getMessage());  
		  }
	     		  
		  //System.out.println("uid: "+uid+"  ptype:- "+ptype+"  addr1: "+addr1+"  addr2: "+addr2+" city: "+city+"state: "+state+" pcode: "+pcode+" area: "+area+" deposit: "+d+" date: "+date);
		  
		  
		  
		  
	}

}
