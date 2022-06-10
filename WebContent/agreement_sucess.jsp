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
<style>
.address
{
   position:relative;
   top:180px;
   left:50px;
   height:250px;
   width: 250px;
   background-color: rgb(212, 211, 211);
   box-shadow: 0 0 20px darkgrey;
   border-radius: 5px;

}
</style>

</head>
<body>
<%

int aid=Integer.parseInt(request.getParameter("aid"));
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");

String inst="select taddr1,taddr2,tcity,tpcode,oaddr1,oaddr2,ocity,opcode from agreement where aid="+aid;
Statement s1=con1.createStatement();
ResultSet rs=s1.executeQuery(inst);
rs.next();


%>
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
 <div style="position:relative; top:40px; left:0px; height:1300px; background-color: rgb(161, 217, 235);">

   <p style="position:relative; top:50px; left:30px;"> *Your agreement will be delivered within 7 working days post purchase. </p>
 
    <p style="position:relative; font-size:25px; text-decoration: underline; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; top:80px; left:30px;"> Rent Agreement Home Delivery </p>
    <img src="images/agreement.jpg" style="position:relative; top:110px; left:30px;">
    <a href="agreementDescription.jsp?aid=<%=aid %>"  style="position:relative; top:110px; text-decoration: underline; left:60px;"> My Agreement</a>
    <p style="position:relative; top:160px; font-size:25px; text-decoration: underline; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; left:30px;">   Delivery Address </p>
   
     
    <div class="address">

 <br>
   <p style="margin-left:20px;"> Landlord's Address</p> <br>
   <p style="margin-left:20px;"> <%=rs.getString("oaddr1") %>, </p> 
   <p style="margin-left:20px;"> <%=rs.getString("oaddr2") %>, </p>
    <p style="margin-left:20px;"> <%=rs.getString("ocity") %>, </p>
     <p style="margin-left:20px;"> <%=rs.getString("opcode") %> </p>
  
  
     
        </div>
        <div class="address" style="position:absolute; top:387px; left:350px;">

  <br>
   <p style="margin-left:20px;"> Tenant's Address</p> <br>
   <p style="margin-left:20px;"> <%=rs.getString("taddr1") %>, </p> 
   <p style="margin-left:20px;"> <%=rs.getString("taddr2") %>, </p>
    <p style="margin-left:20px;"> <%=rs.getString("tcity") %>, </p>
     <p style="margin-left:20px;"> <%=rs.getString("tpcode") %> </p>
 
        </div>
   
     
 </div>
 
 
 

</body>
</html>