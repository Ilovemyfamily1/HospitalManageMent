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
  <title>Patients details</title>
  <meta name="viewport" content="width=device-width, intial-scale=1.0">
  <style type="text/css">
	body
	{
 		background-image: url("../assets/viewPatients.jpg");
  		background-size: cover;
  		background-repeat: no-repeat;
  		background-attachment: fixed;
	}
	table
	{ 
  	 	margin-left:50%;
   		margin-top:7%;
   		border-color: rgb(59,184,239); 
   		padding:10px; 
	}
	td
	{
	  padding-left:10px;
	}
	a
	{
  		text-decoration: none;
  		color:black;
	}
  </style>
</head>
<body>
    <table border="2" cellpadding="10" cellspacing="2">
        <thead>
             <th>PatientId</th>
             <th>Patient Name</th>
             <th>Address</th>
             <th>Gender</th>
             <th>Contact</th>
             <th>Remove</th>
         </thead>

    <% 
  	 Class.forName("com.mysql.cj.jdbc.Driver");
   	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
   	 Statement st=con.createStatement();
   	 ResultSet rs=st.executeQuery("select * from patient");
   	 while(rs.next())
     {	   
   	%>
         <tbody>
              <tr>
                 <td><%=rs.getInt(1) %></td>
                 <td><%=rs.getString(2)%></td>
                 <td><%=rs.getString(3)%></td>
                 <td><%=rs.getString(4)%></td>
                 <td><%=rs.getLong(5)%></td>
                 <td><a href="DeletePatient.jsp?id=<%=rs.getInt(1)%>">delete</a></td>
              </tr>
         </tbody>
     <% } %>
   </table>
</body>
</html>