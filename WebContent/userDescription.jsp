<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>user</title>
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
<link href="css/feedback1.css" rel="stylesheet" />
<link rel="stylesheet" href="css/temp.css">

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
  //String id = "kaushikpra1999@gmail.com";
         String id=request.getParameter("id");
		  String inst="select * from Signup where email = '" + id +"'";
		  
		  
		  Statement s = con1.createStatement();
		  ResultSet rs = s.executeQuery(inst);
		  boolean feed = false;	
		  String name="", uid="";
		  int user_id=0;

		  while(rs.next())
		  {
			feed = true;
			name = rs.getString("name");
			
			uid = rs.getString("email");
			user_id=rs.getInt("uid");
			
		%>
		<div class="feed">
				<h2 class="feed-head"><%=name %></h2>
				<p class="feed-desc"><%=uid %> </p>
				
		</div>
		<h3 style="margin-left: 5px;">Assets</h3>
		
		<%
		 }
		  
		  String prop="select * from Property_data where id= "+user_id;
		  
		  
		  Statement s1 = con1.createStatement();
		  ResultSet rs1 = s.executeQuery(prop);
		 	
			
		  if(rs1.next())
		  {
			  
		  
		  do
		  {
			 
		%>
		<a href="prop_desc_admin.jsp?pid=<%=rs1.getInt("pid") %>&uid=<%=user_id %>" alt="property image">
		<div class="propery-content">
		<img class="home-images" src="images/<%=rs1.getString("url1")%>"/>
		<h2><%=rs1.getString("ptype") %></h2>
		<p><%=rs1.getString("city") %></p>
		<p>Rent: <%=rs1.getInt("rent") %> </p>
		<p>Deposit: <%=rs1.getInt("deposit") %> </p>
		</div></a>
		<%
		  }while(rs1.next());
		  %>
		  

		  <%
		  }
		  else
		  {%>
		  
			  <img src="images/home.jpg" style="position:absolute; top:400px; left:700px;">
			   <h4 style="position:absolute; top:530px; left:650px;"> User have not any property!! </h4>
              <a href="admin_user.jsp?uid=<%=user_id %>"><input style="position:absolute; top:570px; left:650px;" type="button" value="Contact User"> </a>
 
		  <%}
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