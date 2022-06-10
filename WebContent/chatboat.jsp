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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

      <script src="https://smtpjs.com/v3/smtp.js">
    </script>
  
  <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap 3 Contact Form - reusable form</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link rel="stylesheet" href="css/form.css" >
        <script src="js/form.js"></script>
 
  <style>
    
     #mobile
     {
       position:absolute;
       top:130px;
       left:900px;
       height:200px;
       width:200px;
       background-color:gray;
       
     }
  </style>
</head>
<body>

      <div id="div1">  
        <img src="images/logo.jpg" id="img" alt=""> 
       
          
 <%
 
     HttpSession hs=request.getSession();
    if(hs.getAttribute("name")==null)
    { 
    %>
         <ul>
        <li id="id2"><a href="home.jsp"  >Home</a></li>
        <li id="id3" ><a href="login.html" >Property Services</a></li>
        <li class="nav-item dropdown" id="id4">
        <a class="nav-link dropdown-toggle drop" style="position:absolute; top:7px;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Customer Service
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="login.html" style="background-color:lightgray; ">Complaint</a>
          <a class="dropdown-item" href="login.html" style="background-color:lightgray;" >Feedback</a>
          
      </li>
      <li id="id71"> <a href="search.html"> Search Property</a>
        <li id="id5" ><a href="Contactus.html"  >Contact us</a></li>
        <li id="id6" ><a href="aboutus.html"  >About us</a></li>
        <li> <a href="login.html" id="li1">Post Property Free</a></li>
        
     	<li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Login_Session" >Login   |</a></li>
        <li style="position:absolute; left:1270px; top:0px; height:60px; padding-top: 15px;" id="id8"  ><a href="Register.html" >SignUp</a></li>
    <% 
    }
    else
    {
    	
    
 %>
    <ul>
  <li id="id2" ><a href="main1.jsp"  >Home |</a></li>
         <li id="id3" style="position: absolute; left:200px;" ><a href="Add_list.html" >Add Listing |</a></li>
          <li id="id4" style="position: absolute; left:310px;" ><a href="#"  >Customer Services |</a></li>
     
           <li id="id71" style="position: absolute; left:490px;"> <a href="Agreement.jsp"> Property Services |</a>
      <li id="id71" style="position: absolute; left:650px;"> <a href="mylisting.jsp"> My Listings |</a>

         <li id="id5" style="position: absolute; left:760px;" ><a href="myprofile.jsp?e="  >My Account |</a></li>
                    
         <li onmouseover="this.style.backgroundColor='#a9a9a9'"> <a href="myfavorite.jsp"  id="id56" style=" position:absolute; left:870px; top:15px; ">My Favorites |</a></li>
         
       
      <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" > <a href="Signout" >Sign out  </a></li>
                              
     </ul>
     <% 
     }
    %>
 </div>
 <% 
 try
{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
      
    int pid=Integer.parseInt(request.getParameter("pid"));
 //   int uid=Integer.parseInt(request.getParameter("uid"));
     
   String inst2="select *from Property_data where pid="+pid;
  
  Statement s = con1.createStatement();
  Statement s1=con1.createStatement();
   ResultSet rs1=s1.executeQuery(inst2);
  
	
   rs1.next();   
  
  int id=rs1.getInt("id");
  String inst="select * from Signup where uid="+id;
  ResultSet rs = s.executeQuery(inst);
  rs.next();
  
 /* Statement s2=con1.createStatement();
  String inst3="select *from Signup where uid="+uid;
  ResultSet rs2=s2.executeQuery(inst3); */
  


    %>
 
  <div class="container">
            <div class="row">
                <div class="col-md-6 " id="form_container">
                     
                    <p> Please send your message below. We will get back to you at the earliest! </p>
                    <form role="form" method="post" id="reused_form">
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label for="message"> Message:</label>
                                <textarea class="form-control" type="textarea" id="message" name="message" maxlength="6000" rows="7"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label for="name"> Your Name:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="email"> Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <button type="button" onclick="send_email()" class="btn btn-lg btn-default pull-right" >Send &rarr;</button>
                            </div>
                        </div>
                    </form>
                    <div id="success_message" style="width:100%; height:100%; display:none; "> <h3>Posted your message successfully!</h3> </div>
                    <div id="error_message" style="width:100%; height:100%; display:none; "> <h3>Error</h3> Sorry there was an error sending your form. </div>
                </div>
            </div>
        </div>
       
         <div id="mobile">
         
         <img src="images/mobile.jpg" style="position:relative; top:20px; left:70px; height:50px; width:50px;">
         
        <br> <br>
        <h5 style="position:relative; left:40px; color:white; font-weight:bold; font-size:15px;"> Mobile Number</h5>
        
        <br>
        
        <p style="position:relative; left:40px; color:white;  font-size:10px;"> +91<%=rs1.getString("mno") %></p>
         </div>
 
       <div id="mobile" style="top:350px;">
         
         <img src="images/email.jpg" style="position:relative; top:20px; left:70px; height:50px; width:50px;">
         
        <br> <br>
        <h5 style="position:relative; left:70px; color:white; font-weight:bold; font-size:15px;"> Email ID</h5>
        
        <br>
        
        <p  id="mail"  style="position:relative; left:50px; color:white;  font-size:10px;"> <%=rs.getString("email") %></p>
      <p id="name_c" style="visibility:hidden;"> <%=rs.getString("name")%> </p>
      <p id="prop_id" style="visibility:hidden;"> <%=rs1.getInt("pid")%> </p>
      
         </div>
 
  
     

    <br> <br>
      <script>
    function send_email()
           {
    	    var email=document.getElementById("mail").innerHTML;
    	    var name=document.getElementById("name").value;
    	    var email_client=document.getElementById("email").value;
    	    var message=document.getElementById("message").value;
    	    var name_c=document.getElementById("name_c").innerHTML;
    	    var pid=document.getElementById("prop_id").innerHTML;
    	    //console.log(email);
              //val=Math.floor(1000+Math.random()*9000); 
              Email.send({
            	  Host : "smtp.gmail.com",
                  Username : "chiragmodi2207@gmail.com",
                  Password : "Modich@123",
                  To : email,
                  From : "chiragmodi2207@gmail.com",
                  Subject : "Nextdoor conversation",
                  Body : "Dear "+name_c +", <br> <br> <br>  Renter Name:- "+name+"<br><br> Renter's Email_ID:- "+email_client+" <br> <br> Your Property Id: "+pid+"<br> <br> Message:- <br>"+message+"<br> <br> Regards,<br> Nextdoor." 
              });              
              alert("message sent successfully");
 }
           
         </script>
    
  
    <%
}
     catch(Exception e)
     {
    	 
     }
    %>
    
</body>
</html>