<%-- 
    Document   : donate
    Created on : May 21, 2023, 8:25:16 AM
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
        
        <script>
        
            $('#datepicker').datepicker({
                uiLibrary: 'bootstrap5'
            });
        
        </script>
    </head>
    <body>
        <header class="relative" >
            <div class="">
                <div class="">
                    <div class="header-top d-flex justify-content-between align-items-center">
                        <div class="logo">
                            <a href="index.html"><img src="img/logo.png" alt="" style="width: 200px;height: auto;"></a>
                        </div>
                        <h4>DONATION DETAILS</h4>
                        <div class="main-menubar d-flex align-items-center">
                            <nav>
                                <label><a href="index.html">Log out</a></label>
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
                                <div class="row col">
                                    <div class="col-lg-12 d-flex flex-column align-content-center">
                                        
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="purpose" placeholder="Purpose for donation" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Purpose for donation'" class="form-control mt-20" required="" type="text" required>
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="donor" placeholder="Enter your name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" class="form-control mt-20" required="" type="text" required>
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" class="form-control mt-20" required="" type="email">
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="date" id="datepicker" width="270" class="form-control mt-20 " required="" type="date" style="color:grey">
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="amount" placeholder="Donation amount" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Donation amount '" class="form-control mt-20" required="" type="text">
                                    	<textarea class="form-control mt-20" name="message" placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
                                    </div>
                                    <div class="col-lg-12 d-flex justify-content-end send-btn">
					<button class="submit-btn mt-20 text-uppercase ">donate <span class="lnr lnr-arrow-right"></span></button>
                                    </div>
                                    <div class="alert-msg"></div>
				</div>
                            </form>
                            
                            <%
                                String purpose = request.getParameter("purpose");
                                String donor = request.getParameter("donor");
                                String email = request.getParameter("email");
                                String amount = request.getParameter("amount");
                                String date = request.getParameter("date");
                                String message = request.getParameter("message");
                                
                                       
                            %>
			</div>
                    </div>
                </div>
	</section>
    </body>
</html>
