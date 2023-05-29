<%-- 
    Document   : request
    Created on : May 23, 2023, 3:28:19 PM
    Author     : LYDIA
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.http.*, java.sql.*" %>
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
        <header class="relative" >
            <div class="">
                <div class="">
                    <div class="header-top d-flex justify-content-between align-items-center">
                        <div class="logo">
                            <a href="index.html"><img src="img/logo.png" alt="" ></a>
                        </div>
                        <h4>REQUEST FORM</h4>
                        <div class="main-menubar d-flex align-items-center">
                            <nav>
                                
                                <%
                                    String storedUsername = (String)session.getAttribute("username");
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            
                                    String query = "SELECT * FROM beneficiary_registry WHERE ben_name = '"+storedUsername+"'";
                                    Statement stmt1 = con1.createStatement(); 
                                    ResultSet resultSet = stmt1.executeQuery(query);
                                    while (resultSet.next()) {
                                        String name = resultSet.getString("name");
                     
                                %>
                                <ul  style="color: black; position:relative;display: inline-block;display: block;">
                                        <span class="text-uppercase"><%=name%></span> <i class="bi bi-chevron-down"></i>
                                        <li ><label><a href="index.html">Log out</a></label></li>
                                    </ul>
                                <%}%>
                            </nav>
                            <!--<div class="menu-bar"><span class="lnr lnr-menu"></span></div>-->
                        </div>
                    </div>
                </div>
            </div>
	</header>
        
        
        <section class="project-area relative" id="donate" >
            <div class=""></div>
            <div class="container" style="background-position: center;overflow: hidden;width: 100%;height: 100vh;">   
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6 contact-right">
                        
                            <form class="donate-form" id="myForm" method="POST">
                                <div class="row ">
                                    

                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="name" placeholder="Enter your full name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" class="form-control mt-20" required="" type="text" required>
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="mobile" placeholder="Enter contact number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter contact number'" class="form-control mt-20" required="" type="text" maxlength="10">
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" class="form-control mt-20" required="" type="email">
                                    </div>
                                    
                                    <div class="col-lg-12 d-flex flex-column">
                                       <textarea class="form-control mt-20" name="address" placeholder="Enter your address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your address'" required=""></textarea>
                                    </div>
                                    
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="amount" placeholder="Enter amount" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter amount'" class="form-control mt-20" required="" type="amount">
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="purpose" placeholder="Purpose for Request" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Purpose for Request'" class="form-control mt-20" required="" type="text" >
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="certificate" placeholder="certificate" onfocus="this.placeholder = ''" onblur="this.placeholder = 'certificate'" class="form-control mt-20" required="" type="file" >
                                    </div>
                                    
                                    <div class="col-lg-12 d-flex justify-content-end send-btn">
					<button class="submit-btn mt-20 text-uppercase " href="#request">Register</button>
                                    </div>
                                    <div class="alert-msg"></div>
				</div>
                            </form>
                        </div>
                    </div>
                </div>
	</section>
        <section id="request">
            <% 
                String storedUser = (String)session.getAttribute("username"); 
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String mobile = request.getParameter("mobile");
                String place = request.getParameter("address");
                String amount = request.getParameter("amount");
                String purpose = request.getParameter("purpose");
                String uploadPath = request.getParameter("certificate");
                if (name != null ) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                Statement st=con.createStatement();     
                int i =st.executeUpdate("Insert into requests(`name`,`mobile`,`amount`,`purpose`,`place`,`email`,`certificate`,`complete`,`approved`,`user`)values('"+name+"','"+mobile+"','"+amount+"','"+purpose+"','"+place+"','"+email+"','"+uploadPath+"','No','Requested','"+storedUser+"')");
                response.sendRedirect("ben_home.jsp");    
                } 
                
            %>
        </section>
    </body>
</html>
