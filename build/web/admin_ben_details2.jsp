<%-- 
    Document   : admin_ben_details2
    Created on : Jun 5, 2023, 2:55:55 PM
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
        <title>Beneficiary Details</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
        <style>
        /* CSS for the pop-up */
        .popup {
            position: fixed;
            top: 50%;
            left: 60%;
            width: 50%;
            transform: translate(-50%, -50%);
            background: cornsilk;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        
        
    </style>
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
        </div>
        <div id="popup" class="popup">
                        <table class="table table-bordered mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col">PURPOSE</th>
                                                <th scope="col">AMOUNT</th>
                                                <th scope="col">PLACE</th>
                                                <th scope="col">CONTACT</th>
                                                <th scope="col">STATUS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                        <%
                            String ben_name = request.getParameter("ben_name");
                        %>
                        <div style="display: flex;justify-content: space-between;align-items: center;">
                            <label class="text-uppercase">Requests made by <%=ben_name%></label>
                            <a href="admin_ben_details.jsp" style="text-decoration:none;font-size: small">BACK</a>
                                 
                        </div>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifefocus?"+"user=root&password=root");
                            Statement stmt = con.createStatement();
                            String sql = "SELECT * FROM requests where user='"+ben_name+"' ";
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                String user_id = rs.getString("user_id");
                                String place = rs.getString("place");
                                String mobile = rs.getString("mobile");
                                String purpose = rs.getString("purpose");
                                String status = rs.getString("approved");
                                String amount = rs.getString("amount");
                                String linkUrl = "admin_approval.jsp?user_id=" + user_id;
                            %>
                                    <tr>
                                        <td><a class="btn btn-link" href="<%=linkUrl%>" style="text-decoration: none;color: black "><%=purpose%></a></td>
                                        <td><a class="btn btn-link" href="<%=linkUrl%>" style="text-decoration: none;color: black  "><%=amount%></a></td>
                                        <td><a class="btn btn-link" href="<%=linkUrl%>" style="text-decoration: none;color: black "><%=place%></a></td>
                                        <td><a class="btn btn-link" href="<%=linkUrl%>" style="text-decoration: none;color: black  "><%=mobile%></a></td>
                                        <td><a class="btn btn-link" href="<%=linkUrl%>" style="text-decoration: none;color: black "><%=status%></a></td>
                                    </tr>
                        </tbody>
                        <%
                            
                        }
                    %>
                        </table>
                    </div>
             
    </body>
</html>
