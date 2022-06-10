<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="css/temp1.css">
<link rel="stylesheet" href="css/home1.css">

</head>
<body style="background-color:gray;">

 <div id="div1">  
        <img src="images/logo.jpg" id="img" alt=""> 
     <ul>   
          
 
  <li id="id2" ><a href="main1.jsp"  >Home |</a></li>
         <li id="id3" style="position: absolute; left:200px;" ><a href="Add_list.html" >Add Listing |</a></li>
         <li id="id4" style="position: absolute; left:310px;" ><a href="#"  >Customer Services |</a></li>
         <li id="id71" style="position: absolute; left:490px;"> <a href="Agreement.jsp"> Property Services |</a>
      <li id="id71" style="position: absolute; left:650px;"> <a href="mylisting.jsp"> My Listings |</a>

         <li id="id5" style="position: absolute; left:760px;" ><a href="myprofile.jsp?e="  >My Account |</a></li>
          
         <li onmouseover="this.style.backgroundColor='#a9a9a9'"> <a href="myfavorite.jsp"  id="id56" style=" position:absolute; left:870px; top:15px; ">My Favorites |</a></li>
         
       
      <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Signout" >Sign out  </a></li>
                              
     </ul>
    
 </div>
 <div style=" position:relative; top:-40px;  left:0px; height:500px; width:1377px;  background-image: url('images/build.jpg'); background-repeat:no-repeat">
 
  <div style="margin-left:500px; margin-top:100px; color:white; font-size:30px;  font-family: Georgia, 'Times New Roman', Times, serif; ">
 
 <%
    HttpSession hs=request.getSession();
    String name=(String)hs.getAttribute("name"); 
    String id=(String)hs.getAttribute("id");
    System.out.println("id: "+id);
    out.print("Welcome to ");
    out.print(name);
    out.print("!");
  %>
  
 </div>
 
 </div>
 
 

   
	<section class="filter">
		<header class="filter-header">
			<h2>Filter</h2>
		</header>
		<div class="filter_content">
			<form action="filter.jsp">
				<div class="form-details">
					<input class="filter_details" type="text" name="location" id="location" placeholder="location">
						
					<select class="filter_details">
						<option value="0">select</option>
						<option value="1">Below 5000</option>
						<option value="2">5000-10000</option>
						<option value="3">10000-15000</option>
						<option value="4">Above 15000</option>
					</select>
					<button type="Submit" class="btn btn-primary btn-sm" style="width: 5rem;">Filter</button>
				</div>
			</form>
		</div>
	</section>




<section class="property-list">
<%
try
{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
 
  String query = "select * from Property_data";
  String location = request.getParameter("location");
  int price = Integer.parseInt(request.getParameter("rent"));
  
  if (!(location.equals("") && price==0)) 
  {
	  if(price != 0) 
	  {
		  if (price == 1) query += " where rent <= 5000";
		  else if (price == 2) query += " where rent > 5000 and rent <= 10000";
		  else if (price == 3) query += " where rent > 10000 and rent <= 15000";
		  else query += " where rent > 15000";
	  }
	  if (!location.equals("") && price != 0) query += " and city like '" + location + "'";
	  if (!location.equals("") && price == 0) query += " where city like '" + location + "'";
  }
  
  System.out.println(query);
  Statement s = con1.createStatement();
  ResultSet rs = s.executeQuery(query);
%>
  <div style="background-color:cyan;">
  
  <% while(rs.next())
  {
	  String pid = ""+rs.getInt("pid");
		
%>
  
<a href='details1.jsp?pid=<%=pid%>'>
<div class="propery-content" style="background-color:lightgray;">
<img class="home-images" src="images/<%=rs.getString("url1")%>"/>
<h2><%=rs.getString("ptype") %></h2>
<p><%=rs.getString("city") %></p>
<p>Rent: <%=rs.getString("rent") %> </p>
<p>Deposit: <%=rs.getString("deposit") %> </p>
</div></a><%
  }
  %>
  </div>
  <% 
}
catch(Exception e)
{
  System.out.println(e.getMessage());
}
%>
</section>
     
     

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>