<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>my profile</title>
<link rel="stylesheet" href="css/home1.css">
<link rel="stylesheet" href="css/temp1.css">
   <link rel="stylesheet" href="css/login.css">

<script>
var flag=0;
 function myaction()
 {
	 document.getElementById("name").disabled=false;
	 document.getElementById("e1").disabled=false;
	 document.getElementById("p1").disabled=true;
	 document.getElementById("s11").disabled=false;
	 document.getElementById("update").disabled=false;

	 
 }
 
 function pass_change()
 {
	 if(flag==0)
		 {
	 document.getElementById("p1").style.visibility="hidden";
	 document.getElementById("p11").style.visibility="visible";
	 document.getElementById("p12").style.visibility="visible";
	 document.getElementById("l1").style.visibility="visible";
	 document.getElementById("l2").style.visibility="visible";
	 document.getElementById("ps1").style.visibility="hidden";
	 
	 flag=1;
		 }
	 else if(flag==1)
		 {
		 document.getElementById("p1").style.visibility="visible";
		 document.getElementById("p11").style.visibility="hidden";
		 document.getElementById("p12").style.visibility="hidden";
		 document.getElementById("l1").style.visibility="hidden";
		 document.getElementById("l2").style.visibility="hidden";
		 document.getElementById("ps1").style.visibility="visible";
		  flag=0;
		 }
 }
 
</script>

</head>
<body>

<%

try
{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
     HttpSession sess = request.getSession();

  int uid=Integer.parseInt((String)sess.getAttribute("id"));
   
  //System.out.println("user id is: "+uid);
    //int pid=Integer.parseInt(request.getParameter("pid"));
    //sess.setAttribute("pid",""+pid);
	 
  String inst="select * from Signup where uid="+uid;
  
  
  Statement s = con1.createStatement();
  ResultSet rs = s.executeQuery(inst);
	
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

      <div class="main1" >

            <div class="main2" >

       <fieldset>

                     <legend>
     
                     <h1> Account Information </h1>
                    </legend>
                   
                    <br> 
                    
                    <form action="info">
                      <input type="button" value="Edit details" id="s1" onclick="myaction()" >
                      <br> <br>
                      
                  
                    Full Name* <br>
                    <input type="text" name="name" id="name"  value="<%=rs.getString("name") %>" disabled > 
                    <br> <br>
                    
                    Email ID * <br>
                    <input type="email" name="email" id="e1" value="<%=rs.getString("email") %>" disabled> 
                    <br> <br>
                 <label id="ps1">   Password * </label>
                    <br>
                    <input type="password" name="pword" id="p1"  value="<%=rs.getString("pword") %>">
                    <input type="button" value="Change Password" id="s11" onclick="pass_change()" disabled>
                    
                    <p style="position:absolute; top:600px; left:700px;" id="message" > <%=request.getParameter("e") %> </p>
                    
                    <br>
                    <br>
                   <label id="l1" style="visibility:hidden;"> Enter Password * </label> <br>
                     <input type="password" name="pword1" id="p11" style="visibility:hidden;">
                     
                    <br>
                    
                    <br>
                     <label id="l2" style="visibility:hidden;">  Confirm Password * </label> <br>
                      <input type="password" name="pword2" id="p12"  style="visibility:hidden;">
                    <br>
                    
                      
                    <input type="submit" value="Update" id="update"  disabled>
                    </form>
                    <br>
                    <br>
                    <br>
                    <br>
                
                     
  
  
  
                </fieldset>
                
                 </div>
                 </div>
                 
   <%
   }
 catch(Exception e)
 {
	 
 }
   %>
    

   

</body>
</html>