<%-- 
    Document   : greupdate
    Created on : 10-Sep-2023, 12:52:28 am
    Author     : smita
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    String id =request.getParameter("id");
    String status =request.getParameter("up");

 try{
         
         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
         PreparedStatement ps = con.prepareStatement("update query SET status =? WHERE Greid=?");
        
        ps.setString(2, id);
          ps.setString(1, status);
          
          ps.executeQuery();
         out.println("executed");
  }catch(Exception e){
 e.printStackTrace();
 }
%>
    </body>
</html>
