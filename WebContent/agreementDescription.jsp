<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agreement</title>
<link rel="stylesheet" type="text/css" href="css/agree1.css">
<link rel="stylesheet" href="css/home1.css">
<link rel="stylesheet" href="css/temp1.css">

</head>
<body>

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
	  int aid=Integer.parseInt(request.getParameter("aid"));
	 System.out.println(aid);
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			  java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
		        
		  String inst="select * from agreement where aid="+aid;
		  
		  
		  Statement s = con1.createStatement();
		  ResultSet rs = s.executeQuery(inst);
		  
		//  String aid, oid, tid, stampAmount, startDate, propId, duration, rentAmount, deposit;
			rs.next();
		  
	/*	  while(rs.next())
		  {
			 aid = rs.getString("agreementId");
			 oid = rs.getString("ownerId");
			 tid = rs.getString("tenantId");
			 stampAmount = rs.getString("stampAmount");
			 startDate = rs.getString("startDate");
			 propId = rs.getString("propId");
			 duration = rs.getString("duration");
			 rentAmount = rs.getString("rentAmount");
			 deposit = rs.getString("deposit"); 
		
		  }
		  */
	/*	  String own = "select * from userTable where emil = '" + oid + "'";
		  Statement s1 = c.createStatement();
		  ResultSet rs1 = s1.executeQuery(own);
		  String oName, oAddress, tName, tAddress;
		  while (rs1.next()) {
			  oName = rs1.getString("name");
			  oAddress = rs1.getString("address");
		  }
		  
		  String tenant = "select * from userTable where emil = '" + tid + "'";
		  Statement s2 = c.createStatement();
		  ResultSet rs2 = s2.executeQuery(tenant);
		  while (rs2.next()) {
			  tName = rs2.getString("name");
			  tAddress = rs2.getString("address");
		  }
		  
		  
		  System.out.println(tName); */
		  
		  %>
		  <section class="agree" >
		  
		  <p id="watermark" > NextDoor </p>
		  <h2 style="position:relative; left:260px; Text-decoration:underline;"> Rent Agreement</h2>
		  
		  <div>
			<img id="imgsrc" src="images/agree.jpg">
		</div>
		<p>THIS AGREEMENT is made on this <mark> <%=rs.getString("adate") %> </mark>, by and between:</p>


		<p><mark><%=rs.getString("oname") %></mark>, having permanent residence at <mark><%=rs.getString("oaddr1") %></mark> , herein referred to as the LANDLORD which expression, shall unless repugnant to the context or meaning there of, mean and include it's successors and assigns) of the FIRST PART.</p><br><br>
		<p>AND</p><br><br>

		<p><mark><%=rs.getString("tname") %></mark>, having permanent residence at <mark><%=rs.getString("taddr1") %></mark>, herein referred to as the TENANT which expression, shall unless repugnant to the context or meaning thereof, mean and include it's successors and assigns) of the SECOND PART.</p><br>

		<p>Whereas</p><br>

		<p>1. The Landlord is the absolute owner and in physical possession of the 'Premises' situated at <mark><%=rs.getString("oaddr1") %></mark>, consisting of inbuilt fittings and fixtures and inventory of equipments as detailed in Annexure 1</p>

		<p>2. The Landlord, as the absolute owner of the property has all the rights to rent out the said 'Premises' or any part thereof at such terms and conditions as he may think fit at his sole discretion.</p>

		<p>The Tenant is desirous to take on rent the said €™ for the purposes of residence and the Landlord has agreed to the same in accordance with the terms and conditions laid henceforth;</p>

		<br>
		<p>Terms & Conditions</p>
		<br>
		<p>1. Term <br>
1.1. That the term of this Agreement shall be <mark><%=rs.getInt("months") %></mark> months, which shall commence on  <mark><%=rs.getString("adate") %></mark>(hereinafter referred to as the 'Effective Date') and shall remain in effect for a period of <mark><%=rs.getInt("months") %></mark> months up to  , unless otherwise terminated in accordance with this Agreement. Thereafter, the same may be extended further on mutual consent of both the parties.</p>

		<script>
			n = new Date();
			y = n.getFullYear();
			m = n.getMonth() + 1;
			d = n.getDate();
			document.getElementById("date").innerHTML = m + "/" + d + "/" + y;
			document.getElementById("cdate").innerHTML = m + "/" + d + "/" + y;
		</script>

		<p>2. Rent <br>
2.1. That the Tenant agrees to pay to the Landlord a sum of <mark><%=rs.getInt("rent") %></mark>  per month as rent for the rented 'Premises'. The rent shall be paid in advance. The Tenant shall make such payment in lieu of the rent on or before the 7 th of each calendar month.</p>

