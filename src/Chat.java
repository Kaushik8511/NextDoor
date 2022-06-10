
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



@WebServlet("/chat")

public class Chat extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		
			  HttpSession sess = request.getSession();
		//	  int uid=Integer.parseInt((String)sess.getAttribute("id"));
			  int pid=Integer.parseInt((String)sess.getAttribute("pid"));
			
		  
			  
		 
		// response.sendRedirect("chatboat.jsp?pid="+pid+"&uid="+uid);
			  response.sendRedirect("chatboat.jsp?pid="+pid);
				
		 }		
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
	

	
}
}
