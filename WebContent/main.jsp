<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/temp.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>

<div id="div1">  
        <img class="imglogo" src="images/logo.jpg" id="img" alt=""> 
     <ul>   
          
 
         <li id="id2" ><a href="main.jsp"  >Home</a></li>
         <li id="id3" style="position: absolute; left:250px;" ><a href="Add_list.html" >Add Listing</a></li>
         <li id="id4" style="position: absolute; left:410px;" ><a href="#"  >Customer Services</a></li>
         <li id="id71" style="position: absolute; left:580px;"> <a href="#"> My Listing</a>
         <li id="id5" style="position: absolute; left:700px;" ><a href="#"  >My Account</a></li>
         <li id="id6" ><a href="#"  >Tenant List</a></li>
          
         <li onmouseover="this.style.backgroundColor='#a9a9a9'"> <a href="#"  id="id56" style=" position:absolute; left:950px; top:15px; ">My Favorites</a></li>
         
       
      <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Signout" >Sign out  </a></li>
                               
     </ul>
    
 </div>
 
 <div style="position:relative; top:60px;  left:0px; height:500px; width:1377px;  background-image: url('images/build.jpg'); background-repeat:no-repeat">
 
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
 
 <section class="property-list">
<%
try
{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
    
  String query = "select * from Property_data";
  //System.out.println(query);
  Statement s = con1.createStatement();
  ResultSet rs = s.executeQuery(query);

  
  while(rs.next())
 {
%>
<div class="propery-content">
<img class="home-images" src="images/<%=rs.getString("url1")%>"/>
<div style="position:relative; top:200px;">
<h2><%=rs.getString("ptype") %></h2>
<p><%=rs.getString("city") %></p>
<p>Rent: <%=rs.getInt("rent") %> </p>
<p>Deposit: <%=rs.getInt("deposit") %> </p>
</div>
</div><%
  }
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