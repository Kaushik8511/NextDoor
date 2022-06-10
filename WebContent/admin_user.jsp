<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>users</title>
  <!-- BOOTSTRAP STYLES-->
       <script src="https://smtpjs.com/v3/smtp.js">
    </script>
 
    <link href="css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="css/custom.css" rel="stylesheet" />
    <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
  <link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
  <link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<link href="CSS/feedback.css" rel="stylesheet" />
   <style type="text/css">
       .image {
          width:150px;
          height:60px;
       }
   </style>
   
</head>
<body>

	<div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img class="image" src="images/logo.jpg" />

                    </a>
                    
                </div>
              
                <span class="logout-spn" >
                  <a href="home.jsp" style="color:#fff;">LOGOUT</a>  

                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 


                  <li class="active-link">
                        <a href="AdminHome.html" >Home </a>
                    </li>
                              

                    <li>
                        <a href="userList.jsp">Users  </a>
                    </li>
                    <li>
                        <a href="Agreement_admin.jsp">Agreements  </a>
                    </li>


                  <li>
                        <a href="admin_feedback.jsp">Feedbacks</a>
                    </li>
                      <li>
                        <a href="complaint.jsp">Complaints</a>
                    </li>

                   
                    
                </ul>
                            </div>

        </nav>
        <!-- /. NAV SIDE  -->

        <!--************************** content start here *************************************** -->
        <div id="page-wrapper" >
            <div id="page-inner">
                
                <%
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
 
		int uid=Integer.parseInt(request.getParameter("uid"));
		  String inst="select * from Signup where uid="+uid;
		  
		  
		  Statement s = con1.createStatement();
		  ResultSet rs = s.executeQuery(inst);
		  boolean feed = false;	
		  

		  while(rs.next())
		  {
			feed = true;
			String name = rs.getString("name");
			
			String id = rs.getString("email");
			
		%>
		<div class="feed">
				<h2 class="feed-head" id="user_name"><%=name %></h2>
				<p class="feed-desc" id="user_email"><%=id %> </p>
			
		</div>
		
		               <div class="col-sm-12 form-group">
                                <label for="message"> Message:</label>
                                <textarea class="form-control" type="textarea" id="message" name="message" maxlength="6000" rows="7"></textarea>
                            </div>
              <div class="row" style="position:absolute; left:315px; top:400px;">
                            <div class="col-sm-12 form-group">
                                <button type="button" onclick="send_email()" class="btn btn-lg btn-default pull-right" >Send &rarr;</button>
                            </div>
                        </div>
		
		
		<%
		  }
		  
		  
		}
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		} %>
                
            </div>
          </div>

<!-- ************************************ content end here*********************************** -->
        </div>        
    
             <!-- /. PAGE INNER  -->
            
         <!-- /. PAGE WRAPPER  -->
        
    <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  copyrights
                </div>
            </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="js/custom.js"></script>
    
       <script>
    function send_email()
           {
    	    var email=document.getElementById("user_email").innerHTML;
    	    var name=document.getElementById("user_name").innerHTML;
    	    var message=document.getElementById("message").value;
    	    //console.log(email);
              //val=Math.floor(1000+Math.random()*9000); 
              Email.send({
            	  Host : "smtp.gmail.com",
                  Username : "chiragmodi2207@gmail.com",
                  Password : "Modich@123",
                  To : email,
                  From : "chiragmodi2207@gmail.com",
                  Subject : "Nextdoor Admin Message",
                  Body : "Dear "+name +", <br> <br>  <br> Message:- <br>"+message+"<br> <br> Regards,<br> Nextdoor." 
              });              
              alert("message sent successfully");
 }
           
         </script>
    
  

</body>
</html>