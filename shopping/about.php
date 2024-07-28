<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    session_start();
    error_reporting(0);
    include('includes/config.php');
    // Code user Registration
    if (isset($_POST['submit'])) {
        $name = $_POST['fullname'];
        $email = $_POST['emailid'];
        $contactno = $_POST['contactno'];
        $password = md5($_POST['password']);
        $query = mysqli_query($con, "insert into users(name,email,contactno,password) values('$name','$email','$contactno','$password')");
        if ($query) {
            echo "<script>alert('You are successfully register');</script>";
        } else {
            echo "<script>alert('Not register something went worng');</script>";
        }
    }
    // Code for User login
    if (isset($_POST['login'])) {
        $email = $_POST['email'];
        $password = md5($_POST['password']);
        $query = mysqli_query($con, "SELECT * FROM users WHERE email='$email' and password='$password'");
        $num = mysqli_fetch_array($query);
        if ($num > 0) {
            $extra = "my-cart.php";
            $_SESSION['login'] = $_POST['email'];
            $_SESSION['id'] = $num['id'];
            $_SESSION['username'] = $num['name'];
            $uip = $_SERVER['REMOTE_ADDR'];
            $status = 1;
            $log = mysqli_query($con, "insert into userlog(userEmail,userip,status) values('" . $_SESSION['login'] . "','$uip','$status')");
            $host = $_SERVER['HTTP_HOST'];
            $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            header("location:http://$host$uri/$extra");
            exit();
        } else {
            $extra = "login.php";
            $email = $_POST['email'];
            $uip = $_SERVER['REMOTE_ADDR'];
            $status = 0;
            $log = mysqli_query($con, "insert into userlog(userEmail,userip,status) values('$email','$uip','$status')");
            $host  = $_SERVER['HTTP_HOST'];
            $uri  = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            header("location:http://$host$uri/$extra");
            $_SESSION['errmsg'] = "Invalid email id or Password";
            exit();
        }
    }


    ?>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">

        <title>Shopping Portal | Signi-in | Signup</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Customizable CSS -->
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/green.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
        <link href="assets/css/lightbox.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/rateit.css">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

        <link rel="stylesheet" href="assets/css/config.css">

        <link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
        <link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
        <link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
        <!-- <script type="text/javascript">
            function valid() {
                if (document.register.password.value != document.register.confirmpassword.value) {
                    alert("Password and Confirm Password Field do not match  !!");
                    document.register.confirmpassword.focus();
                    return false;
                }
                return true;
            }
        </script> -->
        <!-- <script>
            function userAvailability() {
                $("#loaderIcon").show();
                jQuery.ajax({
                    url: "check_availability.php",
                    data: 'email=' + $("#email").val(),
                    type: "POST",
                    success: function(data) {
                        $("#user-availability-status1").html(data);
                        $("#loaderIcon").hide();
                    },
                    error: function() {}
                });
            }
        </script> -->

    </head>

    <body class="cnt-home">

        <header class="header-style-1">

            <?php include('includes/top-header.php'); ?>
            <?php include('includes/main-header.php'); ?>
            <?php include('includes/menu-bar.php'); ?>

        </header>

        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        <li><a href="home.html">Home</a></li>
                        <li class='active'>About</li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->



        <div>
            <section id="scrollspyAbout" class="py-5 py-xl-8 bsb-section-py-xxl-1">
                <div class="container">
                    <div class="row justify-content-md-center" style="margin-left: 180px;">
                        <div class="col-12 col-md-10 col-lg-10 col-xl-7">
                            <h1 class="fs-6 mb-2 text-secondary text-center text-uppercase">Our Design Process</h1>
                            <h3 class="display-5 mb-4 mb-md-5 text-center">Our design approach is very organized to ensure satisfaction for our esteemed clients.</h3>
                            <hr class="w-50 mx-auto mb-5 mb-xl-9 border-dark-subtle">
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row gy-5 gy-lg-0 align-items-lg-center">
                        <div class="col-12 col-lg-6 " style=" border-radius: 50%; ">
                            <img src="./assets//images//logo (2).png" style="height: 400px; width: 520px;  object-fit: cover; " alt="">
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row justify-content-xl-end">
                                <div class="col-12 col-xl-11">
                                    <div class="d-flex mb-4">
                                        <div>
                                            <span class="btn btn-primary bsb-btn-circle bsb-btn-circle-lg pe-none me-4 bsb-tpl-font fs-5">1</span>
                                        </div>
                                        <div>
                                            <h4 class="h2 mb-4">Planning</h4>
                                            <p class="mb-0 text-secondary">Get to know your users and their needs better through surveys, interviews, usability testing, and other methods.</p>
                                        </div>
                                    </div>
                                    <div class="d-flex mb-4">
                                        <div>
                                            <span class="btn btn-primary bsb-btn-circle bsb-btn-circle-lg pe-none me-4 bsb-tpl-font fs-5">2</span>
                                        </div>
                                        <div>
                                            <h4 class="h2 mb-4">Launch</h4>
                                            <p class="mb-0 text-secondary">This involves creating wireframes, mockups, and prototypes to test out your ideas and get feedback from users.</p>
                                        </div>
                                    </div>
                                    <div class="d-flex mb-0">
                                        <div>
                                            <span class="btn btn-primary bsb-btn-circle bsb-btn-circle-lg pe-none me-4 bsb-tpl-font fs-5">3</span>
                                        </div>
                                        <div>
                                            <h4 class="h2 mb-6">Finalize Product</h4>
                                            <p class="mb-0 text-secondary">Once your product is launched, it's important to gather feedback from users to learn what they like and dislike about it.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="scrollspyTeam" class="py-5 py-xl-8 bsb-section-py-xxl-1">
      <div class="container" style="margin-left: 380px; padding-top:120px;">
        <div class="row justify-content-md-center">
          <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
            <h1 class="fs-6 mb-2 text-secondary text-center text-uppercase">Our Team</h1>
            <h3 class="display-5 mb-4 mb-md-5 text-center">We are a group of innovative teams.</h3>
            <hr class="w-50 mx-auto mb-5 mb-xl-9 border-dark-subtle">
          </div>
        </div>
      </div>

      <div class="container overflow-hidden">
        <div class="row  gy-lg-0 gx-xxl-5" style="margin-left: 20px;">
          <div class="col-12 col-md-6 col-lg-3" style="padding-right: 120px;">
            <div class="card border-0 border-bottom border-primary shadow-sm overflow-hidden">
              <div class="card-body p-0">
                <figure class="m-0 p-0">
                <img class="img-fluid" loading="lazy" style="height: 350px; width: 300px;" src="../shopping/assets/team/bhushan.jpg" alt="">
                  <figcaption class="m-0 p-4">
                    <h4 class="mb-1">Bhushan Satote</h4>
                    <p class="text-secondary mb-0"  style="width: 220px;">Backend & Database Handler</p>
                  </figcaption>
                </figure>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-3" style="padding-left: 120px;">
            <div class="card border-0 border-bottom border-primary shadow-sm overflow-hidden">
              <div class="card-body p-0">
                <figure class="m-0 p-0">
                  <img class="img-fluid" loading="lazy" style="height: 350px; width: 300px; obj-fit:cover;" src="../shopping/assets/team/dhruv.jpg" alt="">
                  <figcaption class="m-0 p-4">
                    <h4 class="mb-1">Dhruv Trivedi</h4>
                    <p class="text-secondary mb-0">Frontend Design Handler</p>
                  </figcaption>
                </figure>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-3" style="padding-left: 225px;">
            <div class="card border-0 border-bottom border-primary shadow-sm overflow-hidden">
              <div class="card-body p-0">
                <figure class="m-0 p-0">
                  <img class="img-fluid" loading="lazy" style="height: 350px; width: 300px;" src="../shopping/assets/team/pruthvi.jpg" alt="">
                  <figcaption class="m-0 p-4">
                    <h4 class="mb-1" style="width: 220px;">Pruthviraj Solanki</h4>
                    <p class="text-secondary mb-0" style="width: 220px;">Multi-Media Handler</p>
                  </figcaption>
                </figure>
              </div>
            </div>
          </div>
          
          
        </div>
      </div>
    </section>
        </div>

        <?php include('includes/footer.php'); ?>
        <script src="assets/js/jquery-1.11.1.min.js"></script>

        <script src="assets/js/bootstrap.min.js"></script>

        <script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="assets/js/echo.min.js"></script>
        <script src="assets/js/jquery.easing-1.3.min.js"></script>
        <script src="assets/js/bootstrap-slider.min.js"></script>
        <script src="assets/js/jquery.rateit.min.js"></script>
        <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/scripts.js"></script>


        <script src="switchstylesheet/switchstylesheet.js"></script>

        <!-- <script>
            $(document).ready(function() {
                $(".changecolor").switchstylesheet({
                    seperator: "color"
                });
                $('.show-theme-options').click(function() {
                    $(this).parent().toggleClass('open');
                    return false;
                });
            });

            $(window).bind("load", function() {
                $('.show-theme-options').delay(2000).trigger('click');
            });
        </script> -->



    </body>

    </html>
</body>

</html>