<p>3. Security Deposit <br>
3.1. That the Tenant, upon execution of this Agreement, shall pay to the Landlord a sum of Rs. <mark><%=rs.getInt("deposit") %></mark></p>


<p>4. Use of 'Premises'<br>
4.1. That the rented 'Premises' shall be used by the Tenant solely for the purposes of Residence. <br>
4.2. That the Tenant agrees to comply with all the present and future laws, ordinances and regulations of any public authority relating to the use of the 'Premises'. The Tenant further agrees to comply with any Rules, Regulations, Laws, Bye-laws of the Municipal Corporation or any other local authority having jurisdiction over the 'Premises'.</p>

	<p>5. Utilities and Taxes <br>

5.1. That the Landlord undertakes to pay all taxes and any other charges of a public nature which may be assessed against the property of which, the rented 'Premises' covered by this Rent Agreement forms a part. <br>

5.2. That the Tenant undertakes to pay all charges related to the electricity or water charges in lieu of the rented 'Premises' and any other charges of a recurring nature save and except those covered under the clause 5.1 of this Agreement. <br>

5.3. That the monthly maintenance charges towards maintenance of property shall be paid by the Landlord.</p>

<p>6. Maintenance and Condition <br>

6.1. The Tenant agrees to maintain the rented €˜Premises in good and habitable conditions during the term of this Agreement. <br>
6.2. The Tenant in case of any major problem, malfunction, or damages (except minor issues and normal wear and tear as covered in Clause 15 b ), upon the rented €˜Premises€™ shall notify to the Landlord about the same and the Landlord after getting notified of such issue shall take such measures within a reasonable amount of time to fix the same.
</p>

<p>7. Alterations and Modifications <br>

7.1.The Tenant shall not be allowed to make structural alterations and modifications relating to the rented €˜Premises without taking prior permission from the Landlord, but the Tenant can install air-conditioners in the space provided and other electrical gadgets and make such changes for the purposes as may be necessary, at his/her own cost. The Landlord represents that the Premises possesses the adequate electrical infrastructure to cater for the electrical appliances including the air conditioners. On termination of the tenancy or earlier, the Tenant shall be entitled to remove such equipments and restore the changes made, if any, to the original state.</p>

<p>8. Assignment <br>

8.1.That the Tenant shall not sublet, assign or part with the Premises in whole or part thereof to any person in any circumstances whatsoever and the same shall be used for the bonafide purposes as per this Agreement only.</p>

<p>9. Termination <br>

9.1. This Agreement shall terminate on completion of the term as stipulated in clause 1.1 of this Agreement</p>

<p>10.Renewal
10.1.The parties after obtaining prior consent of the other party may enter into a new Agreement in this regard as per the terms and conditions then established between the parties with regard to such renewal.</p>

<p>11. Force Majeure <br>

11.1. Neither party shall be held liable for failure to perform any of its rights and obligations under this Agreement, if such acts of failure are due to any act of God, fire, earthquake, floods, or any natural calamities or transportation embargoes, civil commotion, riots, violence, acts of terrorists, state enemies, or any other similar reasons or circumstances beyond the control of the parties.</p>

<p>
	12. Governing Law and Dispute Resolution <br>

12.1. This agreement shall be constructed and interpreted in accordance with the laws of India. Gujarat Courts, to the exclusion of all other Courts elsewhere in India, shall have jurisdiction to try any dispute arising out of this Agreement. <br>

12.2. In case any dispute or difference arises between the Parties in connection with any matter relating to this agreement, including termination thereof, then at the option of the Parties, the same shall be referred to arbitration by a Sole Arbitrator appointed by landlord. The decision of the sole arbitrator shall be final and binding on the Parties. The provisions of the Arbitration and Conciliation Act, 1996 and Amendments, if any, thereto shall be applicable to such arbitration. The place of Arbitration shall be Himatnagar.
</p>

<p>
	13. Amendment/ Waiver <br>

13.1. Neither Party shall be entitled to amend or modify any of the terms and conditions of this Agreement unless otherwise specifically agreed to in writing between the Parties. <br>

13.2. No failure to exercise and no delay in exercising any right or remedy under this Agreement shall operate as a waiver thereof. No waiver or consent here under shall be applicable to any events, acts, circumstances except those specifically covered thereby.
</p>

<p>14. That the Landlord hereby assures to the covenants with the Tenant that: <br>

a. The Tenant as herein contained, shall be entitled to peaceful and quiet enjoyment of the Premises€™ during the period of this Rent Agreement, free from any interference, interruption, or unreasonable objection from the Landlord.<br>

