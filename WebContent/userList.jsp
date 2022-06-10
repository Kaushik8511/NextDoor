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
   
   <script>
   
   function myfun()
   {
	     alert("User deleted Successfully");
   }
   </script>
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
 
		  String inst="select * from Signup";
		  
		  
		  Statement s = con1.createStatement();
		  ResultSet rs = s.executeQuery(inst);
		  boolean feed = false;	
		  

		  while(rs.next())
		  {
			feed = true;
			String name = rs.getString("name");
			
			String id = rs.getString("email");
			
		%>
			<div class="feed" style=" box-shadow: 0 0 10px lightblue; margin:30px; padding:20px; width:70%;">
			<form action="userDescription.jsp?id=<%=id %>" method="post">
	
				<h2 class="feed-head"><%=name %></h2>
				<p class="feed-desc"><%=id %> </p>
				<button class="remove" type="submit" style="width:200px;">View</button>
		 		 
		</form>
		 <form action="user_del" onload="myfun()">
		   <input type="hidden" name="id" value="<%=id %>">
		  	<button class="remove" type="submit" style="width:200px; position:relative; top:-3.5rem; left:25rem;">Delete</button> 
	        
		  </form>
	
		
		</div>
		 
		<%
		  }
		  if(!feed){ %>
		  <div class="oops">
		  	<img class="img-oops" alt="oops" src="images/ops.jpg">
		  	<h2 class="oops-head">No FeedBack</h2>
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

</body>
</html>