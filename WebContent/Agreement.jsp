<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agreements list</title>
<link rel="stylesheet" href="css/home1.css">
<link rel="stylesheet" href="css/temp1.css">


<style type="text/css">
	body {
		background-color: #f8f8f8;
		margin: 0;
		padding: 0;
	}
	h2 {
		font-size: 1.5rem;
		margin-left: auto;
		margin-right: auto;
		margin-top: 0;
	}
	
	h3 {
		font-size: 1rem;
		font-weight: 300;
	}

	.main-container {
		background-color: white;
		width: 60%;
		margin: 10rem auto;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
		border-radius: 1rem;
		height:180px;
		padding: 1rem;
	}
	
	button {
		background-color: powderblue;
		padding: 5px;
		border: none;
		font-size: 1.2rem;
		border-radius: 5%;
	}
	
	button:hover {
		background-color: skyblue;
		padding: 7px;
		cursor: pointer;
	}
</style>

 <script>
 
   function fun()
   {
	   document.location.href="agree";
		
	   
   }
 </script>
</head>
<body>
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
			   HttpSession sess = request.getSession();
				
		    int uid=Integer.parseInt((String)sess.getAttribute("id"));
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			  java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		     
		  String inst1="select * from agreement where oid="+uid;
		  
		  
		  Statement s1 = con1.createStatement();
		  ResultSet rs1 = s1.executeQuery(inst1);
		  
		  
		 	
		if(rs1.next())
		{
		  
		  do
		  {
			 int aid = rs1.getInt("aid");
			 int oid = rs1.getInt("oid");
			 int tid = rs1.getInt("tid");
			 
			 Statement s2=con1.createStatement();
			 ResultSet rs2=s2.executeQuery("select * from Signup where uid="+oid);
			 
			 Statement s3=con1.createStatement();
			 ResultSet rs3=s3.executeQuery("select * from Signup where uid="+tid);
			 rs2.next(); rs3.next();
				HttpSession sess1 = request.getSession();
				sess.setAttribute("aid", aid);
			       
		%>
     	 <section class="main-container">
			<h3><b>Agreement Id: </b> <%=rs1.getInt("aid") %></h3>
			  <h3> <b>Owner's Name: </b> <%=rs1.getString("oname") %></h3>
			  <h3 style="position:relative; top:-2rem; left:230px;"><b> Owner's  Email Id: </b> <%=rs2.getString("email") %></h3>
			 
			  	<h3 style="position:relative; top:-2.5rem; left:0px;"><b> Tenant's Name:</b> <%=rs1.getString("tname") %></h3>
			  	 <h3 style="position:relative; top:-4.7rem; left:230px;"> <b> Tenant's Email Id: </b> <%=rs3.getString("email") %></h3>
			  
			<a href="agreement_sucess.jsp?aid=<%=rs1.getInt("aid") %> "><button style="position:relative; top:-5rem; left:0px;"type="submit">View Agreement</button> </a>
       
 	<button type="button" style="position:relative; top:-5rem; left:100px;" onclick="fun()" > Delete Agreement</button>
  
		
		</section>
		<%
		  } while(rs1.next());
		}
		else
		{
			 response.sendRedirect("agree_empty.html");  
		}
		  
		}
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
		%>


</body>
</html>