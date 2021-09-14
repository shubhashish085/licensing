<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
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

      <title>ReMiMIS</title>

      <!-- vendor css -->
      <link href="${contextPath}/resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

      <!-- DashForge CSS -->
      <link rel="stylesheet" href="${contextPath}/resources/assets/css/dashforge.css">
      <link rel="stylesheet" href="${contextPath}/resources/assets/css/dashforge.auth.css">

      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
  </head>
  <body>

    <header class="navbar navbar-header navbar-header-fixed">
          <div class="navbar-brand">
            <a href="/login" class="df-logo">ReMi<span>MIS</span></a>
          </div><!-- navbar-brand -->
          <div id="navbarMenu" class="navbar-menu-wrapper">
            <div class="navbar-menu-header">
              <a href="/login" class="df-logo">ReMi<span>MIS</span></a>
              <a id="mainMenuClose" href=""><i data-feather="x"></i></a>
            </div><!-- navbar-menu-header -->

          </div><!-- navbar-menu-wrapper -->
          <div class="navbar-right">
            <a href="javascript: " class="btn btn-social"><i class="fab fa-linkedin"></i></a>
            <a href="javascript: " class="btn btn-social"><i class="fab fa-facebook"></i></a>
            <a href="javascript: " class="btn btn-social"><i class="fab fa-twitter"></i></a>
            <a href="javascript: " class="btn btn-buy"><i class="fab fa-contao"></i> <span>Contact Us</span></a>
          </div><!-- navbar-right -->
        </header>

            <div class="content content-fixed content-auth">
              <div class="container">
                <div class="media align-items-stretch justify-content-center ht-100p pos-relative">
                  <div class="sign-wrapper mg-lg-l-50 mg-xl-l-60">
                    <div class="wd-100p">

                            <h3 class="tx-color-01 mg-b-5">Sign In</h3>
                            <p class="tx-color-03 tx-16 mg-b-40">Welcome back! Please signin to continue.</p>

                           <form method="POST" action="${contextPath}/login" class="form-signin">

                             <div class="form-group ${error != null ? 'has-error' : ''}">
                                 <span>${message}</span>
                                 <input name="username" type="text" class="form-control" required="required" placeholder="Username"
                                        autofocus="true"/>
                              </div>
                              <div class="form-group">
                                 <input name="password" type="password" class="form-control" required="required" placeholder="Password"/>
                                 <span>${error}</span>
                                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                              </div>
                                 <button class="btn btn-brand-02 btn-block" type="submit">Log In</button>
                             </div>
                           </form>

                    </div>
                  </div><!-- sign-wrapper -->
            </div><!-- media -->
          </div><!-- container -->
        </div><!-- content -->

       <footer class="footer pt-0 pb-0">
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
        </footer>

        <script src="${contextPath}/resources/lib/jquery/jquery.min.js"></script>
        <script src="${contextPath}/resources/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/lib/feather-icons/feather.min.js"></script>
        <script src="${contextPath}/resources/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${contextPath}/resources/assets/js/dashforge.js"></script>

        <!-- append theme customizer -->
        <script src="${contextPath}/resources/lib/js-cookie/js.cookie.js"></script>
        <script src="${contextPath}/resources/assets/js/dashforge.settings.js"></script>
        <script>
          $(function(){
            'use script'

            window.darkMode = function(){
              $('.btn-white').addClass('btn-dark').removeClass('btn-white');
            }

            window.lightMode = function() {
              $('.btn-dark').addClass('btn-white').removeClass('btn-dark');
            }

            var hasMode = Cookies.get('df-mode');
            if(hasMode === 'dark') {
              darkMode();
            } else {
              lightMode();
            }
          })
        </script>
  </body>
</html>