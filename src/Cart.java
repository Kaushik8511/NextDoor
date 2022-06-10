
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



@WebServlet("/cart")

public class Cart extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		
			  HttpSession sess = request.getSession();
			  int uid=Integer.parseInt((String)sess.getAttribute("id"));
			  int pid=Integer.parseInt((String)sess.getAttribute("pid"));
			
		  String check = "select * from favorite where uid="+uid+" and pid="+pid;
		  java.sql.Statement s = con1.createStatement();
		  
		  ResultSet rs = s.executeQuery(check);
		  
			  
		 
		String query = "insert into favorite values("+uid+","+pid+")";
		
		java.sql.Statement s1 = con1.createStatement();
		if(rs.next()) {
			query = "delete from favorite where uid="+uid+" and pid = "+pid;
		}
		 s1.executeUpdate(query);
//		 javax.servlet.RequestDispatcher dis = request.getRequestDispatcher("details.jsp");
//			dis.forward(request, response);
//		
		 String p=""+pid;
		 response.sendRedirect("details1.jsp?pid="+p);
		 }		
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
	

	
}
}
