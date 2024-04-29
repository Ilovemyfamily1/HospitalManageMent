<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="../Error/Appointment.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%
   int id=Integer.parseInt(request.getParameter("id"));
   String dname=request.getParameter("dname");
   String pname=request.getParameter("pname");
   String date=request.getParameter("date");
   String time=request.getParameter("time");
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
   PreparedStatement ps=con.prepareStatement("insert into appointment(id,doctor_name,patient_name,date,time)values(?,?,?,?,?)");
   ps.setInt(1,id);
   ps.setString(2,dname);
   ps.setString(3,pname);
   ps.setString(4,date);
   ps.setString(5,time);
   
   ps.execute();
   
   out.print("<h1>Appointment registered successfully...</h1>");
  %>
</body>
</html>