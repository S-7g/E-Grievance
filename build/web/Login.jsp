<%-- 
    Document   : Login
    Created on : 09-Sep-2023, 11:52:09 pm
    Author     : smita
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
String username1=request.getParameter("username1");
String password1=request.getParameter("password1");
try{  
 Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
    PreparedStatement ps=con.prepareStatement("select * from manager where username=? and password=?");
ps.setString(1, username1);
ps.setString(2, password1);        
ResultSet rs =ps.executeQuery();    
if(rs.next())  
{
response.sendRedirect("newreg.html");

}
else
{
response.sendRedirect("error.jsp");
}   
con.close();  
}catch(Exception e){ 
System.out.println(e);
    }
%>
    </body>
</html>
