<%-- 
    Document   : Grreg1
    Created on : 08-Sep-2023, 1:59:20 am
    Author     : smita
--%>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GrJSP Page</title>
    </head>
    <body>
       <%
                String name=request.getParameter("name");
                String sex=request.getParameter("sex");
                String empid=request.getParameter("empid");
                String email=request.getParameter("email");
                String specialization=request.getParameter("specialization");
                String qualification=request.getParameter("qualification");
                String YOE=request.getParameter("YOE");
                String username1=request.getParameter("username1");
                String password1=request.getParameter("password1");
            

  try
  {
       
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
                    PreparedStatement ps=con.prepareStatement("insert into manager values(?,?,?,?,?,?,?,?,?)");
                    ps.setString(1,name);
                    ps.setString(2,sex);
                    ps.setString(3,empid);
                    ps.setString(4,email);
                    ps.setString(5,specialization);
                    ps.setString(6,qualification);
                    ps.setString(7,YOE);
                    ps.setString(8,username1);
                    ps.setString(9,password1);
                    ps.executeUpdate();
                    out.println("data inserted");
                }
                catch(Exception e){
                    e.printStackTrace();
                }
  
  %>
    </body>
</html>
