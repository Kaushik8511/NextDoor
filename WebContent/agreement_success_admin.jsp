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
   
   <style>
.address
{
   position:relative;
   top:180px;
   left:50px;
   height:250px;
   width: 250px;
   background-color: rgb(212, 211, 211);
   box-shadow: 0 0 10px darkgrey;
   border-radius: 5px;

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

int aid=Integer.parseInt(request.getParameter("aid"));
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");

String inst="select taddr1,taddr2,tcity,tpcode,oaddr1,oaddr2,ocity,opcode from agreement where aid="+aid;
Statement s1=con1.createStatement();
ResultSet rs=s1.executeQuery(inst);
rs.next();


%>
            
            <div style="position:relative; top:40px; left:0px; height:1300px; ">

  
    <p style="position:relative; font-size:25px; text-decoration: underline; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; top:80px; left:30px;"> Rent Agreement Home Delivery </p>
    <img src="images/agreement.jpg" style="position:relative; top:110px; left:30px;">
    <a href="agreement_desc_admin.jsp?aid=<%=aid %>"  style="position:relative; top:110px; text-decoration: underline; left:60px;">  Agreement</a>
    <p style="position:relative; top:160px; font-size:25px; text-decoration: underline; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; left:30px;">   Delivery Address </p>
   
     
    <div class="address">

 <br>
   <p style="margin-left:20px;"> Landlord's Address</p> <br>
   <p style="margin-left:20px;"> <%=rs.getString("oaddr1") %>, </p> 
   <p style="margin-left:20px;"> <%=rs.getString("oaddr2") %>, </p>
    <p style="margin-left:20px;"> <%=rs.getString("ocity") %>, </p>
     <p style="margin-left:20px;"> <%=rs.getString("opcode") %> </p>
  
  
     
        </div>
        <div class="address" style="position:absolute; top:295px; left:350px;">

  <br>
   <p style="margin-left:20px;"> Tenant's Address</p> <br>
   <p style="margin-left:20px;"> <%=rs.getString("taddr1") %>, </p> 
   <p style="margin-left:20px;"> <%=rs.getString("taddr2") %>, </p>
    <p style="margin-left:20px;"> <%=rs.getString("tcity") %>, </p>
     <p style="margin-left:20px;"> <%=rs.getString("tpcode") %> </p>
 
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