import java.io.IOException;
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


@WebServlet("/Signout")

public class Signout extends HttpServlet
{
	protected void service(HttpServletRequest req,HttpServletResponse rep) throws IOException
	{
		   
		  HttpSession hs=req.getSession();
		  hs.invalidate();
		  rep.sendRedirect("home.jsp");
		   
	}

}
