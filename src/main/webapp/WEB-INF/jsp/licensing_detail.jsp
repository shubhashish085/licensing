<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
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

    <title>Create new user - ReMiMIS</title>
    <!-- vendor css -->
    <link href="${contextPath}/resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/typicons.font/typicons.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/prismjs/themes/prism-vs.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/ion-rangeslider/css/ion.rangeSlider.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/select2/css/select2.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/static/css/jquery-ui.css" rel="stylesheet">
    <link href="${contextPath}/resources/static/css/jquery.ui.datepicker.monthyearpicker.css" rel="stylesheet">


    <!-- DashForge CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/dashforge.css">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/dashforge.demo.css">


    <style>
        .error {
            color: #ff0000;
        }
    </style>

</head>
<body class="pos-relative">

    <aside class="aside aside-fixed">
      <div class="aside-header">
        <a href="${contextPath}/" class="aside-logo">Dream Apps</span></a>
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
          <div class="collapse" id="loggedinMenu">
            <ul class="nav nav-aside mg-b-0">
              <li class="nav-item"><a href="${contextPath}/logout" class="nav-link"><i data-feather="log-out"></i> <span>Sign Out</span></a></li>
            </ul>
          </div>
        </div><!-- aside-loggedin -->
        <ul class="nav nav-aside">

          <li class="nav-item"><a href="${contextPath}/" class="nav-link"><i data-feather="globe"></i> <span>Dashboard</span></a></li>


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

        <div class="content-body" data-spy="scroll" data-target="#navSection" data-offset="120">

            <div class="container pd-x-0">
                <h4 class="mg-b-10">Client</h4>
                <p class="mg-b-30">Please fill all the required fields carefully and validate before submitting them to
                    server</p>

                <form:form method="POST" action="/license/details/save" modelAttribute="data">

	                <div data-label="Create New Client" class="df-example demo-forms">

	                    <div class="form-row">

                            <div  class="form-group col-md-6">
                                <form:hidden path="oid"/>
                                <form:label path="clientName">Client Name*</form:label>
                                <form:input path="clientName" class="form-control" required="required" placeholder="Name"/>
                            </div>

                            <div  class="form-group col-md-6">
                                <form:label path="macAddress">MAC Address*</form:label>
                                <form:input path="macAddress" class="form-control" required="required" placeholder="XX-XX-XX-XX-XX-XX"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div  class="form-group col-md-12">
                                <form:label path="token">Token*</form:label>
                                <form:input path="token" class="form-control" required="required" placeholder="Token"/>
                            </div>
	                    </div>
	                    <div class="form-row">
	                        <div id="startDateDiv" class="form-group col-md-6">
                                <form:label path="startDate">Start Date*</form:label>
                                <form:input path="startDate" id="startDateField" autocomplete="off"
                                            class="form-control basic-datepicker" placeholder="Choose Date"/>
                            </div>
                            <div id="endDateDiv" class="form-group col-md-6">
                                <form:label path="endDate">End Date</form:label>
                                <form:input path="endDate" id="endDateField" autocomplete="off"
                                            class="form-control basic-datepicker" placeholder="Choose Date"/>
                            </div>
	                    </div>

	                    <c:choose>
                               <c:when test="${action == 'EDIT'}">
                                   <button class="btn btn-primary" type="submit">Submit</button>
                               </c:when>
                        </c:choose>
	                </div>



                </form:form>
            </div>
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

    <!--<script id="historyTemplate" type="x-tmpl-mustache">
      <div class="form-row">
         <div class="form-group col-md-6">
            <label>Country</label>
            <select id=""></select>
        </div>
        <div class="form-group col-md-6">
            <label>Name of Employer</label>
            <input id="" type="text" value="{{}"/>
        </div>
      </div>
    </script>-->

    <script src="${contextPath}/resources/lib/jquery/jquery.min.js"></script>
    <script src="${contextPath}/resources/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/lib/feather-icons/feather.min.js"></script>
    <script src="${contextPath}/resources/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${contextPath}/resources/lib/prismjs/prism.js"></script>
    <script src="${contextPath}/resources/static/js/jquery-ui.js"></script>
    <script src="${contextPath}/resources/lib/select2/js/select2.min.js"></script>


    <script type="text/javascript" src="${contextPath}/resources/assets/js/pdfmake.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/assets/js/vfs_fonts.js"></script>

    <script src="${contextPath}/resources/assets/js/dashforge.js"></script>
    <script src="${contextPath}/resources/assets/js/dashforge.aside.js"></script>

    <script src="${contextPath}/resources/static/js/jquery.ui.datepicker.monthyearpicker.js"></script>
    <script src="https://cdnjs.com/libraries/mustache.js/"></script>

    <script>

           $(document).ready(function () {

                $(".form-control.basic-datepicker").datepicker({
                           "dateFormat": 'dd-M-yy'
                       });

           });


           function getTdIssueDate() {
               return $datepicker.val();
           }
    </script>

</body>
</html>