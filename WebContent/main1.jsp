<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
<link rel="stylesheet" href="css/home1.css">
<link rel="stylesheet" href="css/temp1.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body style="background-color:gray;">

<div id="div1">  
        <img class="images-main" src="images/logo.jpg" id="img" alt=""> 
     <ul>   
          
 
         <li id="id2" ><a href="main1.jsp"  >Home |</a></li>
         <li id="id3" style="position: absolute; left:200px;" ><a href="Add_list.html" >Add Listing |</a></li>
        <li class="nav-item dropdown" id="id4">
        <a class="nav-link dropdown-toggle drop" style="position:absolute; top:7px; left:-90px;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Customer Service 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Complaint.html" style="background-color:lightgray; ">Complaint</a>
          <a class="dropdown-item" href="feedback.html" style="background-color:lightgray;" >Feedback</a>
          
      </li>
    <li id="id71" style="position: absolute; left:460px;"> <a href="Agreement.jsp"> | Property Services |</a>
      <li id="id71" style="position: absolute; left:600px;"> <a href="mylisting.jsp"> My Listings |</a>

         <li id="id5" style="position: absolute; left:720px;" ><a href="myprofile.jsp?e="  >My Account |</a></li>
          
         <li onmouseover="this.style.backgroundColor='#a9a9a9'"> <a href="myfavorite.jsp"  id="id56" style=" position:absolute; left:840px; top:15px; ">My Favorites |</a></li>
         
       
      <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Signout" >Sign out  </a></li>
                               
     </ul>
    
 </div>
 
 <div style=" position:relative; top:-40px;  left:0px; height:500px; width:1377px;  background-image: url('images/build.jpg'); background-repeat:no-repeat">
 
  <div style="margin-left:500px; padding-top:150px; margin-top:100px; color:white; font-size:30px;  font-family: Georgia, 'Times New Roman', Times, serif; ">
 
 <%
    HttpSession hs=request.getSession();
    String name=(String)hs.getAttribute("name"); 
    String id=(String)hs.getAttribute("id");
    System.out.println("id: "+id);
    out.print("Welcome ");
    out.print(name);
    out.print("!");
  %>
  
 </div>
 
 </div>
 
 <div style="position:absolute; top: 560px; left:0px; width:1377px; height:40px; background-color:rgb(206, 201, 130);"> </div>
 
 <div style="background-color:cyan;">
 <section class="filter">
		<header class="filter-header">
			<h2>Filter</h2>
		</header>
		<div class="filter_content">
			<form action="filter.jsp">
				<div class="form-details">
					<input class="filter_details" type="text" name="location" id="location" placeholder="location">
						
					<select class="filter_details" name="rent" >
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
	</div>
 
 <br>
<section class="property-list">
<%
try
{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
    
  String inst="select * from Property_data";

  Statement s = con1.createStatement();
  ResultSet rs = s.executeQuery(inst);
 	
	%>
	<div style="background-color:cyan;"> 
  <%
  while(rs.next())
  {
	 String pid = ""+rs.getInt("pid");
	 
	HttpSession sess = request.getSession();
	sess.setAttribute("pid", pid);
%>
<a href='details1.jsp?pid=<%=pid%>'>
<div class="propery-content" style="background-color:lightgray;">
<img class="home-images" src="images/<%=rs.getString("url1")%>"/>
<h2><%=rs.getString("ptype") %></h2>
<p>City:- <%=rs.getString("city") %></p>
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