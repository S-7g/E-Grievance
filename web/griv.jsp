<%-- 
    Document   : griv
    Created on : 13-Sep-2023, 1:03:29 am
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
    <body bgcolor="#FFFFFF" text="#000000">
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
            PreparedStatement ps= con.prepareStatement("insert into  grievancee values(?,?,?,?)");
            ps.setString(1,dept);
            ps.setInt(2,GID);
            ps.setString(3,email);
            ps.setString(4,grievance);
           
           try
           {
            ps.executeUpdate();
           }
           catch(Exception ex)
           {
              Adminidstatus=true;
          
           }
            if(Adminidstatus==true)
            {
            out.println("Admin id exist try again"); 
            }
            else
            {
            out.println("Registered successfully");
            }
            con.close();
        }
        catch(Exception e)
        {
            e.getMessage();      
        }
    %> 
    
    </body>
</html>
