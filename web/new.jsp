<%-- 
    Document   : new
    Created on : 17-Aug-2023, 12:34:44 am
    Author     : smita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<html>
   
    <body>
        <%
String username=request.getParameter("username");
String password=request.getParameter("password");
try{  
 Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
    PreparedStatement ps=con.prepareStatement("select * from registration where username=? and password=?");
ps.setString(1, username);
ps.setString(2, password);        
ResultSet rs =ps.executeQuery();    
if(rs.next())  
{
response.sendRedirect("success.html");

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
