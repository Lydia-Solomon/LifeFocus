<%-- 
    Document   : approve.jsp
    Created on : Jun 2, 2023, 10:42:41 AM
    Author     : LYDIA
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Approve</title>
    </head>
    <body>
        <%
            String userId = request.getParameter("user_id");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                           
            String sql1 = "UPDATE requests SET approved = 'Approved' WHERE user_id = "+userId;
            PreparedStatement statement = con.prepareStatement(sql1);
            //statement.setString(1, userId);
            statement.executeUpdate(sql1);
            response.sendRedirect("admin_home.jsp");
                                                       
        %>
        <%=userId%>
    </body>
</html>
