<%-- 
    Document   : grepassword
    Created on : 14-Sep-2023, 11:38:53 pm
    Author     : smita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="pw.jpg">
        <div class="container">
            <center>
                <font size="5" color="pink">
                <h1>Change Password</h1><br><br>
        <form action="grepass.jsp" method="post">
            <center>
            <label for="username">USER NAME</label>
            <input type="text" id="username1" name="username1" required><br><br><br><br>
            
            <label for="currentPassword">CURRENT PASSWORD</label>
            <input type="password" id="Password1" name="Password1" required><br><br><br><br>
            
            <label for="newPassword">NEW PASSWORD</label>
            <input type="password" id="newPassword" name="newPassword" required><br><br><br><br>
            
            <label for="confirmPassword">CONFIRM NEW PASSWORD</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required><br><br><br>
           
            <input type="submit" value="Change Password"></center></font>
        </form>
    </div>
    </body>
</html>
