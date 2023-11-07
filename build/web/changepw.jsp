<%-- 
    Document   : ragistration
    Created on : 13-Sep-2023, 1:20:00 am
    Author     : smita
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }catch(ClassNotFoundException e)
    {
        e.printStackTrace();
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           
          String adminname=request.getParameter("username");
          String password=request.getParameter("password");
          String newpassword=request.getParameter("npass");
          try{  
          Class.forName("oracle.jdbc.driver.OracleDriver");  
          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");  
          PreparedStatement ps = con.prepareStatement("Update registration set password=? where password=? and username=?");
            ps.setString(1,newpassword);
          
            ps.setString(2, password);  
            ps.setString(3, adminname);      
         ps.executeUpdate();
                    out.println("Password Changed");
                }
                catch(Exception e){
                    e.printStackTrace();
                }
         %>
    </body>
</html
