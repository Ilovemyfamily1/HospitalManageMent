<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>UpdateDoctorForm</title>
  <meta name="viewport" content="width=device-width, intial-scale=1.0">
  <style type="text/css">
	body
	{
   		background-image: url("../assets/updateDoctorForm.webp");
   		background-attachment: fixed;
  	 	background-repeat: no-repeat;
   		background-size: cover;
	}
	form
	{ 
        margin-left: 41%;
        margin-top:10%; 
        height:30%;
        width:13%;
        padding-left:40px;
        padding-top:10px;
	}
	input
	{
   		padding:3px;
   		margin:2px;
	}
  </style>
</head>
<body>
   <%
    int id= Integer.parseInt(request.getParameter("id"));
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
    PreparedStatement ps=con.prepareStatement("select * from doctor where id=?");
    ps.setInt(1,id);
    
    ResultSet rs=ps.executeQuery();
    if(rs.next())
   %>
   <form action="UpdateDoctor.jsp">
         <h1>UpdateDoctor</h1>
         
         <label for="id">id</label><br>
         	<input type="number" id="id" name="id" readonly="true" value="<%=id%>" required><br>
         	
         <label for="name">Name</label><br>
         	<input type="text" id="name" name="name" value="<%=rs.getString(2)%>" required><br>
         	
         <label for="specialization">Specialization</label><br>
         	<input type="text" id="specialization" name="specialization" value="<%= rs.getString(3)%>" required><br>
         	
         <label for="contact">Contact</label><br>
         	<input type="number" id="contact" name="contact" value="<%= rs.getLong(4)%>" required><br>
         	
         <input type="submit" value="save">    
    </form>

</body>
</html>