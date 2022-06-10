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
		    document.location.href="cart";
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
 <%
	try
	{
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
	     HttpSession sess = request.getSession();
	
	  int uid=Integer.parseInt((String)sess.getAttribute("id"));
	   
	  System.out.println("user id is: "+uid);
	    int pid=Integer.parseInt(request.getParameter("pid"));
	    sess.setAttribute("pid",""+pid);
		 
	  String inst="select * from Property_data where pid="+pid;
	  
	  
	  Statement s = con1.createStatement();
	  ResultSet rs = s.executeQuery(inst);
		
	  
	  while(rs.next())
	  {
		
		     String check="select * from favorite where pid="+pid+" and uid = "+uid;
		  
			 String buttonContent = "Add to Favorite";
			 Statement s1 = con1.createStatement();
			  ResultSet rs1 = s1.executeQuery(check);
			  if(rs1.next()) buttonContent = "Remove From Favorite";
	
			  
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