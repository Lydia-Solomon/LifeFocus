<%-- 
    Document   : donate_from_request
    Created on : Jun 7, 2023, 7:43:18 AM
    Author     : LYDIA
--%>
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
                                <%
                                String user_id = request.getParameter("user_id");
                                session.setAttribute("user_id", user_id);
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                                String sql1 = "SELECT * FROM requests where user_id="+user_id;
                                Statement stmt = conn.createStatement();  
                                ResultSet rs1 = stmt.executeQuery(sql1);
                                while (rs1.next()) {
                                String purpose = rs1.getString("purpose");
                                String name = rs1.getString("name");
                                String email = rs1.getString("email");
                                String amount = rs1.getString("amount");
                                %>
                                
                                <ul  style="color: black; position:relative;display: inline-block;display: block;">
                                    <li ><label><a href="index.html">HOME</a></label></li>
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
	</header>
        <section class="project-area relative" id="donate" >
            
            <div class="container" style="background-position: center;overflow: hidden;width: 100%;height: 100vh;">   
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6 contact-right">
                        
                            <form class="donate-form" id="myForm" method="POST">
                                <div class="row col">
                                    <div class="col-lg-12 d-flex flex-column align-content-center">
                                        
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="purpose" value="<%=purpose%>" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Purpose for donation'" class="form-control mt-20" required="" type="text" required>
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="donor" value="<%=name%>" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" class="form-control mt-20" required="" type="text" required>
                                    </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="email" value="<%=email%>" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" class="form-control mt-20" required="" type="email">
                                    </div>
                                    
                                    <div class="col-lg-12 d-flex flex-column">
                                        <input name="amount" value="<%=amount%>" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Donation amount '" class="form-control mt-20" required="" type="text">
                                    	 </div>
                                    <div class="col-lg-6 d-flex flex-column">
                                        <input name="date" id="datepicker" width="270" class="form-control mt-20 " required="" type="date" style="color:grey">
                                    </div>
                                    <div class="col-lg-12 d-flex flex-column">
                                        <textarea class="form-control mt-20" name="remark" placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
                                    </div>    
                                        
                                    <div class="col-lg-12 d-flex justify-content-end send-btn">
					<button class="submit-btn mt-20 text-uppercase ">donate <span class="lnr lnr-arrow-right"></span></button>
                                    </div>
                                    <div class="alert-msg"></div>
				</div>
                                <%
                                    }
                                %>
                            </form>
                            
                            <%
                                try{
                                    String purpose = request.getParameter("purpose");
                                    String donor = request.getParameter("donor");
                                    String email = request.getParameter("email");
                                    String amount = request.getParameter("amount");
                                    String date = request.getParameter("date");
                                    String remark = request.getParameter("remark");
                                    if (donor != null ){
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                                        Statement st=con.createStatement();     
                                        String sql = "Insert into donation(`donor`,`purpose`,`email`,`date`,`amount`,`remark`)values('"+donor+"','"+purpose+"','"+email+"','"+date+"','"+amount+"','"+remark+"')";
                                        PreparedStatement pstm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                                        pstm.execute();
                                        ResultSet rs = pstm.getGeneratedKeys();
                                        int idValue = 0;
                                        if (rs.next()) {
                                            idValue = rs.getInt(1);
                                        }
                                        System.out.println("ID value: " + idValue);
                                        response.sendRedirect("receipt.jsp?donation_id="+idValue);    
                                    }   
                                    
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                                
                                
                                       
                            %>
			</div>
                    </div>
                </div>
	</section>
    </body>
</html>
