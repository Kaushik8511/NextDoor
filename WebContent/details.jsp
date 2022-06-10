<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Details</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/details.css">
    <link rel="stylesheet" href="css/home1.css">
	 <script type="text/javascript">
		function cartCall() {
		    document.location.href="cart";
		}
		function contactCall() {
		    document.location.href="chat";
		}
	</script>  
</head>
<body>

<div id="div1">  
        <img  class="images-main" src="images/logo.jpg" id="img" alt=""> 
     <ul>   
        
         <li id="id2" ><a href="main1.jsp"  >Home</a></li>
         <li id="id3" style="position: absolute; left:250px;" ><a href="Add_list.html" >Add Listing</a></li>
         <li id="id4" style="position: absolute; left:410px;" ><a href="#"  >Customer Services</a></li>
         <li id="id71" style="position: absolute; left:580px;"> <a href="#"> My Listing</a>
         <li id="id5"  style="position: absolute; left:700px;" ><a href="#"  >My Account</a></li>
         <li id="id6"><a href="#"  >Tenant List</a></li>
          
         <li onmouseover="this.style.backgroundColor='#a9a9a9'"> <a href="#"  id="id56" style=" position:absolute; left:950px; top:15px; ">My Favorites</a></li>
         
       
      <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Signout" >Sign out  </a></li>
                               
     </ul>
    
   
    
 </div>
 
   
	<section class="Details" style="position:relative; top:30px; background-color:cyan;">
	
	<%
	try
	{
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
	     HttpSession sess = request.getSession();
	
	  int uid=Integer.parseInt((String)sess.getAttribute("id"));
	   
	  System.out.println("user id is: "+uid);
	    int pid=Integer.parseInt(request.getParameter("pid"));
	    sess.setAttribute("pid",""+pid);
		 
	  String inst="select * from Property_data where pid="+pid;
	  
	  
	  Statement s = con1.createStatement();
	  ResultSet rs = s.executeQuery(inst);
		
	  
	  while(rs.next())
	  {
		
		     String check="select * from favorite where pid="+pid+" and uid = "+uid;
		  
			 String buttonContent = "Add to Favorite";
			 Statement s1 = con1.createStatement();
			  ResultSet rs1 = s1.executeQuery(check);
			  if(rs1.next()) buttonContent = "Remove From Favorite";
	
	%>
	<div class="left">
	<img src="images/<%=rs.getString("url1")%>" alt="Image">
	</div>
	<div class="right">
			<div class="content">
				<p>Property type: <%=rs.getString("ptype") %></p>
				<p>Address: <%=rs.getString("addr1") %></p>
				<p>Location: <%=rs.getString("addr2") %> </p>
				<p>City: <%=rs.getString("city") %></p>
				<p>State: <%=rs.getString("stat") %></p>
				<p>Area(in square feet): <%=rs.getString("area") %> </p>
				<p>Available date: <%=rs.getString("a_data") %> </p>
				<p>Rent: <%=rs.getString("rent") %> </p>
				<p>Deposit: <%=rs.getString("deposit") %> </p>
		
			</div>
			
		
			<button class="btn btn-primary" type="submit" onclick="cartCall()"><%=buttonContent %></button>  	
	
		  <button class="btn btn-primary" type="submit" onclick="contactCall()">Contact owner</button>
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