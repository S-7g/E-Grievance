<%-- 
    Document   : greresolved
    Created on : 14-Sep-2023, 11:15:41 pm
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
    <body background="home1.jpg">
        <font color="white">
        <h1>See your complaint's Status</h1><center>
        <table border="5" cellpadding='10px' cellspacing='5px'>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Query</th>
                <th>Status</th>
                <th>Grievance Id</th>
            </tr>
            <%
                
                String status = "Resolved";
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","IMIT@1");
                    PreparedStatement ps = con.prepareStatement("select * from query where status=? ");
                    ps.setString(1,status);
                    ResultSet rs = ps.executeQuery();
                       while(rs.next()){
                       %>
                       <tr>
                         
                              <tr>
                           <td><%=rs.getString("empid") %></td>
                            <td><%=rs.getString("name") %></td>
                          <td><%=rs.getString("query") %></td>
                            <td><%=rs.getString("status") %></td>
                            <td><%=rs.getString("greid") %></td>
                       </tr>  
                       <%
                       }
                 
}catch(Exception e){
e.printStackTrace();
}

            %>
        </table>
        <form action="greupdate.jsp">
            <h2>  Greviance Id: <input type="text" name="id" required>&nbsp;&nbsp;
                Staus:
                <select name ="up">
                        <option>Pending</option>
                        <option>Resolved</option>
                  </select></h2>
            <input type ="submit" value="UPDATE">
        </form>
        </font>
        </body>
        </html>
