

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AgreementService
 */
@WebServlet("/agreementService")
public class AgreementService extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	     HttpSession sess = request.getSession();
	 	
		  int oid=Integer.parseInt((String)sess.getAttribute("id"));
		  int pid=Integer.parseInt((String)sess.getAttribute("pid"));
		  
		  
		
		String tname=request.getParameter("tname");
		String temail=request.getParameter("temail");
		String taddr1=request.getParameter("taddr1");
		String taddr2=request.getParameter("taddr2");
		String tcity=request.getParameter("tcity");
		String tpcode=request.getParameter("tpcode");
		
		String oname=request.getParameter("lname");
		String oaddr1=request.getParameter("laddr1");
		String oaddr2=request.getParameter("laddr2");
		String ocity=request.getParameter("lcity");
		String opcode=request.getParameter("lpcode");
		
		String stampAmount = request.getParameter("stampAmount");
		String startDate = request.getParameter("agreementStartDate");
		String duration = request.getParameter("duration");
		
		String rentPaid = request.getParameter("rentPaid");
		String paidType = request.getParameter("paidType");
		
		int rentAmount = Integer.parseInt(request.getParameter("rentAmount"));
		
		int deposit = Integer.parseInt(request.getParameter("deposit"));
		String st;
		
		try
		{
		  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		  java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
	      Statement s1=con1.createStatement();
		  String inst1="select *from Signup where email='"+temail+"'";
		  ResultSet rs1=s1.executeQuery(inst1);
		  rs1.next();
		  int rid=rs1.getInt("uid");
		  System.out.println("hello"+rid);
		  Statement st1=con1.createStatement();
		  st1.executeUpdate("insert into agreement (pid,tid,oid,tname,taddr1,taddr2,tcity,tpcode,oname,oaddr1,oaddr2,ocity,opcode,adate,months,stamp_duty,paid_type,rent,deposit,paid_method) values("+pid+","+rid+","+oid+",'"+tname+"','"+taddr1+"','"+taddr2+"','"+tcity+"','"+tpcode+"','"+oname+"','"+oaddr1+"','"+oaddr2+"','"+ocity+"','"+opcode+"','"+startDate+"',"+duration+","+stampAmount+",'"+rentPaid+"',"+rentAmount+","+deposit+",'"+paidType+"')");
		  System.out.println("agreement added successfully");
		  
		  Statement s2=con1.createStatement();
		  ResultSet rs3=s2.executeQuery("select *from agreement where pid="+pid+" and tid="+rid+" and oid="+oid);
		  rs3.next();
		  int aid=rs3.getInt("aid");
		  
		  response.sendRedirect("agreement_sucess.jsp?aid="+aid);
		 } 
	     catch (Exception e)
		{	
			System.out.println( e.getMessage());
		}

	}

}
