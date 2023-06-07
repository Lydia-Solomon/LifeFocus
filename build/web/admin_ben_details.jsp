<%-- 
    Document   : admin_ben_details
    Created on : Jun 2, 2023, 11:35:28 AM
    Author     : LYDIA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <title>Beneficiary Details</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html"><img src="img/logo.png" style="width: 150px;height: auto;" ></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>-->
            <!-- Navbar-->
            <ul class="navbar-nav d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="Login.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="admin_home.jsp" style="color: white">
                                <div class="sb-nav-link-icon"><i class="fas fas fa-table"></i></div>
                                Requests
                            </a>
                            
                            <a class="nav-link" href="#" >
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
            </div>
            
        <div id="layoutSidenav_content">
            <main>
                <div class="text-center text-uppercase">
                    <h5>beneficiary details</h5>
                </div>
                <section class="donation_list">
                    <div class="row justify-content-center">
                        <div class="card bg-dark shadow-2-strong">
                            <div class="card-body">
                                <div class="table-responsive">
                                              
                                    <table class="table table-dark table-borderless mb-0">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th scope="col">USER ID</th>
                                                <th scope="col">NAME</th>
                                                <th scope="col">EMAIL</th>
                                                <th scope="col">CONTACT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            String sql = "SELECT * FROM beneficiary_registry ";
                            Statement stmt = con.createStatement();  
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                String beneficiary_id = rs.getString("beneficiary_id");
                                String ben_name = rs.getString("ben_name");
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String contact = rs.getString("contact");
                                session.setAttribute("ben_name", ben_name);
                                String linkUrl = "admin_ben_details2.jsp?ben_name=" + ben_name;
                    %>
                                    <tr>
                                        <td></td> 
                                        <td><a style="text-decoration: none;color: white;"  href="<%=linkUrl%>" ><%=beneficiary_id%></a></td>
                                        <td><a style="text-decoration: none;color: white;" href="<%=linkUrl%>"><%=name%></a></td>
                                        <td><a style="text-decoration: none;color: white;" href="<%=linkUrl%>" ><%=email%></a></td>
                                        <td><a style="text-decoration: none;color: white;" href="<%=linkUrl%>"><%=contact%></a></td>
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
                </section>
                    
                   
            </main>
                    
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
