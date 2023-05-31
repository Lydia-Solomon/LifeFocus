<%-- 
    Document   : admin_home
    Created on : May 29, 2023, 4:36:36 PM
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
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin-LifeFocus</title>
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
                            
                            <a class="nav-link" href="admin_approval.jsp" >
                                <div class="sb-nav-link-icon"><i class="fas fas fa-table"></i></div>
                                Donor Registry
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="text-center text-uppercase">
                        <h5>pending approval list</h5>
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
                                                        <th scope="col">PURPOSE</th>
                                                        <th scope="col">CONTACT</th>
                                                        <th scope="col">AMOUNT</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            String sql = "SELECT user_id,purpose, mobile ,amount FROM requests where complete='No'";
                            Statement stmt = con.createStatement();  
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                String user_id = rs.getString("user_id");
                                String purpose = rs.getString("purpose");
                                String contact = rs.getString("mobile");
                                String amount = rs.getString("amount");
                               String linkUrl = "admin_approval.jsp?user_id=" + user_id;
                    %>
                                <tr>
                                    <td></td> 
                                    <td><a class="btn btn-link" href="<%=linkUrl%>" style="text-decoration: none; "><%=user_id%></a></td>
                                    <td><%=purpose%></td>
                                    <td><%=contact%></td>
                                    <td><%=amount%></td>
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
