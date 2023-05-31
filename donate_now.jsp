<%-- 
    Document   : donate_now
    Created on : May 19, 2023, 6:01:11 PM
    Author     : LYDIA
--%>

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
        <header class="relative" >
            <div class="">
                <div class="">
                    <div class="header-top d-flex justify-content-between align-items-center">
                        <div class="logo">
                            <a href="index.html"><img src="img/logo.png" alt="" style="width: 200px;height: auto;"></a>
                        </div>
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
        <section class="donation_list">
                <div class="banner-area relative" >
                   <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0,0,0,.25);">
                       <div class="container">
                           <div class="row justify-content-center">
                               <div class="col-12">
                                   <div class="card bg-dark shadow-2-strong">
                                       <div class="card-body">
                                          <div class="table-responsive">
                                              <table class="table table-dark table-borderless mb-0">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">PURPOSE</th>
                                                        <th scope="col">CONTACT</th>
                                                        <th scope="col">AMOUNT</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            String sql = "SELECT purpose, mobile ,amount FROM requests where complete='No'";
                            Statement stmt = con.createStatement();  
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                String purpose = rs.getString("purpose");
                                String contact = rs.getString("mobile");
                                String amount = rs.getString("amount");
                    %>
                                <tr>
                                <td><%=purpose%></td>
                                <td><%=contact%></td>
                                <td><%=amount%></td>
                                <td><button type="submit" class="btn-sm"><a href="Login.jsp" class="btn-sm  text-uppercase">DONATE</a></button></td>
                                </tr>
                    <% 
                            }
                             // Close the resources
                            rs.close();
                            stmt.close();
                            con.close();
            
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                                   
                                        </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
        
    </body>
</html>
