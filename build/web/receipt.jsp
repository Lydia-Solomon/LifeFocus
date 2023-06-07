<%-- 
    Document   : receipt
    Created on : Jun 6, 2023, 9:40:17 PM
    Author     : LYDIA
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
                            <a href="index.html"><img src="img/logo.png" alt="" style="width: 200px;height: auto;"></a>
                        </div>
                        
                        <div class="main-menubar d-flex align-items-center">
                            <nav>
                                <%
                                String username = (String) session.getAttribute("username");
                                %>
                                <ul  style="color: black; position:relative;display: inline-block;display: block;">
                                    
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
	</header>
                                    <%
                                        String donation_id = request.getParameter("donation_id");
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                                        String sql = "SELECT * FROM reciept where donation_id='"+donation_id+"'";
                                        Statement stmt = con.createStatement(); 
                                        ResultSet rs = stmt.executeQuery(sql);
                                        while (rs.next()) {
                                            String id = rs.getString("id");
                                            String date = rs.getString("don_date");
                                            String name = rs.getString("donor");
                                            String purpose = rs.getString("pupose");
                                            String amount = rs.getString("amount");
                                    %>
                                    
        <section class="project-area relative" id="donate" >
            <div class="container" style="background-position: center;overflow: hidden;width: 100%;height: 100vh;">   
                <div class="container py-5 h-100">
                    
                          <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-10 col-lg-8 col-xl-6">
        <div class="card card-stepper" style="border-radius: 16px;">
          <div class="card-header p-4">
            <div class="d-flex justify-content-between align-items-center">
              <div>
                  <p class="text-muted mb-2"><h4>E-RECEIPT</h4></p>
                <p class="text-muted mb-2"> Receipt ID : <span class="fw-bold text-body"><%=id%></span></p>
                <p class="text-muted mb-0"> Donated On <span class="fw-bold text-body"><%=date%></span> </p>
              </div>
              <div>
                <h6 class="mb-0"> <a href="#" onclick="window.print()">Print</a> </h6>
              </div>
            </div>
          </div>
          <div class="card-body p-4">
            <div class="d-flex flex-row mb-4 pb-2">
                <div class="row">
                    <div class="col-12">
                        <p>Donor Name : &nbsp;<%=name%></p>
                    </div>
                    
                    <div class="col-12">
                        <p>Purpose of payment : &nbsp;<%=purpose%></p>
                    </div>
                                    
                    <div class="col-12">
                        <p>Amount Payed : &nbsp;<%=amount%></p>
                    </div>
                    <%
                                        }   // Close the resources
                                        rs.close();
                                        stmt.close();
                                        con.close();
                      
                                    %>   
                </div>    
            </div>
                    <button>
                        <a href="donate_now.jsp">SAVE</a> 
                    </button>
          </div>
                                    <%
                                        String userId = (String) session.getAttribute("user_id");
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                           
                                        String sql1 = "UPDATE requests SET complete = 'yes' WHERE user_id = "+userId;
                                        PreparedStatement statement = conn.prepareStatement(sql1);
            //statement.setString(1, userId);
                                        statement.executeUpdate(sql1);
                                    %>
                                    
        </div>
      </div>
    </div>
  </div>
                       </div>
            </div>
        </section>
                      
    </body>
</html>
