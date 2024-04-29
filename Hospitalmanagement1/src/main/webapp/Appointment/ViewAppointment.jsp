<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, intial-scale=1.0">
  <title>Appointments</title>
  <style type="text/css">
	body
	{
  		background-image: url("../assets/viewAppoinment.jpg");
  		background-size: cover;
  		background-repeat: no-repeat;
  		background-attachment: fixed;
	}
	table
	{ 
   		margin-left:6%;
   		margin-top:6%;
   		border-color: white;   
	}
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
    ResultSet rs=st.executeQuery("select * from appointment");
   %>
   <table border="2" cellpadding="5" cellspacing="2">
        <thead>
             <th>AppointmentId</th>
             <th>Doctor Name</th>
             <th>Patient Name</th>
             <th>Date</th>
             <th>Time</th>
             <th>Remove</th>
         </thead>
         <tbody>
         <% while(rs.next()){ %>
              <tr>
                 <td><%=rs.getInt(1) %></td>
                 <td><%=rs.getString(2)%></td>
                 <td><%=rs.getString(3)%></td>
                 <td><%=rs.getString(4)%></td>
                 <td><%=rs.getString(5)%></td>
                 <td><a href="DeleteAppointment.jsp?id=<%=rs.getInt(1)%>">delete</a></td>
              </tr>
          <% } %>
         </tbody>
</table>
</body>
</html>