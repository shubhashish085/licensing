<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Twitter -->
        <meta name="twitter:site" content="@riviesoft">
        <meta name="twitter:creator" content="@riviesoft">
        <meta name="twitter:card" content="summary_large_image">
        <meta name="twitter:title" content="ReMiMIS by Riviesoft">
        <meta name="twitter:description" content="ReMiMIS by Riviesoft">
        <meta name="twitter:image" content="${contextPath}/resources/assets/favicon/apple-touch-icon.png">

        <!-- Facebook -->
        <meta property="og:url" content="https://riviesoft.com">
        <meta property="og:title" content="ReMiMIS by Riviesoft">
        <meta property="og:description" content="ReMiMIS by Riviesoft">

        <meta property="og:image" content="${contextPath}/resources/assets/favicon/apple-touch-icon.png">
        <meta property="og:image:secure_url" content="${contextPath}/resources/assets/favicon/apple-touch-icon.png">
        <meta property="og:image:type" content="image/png">
        <meta property="og:image:width" content="1200">
        <meta property="og:image:height" content="600">

        <!-- Meta -->

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/assets/favicon/apple-touch-icon.png">
        <!-- Favicons -->
        <link rel="apple-touch-icon" sizes="180x180" href="${contextPath}/resources/assets/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${contextPath}/resources/assets/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${contextPath}/resources/assets/favicon/apple-touch-icon.png">
        <link rel="manifest" href="${contextPath}/resources/assets/favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <title>All Clients</title>

        <!-- vendor css -->
        <link href="${contextPath}/resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/lib/typicons.font/typicons.css" rel="stylesheet">
        <link href="${contextPath}/resources/lib/prismjs/themes/prism-vs.css" rel="stylesheet">
        <link href="${contextPath}/resources/lib/datatables.net-dt/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/lib/datatables.net-responsive-dt/css/responsive.dataTables.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/lib/select2/css/select2.min.css" rel="stylesheet">

        <!-- DashForge CSS -->
        <link rel="stylesheet" href="${contextPath}/resources/assets/css/dashforge.css">
        <link rel="stylesheet" href="${contextPath}/resources/assets/css/dashforge.demo.css">

    </head>
<body>
    <aside class="aside aside-fixed">
              <div class="aside-header">
                <a href="${contextPath}/" class="aside-logo">Dream Apps</a>
                <a href="" class="aside-menu-link">
                  <i data-feather="menu"></i>
                  <i data-feather="x"></i>
                </a>
              </div>
              <div class="aside-body">
                <div class="aside-loggedin">
                  <div class="d-flex align-items-center justify-content-start">
                    <a href="" class="avatar"><img src="${contextPath}/resources/assets/favicon/apple-touch-icon.png" class="rounded-circle" alt=""></a>
                    <div class="aside-alert-link">
                      <a href="${contextPath}/logout" data-toggle="tooltip" title="Sign out"><i data-feather="log-out"></i></a>
                    </div>
                  </div>
                  <div class="aside-loggedin-user">
                    <a href="#loggedinMenu" class="d-flex align-items-center justify-content-between mg-b-2" data-toggle="collapse">
                      <h6 class="tx-semibold mg-b-0">Admin</h6>
                      <i data-feather="chevron-down"></i>
                    </a>
                    <p class="tx-color-03 tx-12 mg-b-0">Hello <c:out value="${name}"/></p>
                  </div>

                </div><!-- aside-loggedin -->
                <ul class="nav nav-aside">


                    <li class="nav-label mg-t-25">Account</li>
                    <li class="nav-item"><a href="${contextPath}/logout" class="nav-link"><i data-feather="log-out"></i>
                        <span>Logout</span></a></li>

                </ul>
              </div>
            </aside>

            <div class="content ht-100v pd-0">

                <div class="content-header">
                  <div class="content-search">
                    <i data-feather="search"></i>
                    <input type="search" class="form-control" placeholder="Search...">
                  </div>
                  <nav class="nav">
                    <a href="javascript: " class="nav-link"><i data-feather="help-circle"></i></a>
                    <a href="javascript: " class="nav-link"><i data-feather="grid"></i></a>
                    <a href="javascript: " class="nav-link"><i data-feather="align-left"></i></a>
                  </nav>
                </div>
    <div data-label="All Clients" class="df-example demo-table">
    <table id="all-entries" class="table">
        <thead>
        <tr>
           <th class="wd-20p">Attribute</th>
           <th class="wd-20p">Message</th>
        </tr>
        </thead>
        <tr>
            <td>URL</td>
            <td>${url}</td>
        </tr>
        <tr>
            <td>Status</td>
            <td>${status}</td>
        </tr>
        <tr>
            <td>Message</td>
            <td>${message}</td>
        </tr>
        <tr>
            <td>Go To List</td>
            <td><a href = "${contextPath}/license/list"/>Main List</a></td>
        </tr>

    </table>
</body>
</html>