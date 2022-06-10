<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Agreement</title>
<link rel="stylesheet" type="text/css" href="css/service.css">
<link rel="stylesheet" href="css/home1.css">
<link rel="stylesheet" href="css/temp1.css">

<script type="text/javascript">
		function fun() {
			alert("Request successfully added");
			return true;
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
         <li id="id71" style="position: absolute; left:490px;"> <a href="#"> Property Services |</a>
      <li id="id71" style="position: absolute; left:650px;"> <a href="mylisting.jsp"> My Listings |</a>

         <li id="id5" style="position: absolute; left:760px;" ><a href="myprofile.jsp?e="  >My Account |</a></li>
                    
         <li onmouseover="this.style.backgroundColor='#a9a9a9'"> <a href="myfavorite.jsp"  id="id56" style=" position:absolute; left:870px; top:15px; ">My Favorites |</a></li>
         
       
      <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Signout" >Sign out  </a></li>
                              
     </ul>
    
 </div>


	<%
	try {
		  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		  HttpSession sess = request.getSession();
		  int id=Integer.parseInt((String)sess.getAttribute("id"));
		
		 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
	     String st1 = "select * from Property_data where id="+id;
		Statement s = con1.createStatement();
		ResultSet rs = s.executeQuery(st1);
		if(!rs.next()) {
			%>
		
			<div class="center">
				<h1>You don't have property.</h1>
			 </div>
			<%
		}
		else {
			%>
			<section class="main-container">
	    	<form action="agreementService" method="post">
	    		<h1>Service Agreement Form</h1>

	    		<div class="content">
	    			<input class="inp" type="email" name="email" placeholder="Tenant Email Address *">
	    			<input class="inp" type="number" name="stampAmount" placeholder="Stamp Duty Denomination *">
	    			<input class="inp" type="text" name="agreementStartDate" onfocus="(this.type='date')" placeholder="Agreement Start Date *">
	    			<input class="inp" type="text" name="propId" placeholder="Property Id *">

	    			<h2>Duration of Tenancy</h2>
	    			<input class="inp" type="number" name="duration" placeholder="Duration in Months *">

	    			<h2>Rent Details</h2>
	    			<p>Rent Paid</p>
	    			<input type="radio" name="rentPaid" id="monthly" value="monthly" >
	    			<label for="monthly">Monthly</label>
	    			<input type="radio" name="rentPaid" id="quarterly" value="quarterly">
	    			<label for="quarterly">Quarterly</label>

	    			<input style="margin-left: 10.5rem;" class="inp" type="number" name="rentAmount" placeholder="Rent Amount *">

	    			<h2>Security Deposit</h2>
	    			<input class="inp" type="number" name="deposit" placeholder="Security Deposit Amount *">
	    			<br>

	    			<p>Paid by</p>
	    			<input type="radio" name="paidType" id="cash" value="cash">
	    			<label for="cash">Cash</label>
	    			<input type="radio" name="paidType" id="check" value="check">
	    			<label for="check">Check</label>
	    		</div>

	    		<button type="submit" onclick="fun()">Submit</button>

	    	</form>
	    </section>
	    <%
		}
	} 
	
	catch (Exception e)
	{	
		System.out.println( e.getMessage());
	}
	%>

</body>
</html>