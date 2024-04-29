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
  <title>Doctors details</title>
  <style type="text/css">
	body
	{
  		background-image: url("../assets/viewDoctor1.webp");
  		background-size: cover;
  		background-repeat: no-repeat;
  		background-attachment: fixed;
	}
	table
	{
  	 	margin-left:4%;
   		margin-top:4%;
   		width:90%;
   		border: rgb(193,223,234);
   		
	}
	td
	{ 
	
	a
	{
  		text-decoration: none;
  		color:black;
	}
  </style>
</head>
<body>
  <% 
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from doctor");   
  %>
  <table border="2" cellpadding="5" cellspacing="2">
        <thead>
             <th>id</th>
             <th>Doctor Name</th>
             <th>Specializtion</th>
             <th>Contact</th>
             <th>Update</th>
             <th>Remove</th>
         </thead>
         <tbody>
         <%while(rs.next()){ %>
              <tr>
                 <td><%=rs.getInt(1) %></td>
                 <td><%=rs.getString(2)%></td>
                 <td><%=rs.getString(3)%></td>
                 <td><%=rs.getLong(4)%></td>
                 <td><a href="UpdateDoctorForm.jsp?id=<%= rs.getInt(1)%>">update</a></td>
                 <td><a href="DeleteDoctor.jsp?id=<%=rs.getInt(1)%>">delete</a></td>
              </tr>
         <% } %>
         </tbody>
   </table>
</body>
</html>