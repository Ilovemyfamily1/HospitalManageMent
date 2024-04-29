<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>appointmentForm</title>
  <meta name="viewport" content="width=device-width, intial-scale=1.0">
  <style type="text/css">
	body
	{
   		background-image: url("../assets/appointmentForm.jpg");
   		background-attachment: fixed;
   		background-repeat: no-repeat;
   		background-size: cover;
	}
	form
	{ 
       	margin-left:35%;
       	margin-top:6%; 
       	
       	padding-left:40px;
       	padding-top:10px;
	}
	input
	{
   		padding:3px;
   		margin:2px;
	}
	select
	{ 
   		width:173px;
   		height:27px;
	}
	#date,#time
	{
	    width:160px;
   		height:17px;
	}
  </style>
</head>
<body>  
   <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select doctor_name from doctor");
   %>	
   <form action="Appointment.jsp">
        <h1>Appointment</h1>
    	<label for="id">AppointmentID</label><br>
    		<input type="text" id="id" name="id" required><br>
    		
    	<label for="dname">Doctor Name</label><br>
    	<select id="dname" name="dname" required>
    	    <option>...Choose doctor...</option>
        <%while(rs.next()){ %>
            <option><%=rs.getString(1) %></option>
        <%} %>
        </select><br>
        
    	<label for="pname">Patient Name</label><br>
    		<select id="pname" name="pname" required>
    		<option>...Choose patient...</option>
    	    <%ResultSet rs1=st.executeQuery("select patient_name from patient");	
    	    while(rs1.next())
    		{
        	%>
            	<option><%=rs1.getString(1) %></option>
        	<% } %>
        	</select><br>
    
    	<label for="date">Date</label><br>
    		<input type="date" id="date" name="date" required><br>
    
    	<label for="time">Time</label><br>
    		<input type="time" id="time" name="time" required><br>
    
    	<input type="submit" value="Register">
    
  </form>
</body>
</html>