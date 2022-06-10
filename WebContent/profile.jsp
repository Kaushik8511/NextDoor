<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
	<link rel="stylesheet" type="text/css" href="CSS/profile.css">
</head>
<body>

	<%
	HttpSession hs=request.getSession();
    int id=Integer.parseInt((String)hs.getAttribute("id"));
    PrintWriter o = response.getWriter();
	%>
	
	<section class="personal-details">
		<%
		try
		{
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		  
		  String inst="select * from Signup where uid="+id;
		  
		  
		  Statement s = con1.createStatement();
		  ResultSet rs = s.executeQuery(inst);
		 
			
		  
		  while(rs.next())
		  {
		%>
		<h1 class="name title"><%=rs.getString("name") %></h1>
		<p class="email"><%=rs.getString("email") %><p>
		<%
		}
		}
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
		 %>
	</section>

	<section class="own">
		<h2 class="title">Your property</h2>
		<%
		try
		{
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		  
		  String inst="select * from Property_data where id="+id;
		  
		  
		  Statement s = con1.createStatement();
		  ResultSet rs = s.executeQuery(inst);
		 	
		  if(!rs.next()){ %>
		  <p>You do not have any property</p>
		  <%
		  }
		  while(rs.next())
		  {
			
		%>
		<div class="propery-content">
		<img class="home-images" src="images/<%=rs.getString("url1")%>"/>
		<h2><%=rs.getString("ptype") %></h2>
		<p><%=rs.getString("addr1") %></p>
		<p>Rent: <%=rs.getString("rent") %> </p>
		<p>Deposit: <%=rs.getString("deposit") %> </p>
		</div><%
		  }
		}
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
		 %>
		
	</section>

	<section class="cart">
		<h2 class="clear-float title">Favorite Properties</h2>
		<%
		try
		{
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		  	  
		  String inst="select url, ptype, address, rent, deposit from property p inner join favorite f on p.pid=f.psid where f.usid='" + id + "'";
		  System.out.println(inst);
		  
		  
		  Statement s = con1.createStatement();
		  ResultSet rs = s.executeQuery(inst);
		 	
		  if(!rs.next()) { %>
		  <p>No favorite property</p>
		  <%
		  }
		  
		  while(rs.next())
		  {
			
		%>
		<div class="propery-content">
		<img class="home-images" src="images/<%=rs.getString("url1")%>"/>
		<h2><%=rs.getString("ptype") %></h2>
		<p><%=rs.getString("addr1") %></p>
		<p>Rent: <%=rs.getString("rent") %> </p>
		<p>Deposit: <%=rs.getString("deposit") %> </p>
		</div>
		<%
		  }
		}
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
		 %>
		
	</section>
	
	
</body>
</html>