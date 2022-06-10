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



	<link rel="stylesheet" type="text/css" href="css/details.css">
    
	<link rel="stylesheet" href="css/swiper.min.css" />
    <link rel="stylesheet" href="css/easyzoom.css" />
    <link rel="stylesheet" href="css/main.css" />
   
   <style type="text/css">
       .image {
          width:150px;
          height:60px;
       }
   </style>
    <style>
      table {
        width:100%;
      }
      table, th, td {
       /* border: 1px solid black; */
       border-bottom: 1px solid black;
        border-collapse: collapse;
      }
      th, td {
        padding: 15px;
        text-align: left;
      }
      #t01 tr:nth-child(even) {
        background-color: #eee;
      }
      #t01 tr:nth-child(odd) {
       background-color: #fff;
      }
      #t01 th {
        background-color: black;
        color: white;
      }
      </style>
      
    
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
        
        </div>
        <!-- /. NAV SIDE  -->

        <!--************************** content start here *************************************** -->
<div id="page-wrapper" >
            <div id="page-inner">
            
            
                
             <%
	try
	{
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
	     HttpSession sess = request.getSession();
	   
	  //int uid=Integer.parseInt((String)sess.getAttribute("id"));
	   
	  //System.out.println("user id is: "+uid);
	  int uid=Integer.parseInt(request.getParameter("uid"));
	  System.out.println("uid:  "+uid);
	  String inst1="select *from Signup where uid="+uid;
	  Statement s1=con1.createStatement();
	  ResultSet rs3=s1.executeQuery(inst1);
	  rs3.next();
	  %>
		<div class="feed">
		<h2 class="feed-head"><%=rs3.getString("name") %></h2>
		<p class="feed-desc"><%=rs3.getString("email") %> </p>
		
</div>
<h3 style="margin-left: 5px;">Assets</h3>
  <%
	    int pid=Integer.parseInt(request.getParameter("pid"));
	    sess.setAttribute("pid",""+pid);
	    
		String inst="select * from Property_data where pid="+pid;
	  
	  
	  Statement s = con1.createStatement();
	  ResultSet rs = s.executeQuery(inst);
		
	  
	  while(rs.next())
	  {
		
		/*     String check="select * from favorite where pid="+pid+" and uid = "+uid;
		  
			 String buttonContent = "Add to Favorite";
			 Statement s1 = con1.createStatement();
			  ResultSet rs1 = s1.executeQuery(check);
			  if(rs1.next()) buttonContent = "Remove From Favorite";
	     */
			  
	%>
	
	  
    <div style="position:relative; top:0px; left:0px;  height:auto; width:1000px; padding:10px; background-color: darkgray;  border-radius: 10px; border-width: 20px; border-color: red;">
    <div class="product__carousel">
      
      <div class="gallery-parent">
        <!-- SwiperJs and EasyZoom plugins start -->
        <div class="swiper-container gallery-top">
          <div class="swiper-wrapper">
            <div class="swiper-slide easyzoom easyzoom--overlay">
              <a href="images/<%=rs.getString("url1")%>">
                <img src="images/<%=rs.getString("url1")%>" alt="" />
              </a>
            </div>
            <div class="swiper-slide easyzoom easyzoom--overlay">
              <a href="images/<%=rs.getString("url2")%>">
                <img src="images/<%=rs.getString("url2")%>" alt="" />
              </a>
            </div>
            <div class="swiper-slide easyzoom easyzoom--overlay">
              <a href="images/<%=rs.getString("url3")%>">
                <img src="images/<%=rs.getString("url3")%>" alt="" />
              </a>
            </div>
            </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next swiper-button-white"></div>
          <div class="swiper-button-prev swiper-button-white"></div>
        </div>
        <div class="swiper-container gallery-thumbs">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img src="images/<%=rs.getString("url1")%>" alt="" />
            </div>
            <div class="swiper-slide">
              <img src="images/<%=rs.getString("url2")%>" alt="" />
            </div>
            <div class="swiper-slide">
              <img src="images/<%=rs.getString("url3")%>" alt="" />
            </div>
           </div>
        </div>
        <!-- SwiperJs and EasyZoom plugins end -->
       
      </div>
      <br> <br>
      <h2 Style="color:black;"> Property Desription:- </h2>
     <br>
     <p Style="color:white;"> <%=rs.getString("p_desc")%> </p>
    
    
      <br>
      <h2 Style="color:black;"> Property Specification:- </h2>
      <br>
      <table id="t01">
        <tr>
          <td>Property Type</td>
          <td><%=rs.getString("ptype")%></td>
           </tr>
        <tr>
          <td>Address</td>
          <td><%=rs.getString("addr1") %></td>
         </tr>
        <tr>
          <td>Near Location</td>
          <td><%=rs.getString("addr2") %></td>
          </tr>
           <tr>
          <td>City</td>
          <td><%=rs.getString("city") %></td>
          </tr>
     
         <tr>
          <td>State</td>
          <td><%=rs.getString("stat") %></td>
          </tr>
     <tr>
          <td>Pincode</td>
          <td><%=rs.getString("pcode") %></td>
          </tr>
     <tr>
          <td>Date Of Availability</td>
          <td><%=rs.getString("a_data") %></td>
          </tr>
     <tr>
          <td>Rent(Monthly)</td>
          <td><%=rs.getString("rent") %></td>
          </tr>
          <tr>
          <td>Deposit</td>
          <td><%=rs.getString("deposit") %></td>
          </tr>
     
     
      </table>
     <br>
    <a href="admin_user.jsp?uid=<%=uid %>"><input type="button" value="Contact With User" style="background-color:lightblue; border:none; width:200px;"> </a>
    </div>
    </div>

    <%
	}
	}
	catch(Exception e)
	{
	  System.out.println(e.getMessage());
	}
	%>
    
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/swiper.min.js"></script>
    <script src="js/easyzoom.js"></script>
    <script src="js/main.js"></script>

	
</body>
</html>