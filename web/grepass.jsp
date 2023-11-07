<%-- 
    Document   : grepass
    Created on : 14-Sep-2023, 11:40:31 pm
    Author     : smita
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
    String username1 =request.getParameter("username1");
String password1 =request.getParameter("Password1");
String newp =request.getParameter("newPassword");
String confirm =request.getParameter("confirmPassword");


        if(newp.equals(confirm)){
 try{
         
         Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
         PreparedStatement ps = cn.prepareStatement("update manager SET password =? WHERE username =? and password=?");
        
        ps.setString(1, newp);
          ps.setString(2, username1);
          ps.setString(3,password1);
         ResultSet rs = ps.executeQuery();
         out.println("Password Changed Successfully");
      



 }catch(Exception e){
 e.printStackTrace();
 }}
else{
out.println("plz type password correctly");

}
 %>
    </body>
</html>