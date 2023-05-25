<%-- 
    Document   : Login
    Created on : May 18, 2023, 10:08:46 PM
    Author     : LYDIA
--%>

<%@page import="java.io.Console"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Life Focus Trust</title>
        <link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="banner-area relative" style="background-position: center;overflow: hidden;width: 100%;height: 100vh;">
        <div class="login-container">
            <h2>Login</h2>
            <form>
                <div style="color:red">${errorMessage}</div>
                <div class="form-group">
                    <label for="username">User Type</label>
                    <select name="userType" required="">
                        <option value="admin">Admin</option>
                        <option value="donor">Donor</option>
                        <option value="beneficiary">Beneficiary</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                
                <button type="submit" href="#login">Login</button>
            </form>
            <div class="pt-md-2 col-md-12">
                <a href="registration.jsp" style="color: black">&nbsp;&nbsp;&nbsp;&nbsp;New Donor ? Register here <br> </a>
                <a href="ben_registration.jsp" style="color: black">&nbsp;&nbsp;New Beneficiary ? Register here  </a>

            </div>
            <div class="pt-md-2 col-md-12">
                            </div>    
        </div>
        </div>
        <section id="login">
           <%
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String type=request.getParameter("userType");
                System.out.println("Debug: Username: " + username);
                System.out.println("Debug: Password: " + password);
            
            try{
                if (username != null && password != null) {
                    if(username.equals("admin")&& password.equals("admin123"))
                    { 
                        response.sendRedirect("index.html");
                    }
                    else if(type.equals("donor"))
                    { 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("SELECT * FROM login WHERE username='"+username+"'");
                        rs.next();
                        if(rs.getString("username").equals(username)&& rs.getString("password").equals(password)){
                            response.sendRedirect("donate.jsp");
                        }
                    }
                    else if(type.equals("beneficiary")){
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("SELECT * FROM beneficiary_registry WHERE ben_name='"+username+"'");
                        rs.next();
                        if(rs.getString("ben_name").equals(username)&& rs.getString("password").equals(password)){
                            response.sendRedirect("ben_home.jsp");
                        }
                    }
                    else {
                        %>
                            <script type="text/javascript">
                                alert("Invalid Credentials");
                            </script>
                        <%
                         
                    }
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
       
        
    %>
        </section>

    </body>
</html>
