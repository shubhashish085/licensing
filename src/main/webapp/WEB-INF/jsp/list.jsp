<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
        <meta name="description" content="ReMiMIS by Riviesoft">
        <meta name="author" content="Riviesoft - Md Rasel Khan">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/assets/favicon/favicon-32x32.png">
        <!-- Favicons -->
        <link rel="apple-touch-icon" sizes="180x180" href="${contextPath}/resources/assets/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${contextPath}/resources/assets/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${contextPath}/resources/assets/favicon/favicon-16x16.png">
        <link rel="manifest" href="${contextPath}/resources/assets/favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <title>All users - ReMiMIS by Riviesoft</title>

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
            <a href="${contextPath}/" class="aside-logo">ReMi<span>MIS</span></a>
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
                  <h6 class="tx-semibold mg-b-0">ReMiMIS Admin</h6>
                  <i data-feather="chevron-down"></i>
                </a>
                <p class="tx-color-03 tx-12 mg-b-0">Hello <c:out value="${name}"/></p>
              </div>
              <div class="collapse" id="loggedinMenu">
                <ul class="nav nav-aside mg-b-0">
                  <li class="nav-item"><a href="${contextPath}/user/changepassword?id=${userOid}" class="nav-link"><i data-feather="edit"></i> <span>Change Password</span></a></li>
                  <li class="nav-item"><a href="javascript: " class="nav-link"><i data-feather="help-circle"></i> <span>Help Center</span></a></li>
                  <li class="nav-item"><a href="${contextPath}/logout" class="nav-link"><i data-feather="log-out"></i> <span>Sign Out</span></a></li>
                </ul>
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
            </div><!-- content-header -->

              <div class="content-body">
                <div class="container pd-x-0">
                  <div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">

                    <div>
                      <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-style1 mg-b-10">
                          <li class="breadcrumb-item"><a href="#">All Users</a></li>
                        </ol>
                      </nav>
                      <h4 class="mg-b-0 tx-spacing--1">List of all data</h4>
                    </div>
                    <div class="d-none d-md-block">
                      <a href="${contextPath}/form/userform" class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5"><i class="icon ion-md-add wd-10 mg-r-5"></i> Add New User</a>
                    </div>

                  </div>

                  <div data-label="All Users" class="df-example demo-table">
                    <table id="all-entries" class="table">
                      <thead>
                        <tr>
                          <th class="wd-30p">Client Name</th>
                          <th class="wd-30p">MAC Address</th>
                          <th class="wd-20p">Start Date</th>
                          <th class="wd-20p">End Date</th>
                          <th class="wd-25p">Action</th>
                        </tr>
                      </thead>
                      <tbody>

                            <c:forEach items="${data}" var="entry">
                                <tr>
                                    <td>${entry.clientName}</td>
                                    <td>${entry.macAddress}</td>
                                    <td>${entry.startDate}</td>
                                    <td>${entry.endDate}</td>
                                    <td>
                                        <a href = "<c:url value = "/license/details/view?id=${entry.oid}"/>">Edit</a> | <a href = "<c:url value = "/license/details/edit?id=${entry.oid}"/>">View</a>
                                    </td>
                                </tr>
                            </c:forEach>

                      </tbody>
                    </table>
                  </div><!-- df-example -->


                </div><!-- container -->
              </div>

              <div class="footer mt-5 pt-0 pb-0">
                <div>
                  <span>&copy; 2020 ReMiMIS</span>
                  <!--span>Developed by <a href="https://riviesoft.com">Riviesoft</a></span-->
                  <span class="ml-5 mr-5">Financed by <a href="https://europa.eu/"><img src="${contextPath}/resources/assets/img/europa-flag.gif" style="height:40px; width:auto;" /></a></span>
                  <span>Supported by <a href="https://bangladesh.iom.int/"><img src="${contextPath}/resources/assets/img/iom.png" style="height:40px; width:auto;" /></a></span>
                </div>
                <div>
                  <nav class="nav">
                    Powered By&nbsp;<a href="https://www.codagecorp.com/">Codage Corporation Ltd</a>
                  </nav>
                </div>
              </div>

            </div>

        <script src="${contextPath}/resources/lib/jquery/jquery.min.js"></script>
        <script src="${contextPath}/resources/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/lib/feather-icons/feather.min.js"></script>
        <script src="${contextPath}/resources/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="${contextPath}/resources/lib/prismjs/prism.js"></script>
        <script src="${contextPath}/resources/lib/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="${contextPath}/resources/lib/datatables.net-dt/js/dataTables.dataTables.min.js"></script>
        <script src="${contextPath}/resources/lib/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="${contextPath}/resources/lib/datatables.net-responsive-dt/js/responsive.dataTables.min.js"></script>
        <script src="${contextPath}/resources/lib/select2/js/select2.min.js"></script>

        <script src="${contextPath}/resources/assets/js/dashforge.js"></script>
        <script src="${contextPath}/resources/assets/js/dashforge.aside.js"></script>
        <script>
          $(function(){
            'use strict'

            $(document).ready(function(){

                var table = $('#all-entries').DataTable({
                              responsive: true,
                              language: {
                                searchPlaceholder: 'Search...',
                                sSearch: '',
                                lengthMenu: '_MENU_ items/page',
                              },
                              columnDefs: [
                                  { responsivePriority: 1, targets: 0 },
                                  { responsivePriority: 2, targets: -1 }
                              ]
                            });


            });


          });
        </script>

    <body>
</html>
