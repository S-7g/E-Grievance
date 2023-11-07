<%-- 
    Document   : reg
    Created on : 26-Aug-2023, 11:57:13 am
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate New User</title>
    </head>
    <body>
         <%
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String qualification=request.getParameter("qualification");
                String specialization=request.getParameter("specialization");
                 String empid=request.getParameter("empid");
                String YOE=request.getParameter("YOE");
                String username=request.getParameter("username");
                String password=request.getParameter("password");
            

		try
		{
                 Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
                    PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?,?)");
                     ps.setString(1,name);
                    ps.setString(2,email);
                    ps.setString(3,gender);
                    ps.setString(4,qualification);
                    ps.setString(5,specialization);
                    ps.setString(6,empid);
                    ps.setString(7,YOE);
                    ps.setString(8,username);
                    ps.setString(9,password);
                    ps.executeUpdate();
                    out.println("data inserted");
                }
                catch(Exception e){
                    e.printStackTrace();
                }
                    
		%>
    
       </body>
</html>