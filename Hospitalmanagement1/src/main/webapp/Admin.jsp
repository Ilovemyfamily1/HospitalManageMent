<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, intial-scale=1.0">
 <title>Hospital.com</title>
 <style type="text/css">
    #images,#count
    {
       display:flex;
       justify-content: space-around;
    }
    
    nav
    {
       background-color:rgba(22,134,159,543);
       height:10%;
       color: orange;
       margin-bottom:100px;  
 	}
	select
	{
  	   appearance:none;
   	   border: none;
       background-color: transparent;
       padding:20px;
	}
	a
	{
  	   text-decoration: none;
       color: black;   
	}
	a,big,select,h1
	{
	   font-size: 1.2vw;
	}
	
 </style>
</head>
<body>
   <%
   String username=request.getParameter("username");
   String password=request.getParameter("password");
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
   
   Statement st=con.createStatement();
   ResultSet rs1=st.executeQuery("select * from doctor ");
   int doctorsCount=0;
   while(rs1.next())doctorsCount++;
   ResultSet rs2=st.executeQuery("select * from patient ");
   int patientsCount=0;
   while(rs2.next())patientsCount++;
   ResultSet rs3=st.executeQuery("select * from appointment");
   int appointmentsCount=0;
   while(rs3.next())appointmentsCount++;
   
   PreparedStatement ps=con.prepareStatement("select * from admin where username=? and password=?");
   ps.setString(1,username);
   ps.setString(2,password);
   
   ResultSet rs=ps.executeQuery();
   
   if(!rs.next())
   {
	   out.print("<h1>entered credentials are invalid</h1>");
	   RequestDispatcher rd=request.getRequestDispatcher("Home.html");
	   rd.include(request, response);
   }
   
   else
   {     
	%>
   <nav>
        <big>Hospital Management System</big>
		<select onchange="window.location.href=this.value;">
		   	<option value="" selected disabled>Doctor</option>
		   	<option value="Doctor/DoctorForm.html">AddDoctor</option>
		    <option value="Doctor/ViewDoctor.jsp">ViewDoctor</option>
		</select>
		<select onchange="window.location.href=this.value;">
			<option value="" selected disabled>Patient</option>
			<option value="Patient/PatientForm.html">AddPatient</option>
			<option value="Patient/ViewPatient.jsp">ViewPatient</option>
		</select >

		<select onchange="window.location.href=this.value;">
			<option value="" selected disabled>Appointment</option>
			<option value="Appointment/AppointmentForm.jsp">AddAppointment</option>
			<option value="Appointment/ViewAppointment.jsp">ViewAppointment</option>
		</select>
		<a href="Home.html">LogOut</a>
   </nav>
   <% } %>
   <section>
		<div id="images">
        	<image src="assets/doctor.jpg"/ alt="image not found" style="width:20%;height:30%;" >
        	<image src="assets/patientLogo1.png"/ alt="image not found" style="width:30%;height:30%;" >
        	<image src="assets/appointLogo.png"/ alt="image not found" style="width:20%;height:20%;" >
   		</div>
   		<div id="count">
   		       <h1><%= doctorsCount %></h1>
   		       <h1><%= patientsCount %></h1>
   		       <h1><%= appointmentsCount %></h1>
   		</div>

   </section>

</body>
</html>