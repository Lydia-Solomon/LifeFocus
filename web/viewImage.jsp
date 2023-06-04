<%-- 
    Document   : viewImage
    Created on : Jun 1, 2023, 11:38:58 AM
    Author     : LYDIA
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  
    </head>
    <body>
        <%
                         try {
                            String userId = request.getParameter("user_id");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            String sql = "SELECT * FROM requests where user_id='"+userId+"'";
                            Statement stmt = con.createStatement();  
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                Blob imageBlob = rs.getBlob("certificate");
                                byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                                response.setContentType("image/jpeg"); 
                                OutputStream outputStream = response.getOutputStream();
                                outputStream.write(imageData);
                                outputStream.flush();
                                outputStream.close();
                        %>
                        
                        <%=imageData%>
                        
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    %>
        <!-- Thumbnail image with link -->
 
    </body>
</html>
