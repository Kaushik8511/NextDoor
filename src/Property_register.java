import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class Property_register extends HttpServlet
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
		
	      HttpSession hs=req.getSession();
		  int uid=Integer.parseInt((String)hs.getAttribute("id"));
		  String ptype=req.getParameter("ptype");
		  String addr1=req.getParameter("address1");
		  String addr2=req.getParameter("addr");
		  String  city= req.getParameter("city");
		  String state=req.getParameter("state");
		  String pcode=req.getParameter("pincode");
		  double area=Double.parseDouble(req.getParameter("area"));
		  int d=Integer.parseInt(req.getParameter("deposit"));
		  int rent=Integer.parseInt(req.getParameter("rent"));
		  String mno=req.getParameter("mno");
		  String date=req.getParameter("date");
		  String url1=req.getParameter("filetext1");
		  String url2=req.getParameter("filetext2");
		  String url3=req.getParameter("filetext3");
		  String desc=req.getParameter("desc");
		  
		   
		  
		 // System.out.println("file: "+file);
		  
		  try
		  {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 Connection con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		     
	    	 Statement st1=con1.createStatement();
	    	 st1.executeUpdate("insert into Property_data (id,ptype,addr1,addr2,city,stat,pcode,area,rent,deposit,a_data,url1,url2,url3,p_desc,mno) values("+uid+",'"+ptype+"','"+addr1+"','"+addr2+"','"+city+"','"+state+"','"+pcode+"',"+area+","+rent+","+d+",'"+date+"','"+url1+"','"+url2+"','"+url3+"','"+desc+"','"+mno+"')");
	         
	    	 System.out.println("inserted successfully");
	    	 
	    	 rep.sendRedirect("listing_success.html");
	    	 
	    	 
		  }
		  catch(Exception e)
		  {
			 System.out.println(e.getMessage());  
		  }
	     		  
		  //System.out.println("uid: "+uid+"  ptype:- "+ptype+"  addr1: "+addr1+"  addr2: "+addr2+" city: "+city+"state: "+state+" pcode: "+pcode+" area: "+area+" deposit: "+d+" date: "+date);
		  
		  
		  
		  
	}

}
