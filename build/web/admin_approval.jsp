<%-- 
    Document   : admin_approval
    Created on : May 30, 2023, 11:45:31 AM
    Author     : LYDIA
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin Appoval</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html"><img src="img/logo.png" style="width: 150px;height: auto;" ></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="admin_home.jsp" >
                                <div class="sb-nav-link-icon"><i class="fas fas fa-table"></i></div>
                                Requests
                            </a>
                            
                            <a class="nav-link" href="admin_approval.jsp" >
                                <div class="sb-nav-link-icon"><i class="fas fas fa-table"></i></div>
                                Donor Registry
                            </a>
                            
                            <a class="nav-link" href="admin_ben_details.jsp" >
                                <div class="sb-nav-link-icon"><i class="fas fas fa-table"></i></div>
                                Beneficiary Registry
                            </a>
                        </div>
                    </div>
                    </nav>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <%
                        try {
                            String userId = request.getParameter("user_id");
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            String sql = "SELECT * FROM requests where user_id='"+userId+"'";
                            Statement stmt = con.createStatement();  
                            
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                String user_id = rs.getString("user_id");
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String place = rs.getString("place");
                                String mobile = rs.getString("mobile");
                                String purpose = rs.getString("purpose");
                                String amount = rs.getString("amount");
                                String status = rs.getString("approved");
                                String linkUrl = "approve.jsp?user_id=" + user_id;
                    %>
                          
                    <section class="vh-100" style="background-color: #f4f5f7;">
                       <div class="container py-5 h-100">
                           <div class="row d-flex justify-content-center align-items-center h-100">
                               <div class="col col-lg-6 mb-4 mb-lg-0">
                                   <div class="card mb-3" style="border-radius: .5rem;">
                                       <div class="row g-0">
                                          
                                           <div class="col-md-8">
                                               <div class="card-body p-4">
                                                   <h6></h6>
                                                   <!--<hr class="mt-0 mb-4">-->
                                                   <div class="row ">
                                                       <div class="col-12">
                                                           <p class="text-muted">Email : <%=email%></p>
                                                       </div>
                                                       <div class="col-12">
                                                           <p class="text-muted">Contact No : <%=mobile%></p>
                                                       </div>
                                                       <div class="col-12">
                                                           <p class="text-muted">Address :<br> <%=place%></p>
                                                       </div>
                                                       <div class="col-12">
                                                           <p class="text-muted">Purpose : <%=purpose%></p>
                                                       </div>
                                                       <div class="col-12">
                                                           <p class="text-muted">Amount : <%=amount%></p>
                                                       </div>
                                                       <div class="col-12">
                                                           <p class="text-muted">Status : <%=status%></p>
                                                       </div>
                                                       <div class="col-12">
                                                           
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="col-md-4 gradient-custom text-center text-white "
                                              style="background: #f6d365;background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));">
                                               <div class="card-body p-4 col-md-12">
                                                   <h5><%=name%></h5>
                                                   <p><%=userId%></p>
                                                   <button type="submit" class="btn btn-outline-secondary"><a href="<%=linkUrl%>" style="text-decoration: none;color: grey">Approve</a></button>
                                               </div> 
                                           </div>            
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </section>
                                 
                   <%
                       }   // Close the resources
                           rs.close();
                           stmt.close();
                           con.close();
                       }catch (Exception e) {
                           e.printStackTrace();
                       }
                   %>
                    
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
