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
		width: 70%;
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
	   document.location.href="agree1";
		
	   
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
			 System.out.println("hello");
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
            String inst="select *from agreement";
            Statement s=con1.createStatement();
            ResultSet rs=s.executeQuery(inst);
    
          if(rs.next())
          {
		  do
		  {
			  
			    String inst1="select *from Signup where uid="+rs.getInt("oid");
	            Statement s1=con1.createStatement();
	            ResultSet rs1=s1.executeQuery(inst1);
	            String inst2="select *from Signup where uid="+rs.getInt("tid");
	            Statement s2=con1.createStatement();
	            ResultSet rs2=s2.executeQuery(inst2);
	            rs1.next(); rs2.next();
	        	HttpSession sess1 = request.getSession();
				sess1.setAttribute("aid",rs.getInt("aid"));
	    
			
			 
		%>
		 <section class="main-container">
			<h2><b>Agreement Id: </b> <%=rs.getInt("aid") %></h2>
			  <h3> <b>Owner's Name: </b> <%=rs.getString("oname") %></h3>
			  <h3 style="position:relative; top:-3.5rem; left:200px;"><b> Owner's  Email Id: </b> <%=rs1.getString("email") %></h3>
			 
			  	<h3 style="position:relative; top:-3.5rem; left:0px;"><b> Tenant's Name:</b> <%=rs.getString("tname") %></h3>
			  	 <h3 style="position:relative; top:-7rem; left:200px;"> <b> Tenant's Email Id: </b> <%=rs2.getString("email") %></h3>
			  
			<a href="agreement_success_admin.jsp?aid=<%=rs.getInt("aid") %> "><button style="position:relative; top:-7rem; left:0px;"type="submit">View Agreement</button> </a>
       
 	<button type="button" style="position:relative; top:-7rem; left:100px;" onclick="fun()" > Delete Agreement</button>
  
		
		</section>
	
			<%
		  }while(rs.next());
		  
		  
		}
          else
          {
          	%>
        	  <img src="images/doc.jpg" style="position:absolute; top:400px; left:700px;">
			   <h4 style="position:absolute; top:530px; left:650px;"> No  Rent Agreements !! </h4>
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