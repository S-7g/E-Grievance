<%-- 
    Document   : emp
    Created on : 14-Sep-2023, 1:30:08 pm
    Author     : smita
--%>


<%@page import="java.sql.ResultSet"%>
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
          String username=request.getParameter("username");
          String password=request.getParameter("password");
          try{  
          Class.forName("oracle.jdbc.driver.OracleDriver");  
          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");  
          PreparedStatement ps = con.prepareStatement("select * from employye where username=? and password=?");
          ps.setString(1, username);
          ps.setString(2, password);        
          ResultSet rs =ps.executeQuery();    
          if(rs.next())  
          {
           response.sendRedirect("newreg1.html");
          }
          else
          {
          response.sendRedirect("error.jsp");
          }   
           
          }catch(Exception e){
              System.out.println(e);
}
%>
    </body>
</html>