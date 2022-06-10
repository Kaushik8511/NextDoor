
import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/info")

public class update_account extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		
			  HttpSession sess = request.getSession();
			  int uid=Integer.parseInt((String)sess.getAttribute("id"));
			 // int pid=Integer.parseInt((String)sess.getAttribute("pid"));
			
		  //String check = "select * from favorite where uid="+uid+" and pid="+pid;
			  String name=request.getParameter("name");
			  String email=request.getParameter("email");
			  String p1=request.getParameter("pword1");
			  String p2=request.getParameter("pword2");
			  String p=request.getParameter("pword");
			  	
			  String error="";
			if(name.equals("") || email.equals(""))
			{
				 error="Please Fill all Fields";
				  response.sendRedirect("myprofile.jsp?e="+error);
			}
			else if(!p1.equals(p2))
			{
				  error="Password mismatch";
				  response.sendRedirect("myprofile.jsp?e="+error);
				  
			}
			else
			{
				 System.out.println("hello chirag");
				String query="";
			      if(p1.equals(""))
			      {
			    	    System.out.println(p);
			    	   query ="update Signup set name='"+name+"' , email='"+email+"' , pword='"+p+"' where uid="+uid;
			    	   
			  		  
			      }
			      else
			      {
			    	  System.out.println("2");
			    	  query ="update Signup set name='"+name+"' , email='"+email+"' ,pword='"+p1+"' where uid="+uid;
					    
			      }
			      java.sql.Statement s = con1.createStatement();
				  
				  s.executeUpdate(query);
				  PrintWriter pw=response.getWriter();
				  pw.println("<script type=\"text/javascript\">");
				  pw.println("alert('Account Updated Successfully');");
				  pw.println("</script>");

				 // response.sendRedirect("myprofile.jsp?e=");
				  
			}
		  
			 
		 
		
			 response.sendRedirect("myprofile.jsp?e=");
		 }		
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
	 

	System.out.println("hello world");
}
}