b. The Landlord shall indemnify and keep the Tenant fully indemnified and held harmless from and against all damages, liabilities, costs and expenses caused to or incurred by the Tenant as result of any defect in the title of the Landlord, which disturbs or interferes with the possession and enjoyment of the Premises by the Tenant under the covenants herein before contained.<br>

c. In the event the Landlord transfers, alienates or encumbers or otherwise how so ever disposes of or deals with the €˜Premises€™ or any part thereof or its right, title and interest therein during the terms of the present Agreement, or further extended period, the Landlord shall intimate the Tenant about the same in writing and the future owner or successor-in-title of the €˜Premises shall be bound to honor the terms of this Agreement, including further extensions as stated here in above and Landlord shall get an undertaking from the said purchaser / transferee to that effect.<br>

d. The Landlord shall acknowledge and give valid receipts/invoices for each payment made by the Tenant to the Landlord, which shall be treated as conclusive proof of such payments.<br>

e. The Premises€™ is free from all encumbrances and the Landlord has not entered into any agreement or arrangement for disposing or dealing with the premises or any part thereof/or the Landlord€™s title, right, and interest in the Premises in any manner, so as to cause hindrance in peaceful enjoyment of the property by the Tenant, during the validity of the Agreement.<br>

f. The Landlord confirms that in case for any reason whatsoever the premises in reference or any part thereof cannot be used for the purposes mentioned in the Agreement, because of any earthquake, civil commotion, or due to any natural calamity or if the Premises is acquired compulsorily by any authority, over which the Tenant has no control, the Tenant shall have the right to terminate the Agreement forthwith and vacate the premises and the Landlord shall refund the security deposit or the rent received in advance to the Tenant forthwith.<br>

g. The Landlord represents that the Premises€™ is free from all construction defect(s), including but not limited to all moisture related construction defects such as leakage, cracks in house walls including that of compound walls, breakage of floor tiles, etc.<br>

h. The Landlord represents that he/she has complied with all the statutory payments of the property including that of taxes, penalties if any and statutory dues to the local authority including but not limited to municipality, village panchayat, development authority, departments of electricity, sewage and/ or water. The Landlord also represents that there is no charge due (including mortgage) on the Premises€™ which would affect the peaceful possession of Premises by the Tenant.</p>


<p>15. That the Tenant hereby assures to the covenants with the Landlord that: <br>

a. That the Tenant will keep the Landlord harmless and keep him/her exonerated from all losses (whether financial or life), damage, liability or expense occasioned or claimed by reasons of acts or neglects of the Tenant or his/her visitors, employees, whether in the Premises€™ or elsewhere in the building, unless caused by the negligent acts of the Landlord.<br>

b. The Tenant shall maintain the Premises in good and tenable condition and all the minor repairs (including wear and tear) such as leakage in the sanitary fittings, water taps and electrical usage etc. shall be carried out by the Tenant. That it shall be the responsibility of the Tenant to hand over the vacant and peaceful possession of the €˜Premises€™ on expiry of the Agreement, or on its early termination, as stated here in above in the same condition subject to natural wear and tear.<br>

c. That in case, where the €˜Premises is not vacated by the Tenant, at the termination of the Rent period/Agreement, the Tenant will pay damages calculated at two times the rent for any period, of occupying of the Premises€™ commencing from the expiry of the Agreement/rent period. The payment of damages as aforesaid will not preclude the Landlord from initiating legal proceedings against the Tenant for recovering possession of €˜Premises€™ or for any other purpose.<br>

d. That the Landlord shall hold the right to visit in person or through his/her authorized agent(s), servants, workmen etc., to enter upon the €˜Premises for inspection (not exceeding once in a month) or to carry out repairs / construction, as and when required, by giving a 24 hours notice to the Tenant.</p>

<p>16. That both the parties shall observe and adhere to the terms and conditions contained here in above.</p>

<p>17. That the Tenant and Landlords represent and warrant that they are fully empowered and competent to make and sign this Rent Agreement.</p>

<p>18. That the Rent Agreement will be registered in front of registrar and the charges towards stamp duty, court fee & lawyer/coordinator will be equally borne by the Landlord & Tenant.</p>

<p>19. Notices breakage

19.1. The notices and any other communication issued in pursuance of this Agreement by either Party shall be sent to the registered address of the other Party as has been designated above.</p>
		  <a href="javascript:window.print()"  ><input type="button" value="print" id="print"> </a>
		  
		  
		  </section>
		  <%
			
		}
		catch(Exception e)
		{
		  System.out.println(e.getMessage());
		}
		%>
		  
</body>
</html>