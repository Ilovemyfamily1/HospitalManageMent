<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../Error/Doctor.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%
   int id=Integer.parseInt(request.getParameter("id"));
   String name=request.getParameter("name");
   String specialization=request.getParameter("specialization");
   long contact=Long.parseLong(request.getParameter("contact"));
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
   PreparedStatement ps=con.prepareStatement("insert into doctor(id,doctor_name,specialization,contact)values(?,?,?,?)");
   ps.setInt(1,id);
   ps.setString(2,name);
   ps.setString(3,specialization);
   ps.setLong(4,contact);
   
   ps.execute();
   
   out.print("<h1>Saved successfully...</h1>");
  %>

</body>
</html>