<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    Long contact=Long.parseLong(request.getParameter("contact"));
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","tiger");
    PreparedStatement ps=con.prepareStatement("update doctor set doctor_name=?,specialization=?,contact=? where id=?");
    ps.setString(1,name);
    ps.setString(2,specialization);
    ps.setLong(3,contact);
    ps.setInt(4,id);
    
    ps.executeUpdate();
    
    RequestDispatcher rd=request.getRequestDispatcher("ViewDoctor.jsp");
    rd.forward(request, response);   
   %>
</body>
</html>