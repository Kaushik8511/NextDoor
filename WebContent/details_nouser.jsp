<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/details.css">
    <link rel="stylesheet" href="css/home1.css">
     <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
    />
    <link rel="stylesheet" href="css/swiper.min.css" />
    <link rel="stylesheet" href="css/easyzoom.css" />
    <link rel="stylesheet" href="css/main.css" />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    
   
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
      
       <script type="text/javascript">
		function cartCall() {
		    document.location.href="login.html";
		}
		function contactCall() {
		    document.location.href="chat";
		}
	</script>  
      
    
</head>
<body style="background-color:lightgray;">

 <div id="div1">  
        <img src="images/logo.jpg" id="img" alt=""> 
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
        <li id="id71"> <a href="search.jsp"> Search Property</a>
        <li id="id5" ><a href="Contactus.html"  >Contact us</a></li>
        <li id="id6" ><a href="aboutus.html"  >About us</a></li>
        <li> <a href="login.html" id="li1">Post Property Free</a></li>
            
       
    	<li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Login_Session" >Login   |</a></li>
        <li style="position:absolute; left:1270px; top:0px; height:60px; padding-top: 15px;" id="id8"  ><a href="Register.html" >SignUp</a></li>
                              
     </ul>
    
 </div>
 <%
	try
	{
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
     HttpSession sess = request.getSession();
	
	 // int uid=Integer.parseInt((String)sess.getAttribute("id"));
	   
	  //System.out.println("user id is: "+uid);
	  
	    int pid=Integer.parseInt(request.getParameter("pid"));
	    sess.setAttribute("pid",""+pid);
		 
	  String inst="select * from Property_data where pid="+pid;
	  
	  
	  Statement s = con1.createStatement();
	  ResultSet rs = s.executeQuery(inst);
		
	  
	  while(rs.next())
	  {
		
		   
			 String buttonContent = "Add to Favorite";
			
			  
	%>
	
	  
    <div style="position:absolute; top:100px; left:200px;  height:auto; width:1000px; padding:10px; background-color: darkgray;  border-radius: 10px; border-width: 20px; border-color: red;">
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
      
    </div>
  <button class="btn btn-primary" type="submit" onclick="cartCall()"><%=buttonContent %></button>  	
  
  	  <button class="btn btn-primary" type="submit" onclick="contactCall()">Contact owner</button>
	
    </div>
    <%
	  }
	}
	catch(Exception e)
	{
	  System.out.println(e.getMessage());
	}
	%>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/swiper.min.js"></script>
    <script src="js/easyzoom.js"></script>
    <script src="js/main.js"></script>
 
   

</body>
</html>