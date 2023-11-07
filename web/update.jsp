<%-- 
    Document   : update
    Created on : 27-Aug-2023, 12:43:27 am
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
        boolean  Adminidstatus=false;
            String  dept =request.getParameter("dept");
            int GID =Integer.parseInt(request.getParameter("gid"));
            String email =request.getParameter("email");
            String grievance =new String (request.getParameter("grievance"));
            
    try 
    { 
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
            PreparedStatement ps= con.prepareStatement("update grievancee set dept=?,email=?,grievance=? where Gid=?");
            ps.setString(1,dept);
            ps.setString(2,email);
            ps.setString(3,grievance);
            ps.setInt(4,GID);
           ps.executeUpdate();
              out.println("Update done");   
         }catch (Exception e){
         e.printStackTrace();
         }
         %>
        
       
    </body>
</html>