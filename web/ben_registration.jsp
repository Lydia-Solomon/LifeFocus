<%-- 
    Document   : ben_registration
    Created on : May 24, 2023, 10:49:42 AM
    Author     : LYDIA
--%>

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
        <header class="relative" >
            <div class="">
                <div class="">
                    <div class="header-top d-flex justify-content-between align-items-center">
                        <div class="logo">
                            <a href="index.html"><img src="img/logo.png" alt="" ></a>
                        </div>
                        <h4 style="color: #333333">BENEFICIARY REGISTRATION DETAILS</h4>
                        <div class="main-menubar d-flex align-items-center">
                            <nav>
                                <label><a href="index.html">Home</a></label>
                                <label><a href="Login.jsp">Login</a></label>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
	</header>
        <section id="register">
            <% 
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String mobile = request.getParameter("mobile");
                String address = request.getParameter("address");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmPassword");
                try{
                    
                    if (password != null && confirmPassword != null) {
                        if (!password.equals(confirmPassword)) {
                            System.out.println("<p>Passwords do not match!</p>");
                            %>
                            <script type="text/javascript">
                                alert("Passwords do not match!");
                            </script>
                            <%
                            
                            //JOptionPane.showMessageDialog(null,"Passwords do not match");
                        } 
                        else {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            Statement st=con.createStatement();
                            int i =st.executeUpdate("Insert into beneficiary_registry(`ben_name`,`password`,`contact`,`email`,`name`)values('"+username+"','"+confirmPassword+"','"+mobile+"','"+email+"','"+name+"')");
                            System.out.println("<p>Registration Successful!</p>");
                            %>
                            <script type="text/javascript">
                                alert("Inserted Successfully");
                            </script>
                            <%
                            response.sendRedirect("Login.jsp");
                        }
                    }
                    
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                              
            %>
        </section>
        <section class="project-area relative" id="donate" >
            <div class=""></div>
            <div class="container" style="background-position: center;overflow: hidden;width: 100%;height: 100vh;">   
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6 contact-right">
                        
                            <form class="donate-form" id="myForm" method="POST">
                                <div class="row ">
                                    <div class="col-lg-12 d-flex flex-column align-content-center">
                                        
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="name" placeholder="Enter your full name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" class="form-control mt-20" required="" type="text" required>
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" class="form-control mt-20" required="" type="email">
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="mobile" placeholder="Enter contact number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter contact number'" class="form-control mt-20" required="" type="text" maxlength="10">
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                       <textarea class="form-control mt-20" name="address" placeholder="Enter your address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your address'" required=""></textarea>
                                    </div>
                                    
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="username" placeholder="Enter username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter username'" class="form-control mt-20" required="" type="text">
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="password" placeholder="Enter password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter password'" class="form-control mt-20" required="" type="password" >
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="confirmPassword" placeholder="Confirm password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm password'" class="form-control mt-20" required="" type="password" >
                                        
                                    </div>
                                    <div class="col-lg-12 d-flex justify-content-end send-btn">
					<button class="submit-btn mt-20 text-uppercase " onclick="register">Register</button>
                                    </div>
                                    <div class="alert-msg"></div>
				</div>
                            </form>
                        </div>
                    </div>
                </div>
	</section>
    </body>
</html>
