

import java.beans.Statement;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveFeedback
 */
@WebServlet("/remove")
public class RemoveFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
 
			int fid = Integer.parseInt(request.getParameter("fid"));
			String st1 = "delete from feedback where fid ="+fid;
			java.sql.Statement s = con1.createStatement();
			s.executeUpdate(st1);
			response.sendRedirect("admin_feedback.jsp");
				} 
		
		catch (Exception e)
		{	
			System.out.println( e.getMessage());
		}
	}

}
