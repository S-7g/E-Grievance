<%-- 
    Document   : queryin
    Created on : 14-Sep-2023, 2:15:27 pm
    Author     : smita
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
         String status = "null";
     
         String name =request.getParameter("employeeName");
         String empid =request.getParameter("employeeId");
         String query =request.getParameter("queryMessage");
         String greid =request.getParameter("grievanceId");
         

         
 try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
         PreparedStatement ps = con.prepareStatement("insert into query values(?,?,?,?,?)");
         
         ps.setString(1, empid);
        ps.setString(2, name);
        ps.setString(3, query);
        ps.setString(4, status);
        ps.setString(5, greid);
         
         ps.executeUpdate();
         
        out.println("Query submitted");
         
 }catch(Exception e){
 e.printStackTrace();
 }
         %>