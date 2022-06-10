<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/home1.css">
<link rel="stylesheet" href="css/temp1.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

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
 <%
 
     try
 {
    
    	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
	     HttpSession sess = request.getSession();
	
	  int uid=Integer.parseInt((String)sess.getAttribute("id"));
	
	   String inst="select *from Property_data where id="+uid;
	  Statement s = con1.createStatement();
	  ResultSet rs = s.executeQuery(inst);
	  
	  if(rs.next())
	  {
	  
	  do
	  {
		  String p_id=""+rs.getInt("pid");
		   %>
<a href='details2.jsp?pid=<%=p_id%>'>

<div class="propery-content" style="background-color:lightgray; position:relative; top:100px;">
<img class="home-images" src="images/<%=rs.getString("url1")%>"/>
<h2><%=rs.getString("ptype") %></h2>
<p>Property Id:- <%=rs.getString("pid") %></p>
<p>Rent: <%=rs.getString("rent") %> </p>
<p>Deposit: <%=rs.getString("deposit") %> </p>
<a href='delete_prop.jsp?pid=<%=p_id%>'>  <input type="button" value="delete"> </a>
 <a href='update_prop.jsp?pid=<%=p_id%>'>  <input type="button" value="update"> </a>
  </a>
</div> 

<% 
	
		   
		   
	  }while(rs.next());
	  }
	  else
	  {
		     response.sendRedirect("/Nextdoor/listing_empty.html");
	  }
    	 
 }
 catch(Exception e)
 {
	 
 }
 
 %>
</body>
</html>