<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="pageadmin/img/favicon.png">

    <title>Login Page</title>

    <!-- Bootstrap CSS -->
    <link href="pageadmin/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="pageadmin/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="pageadmin/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="pageadmin/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="pageadmin/css/style.css" rel="stylesheet">
    <link href="pageadmin/css/style-responsive.css" rel="stylesheet" />
</head>

<body class="login-img3-body">

    <div class="container">
        <h1 align="center" style="margin-top:100px; font-family:Verdana, Geneva, sans-serif; color:#FFF"><b>HELLO ADMIN</b></h1>
        <form class="login-form" method="POST" action="core/login-proses.php">
            <div class="login-wrap">
                <p class="login-img"><i class="icon_lock_alt"></i></p>
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon_profile"></i></span>
                    <input type="text" class="form-control" name="username" placeholder="Username" autofocus>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
                <label class="checkbox">
                    <input type="checkbox" value="remember-me"> Ingat Saya
                </label>
                <button class="btn btn-primary btn-lg btn-block" type="submit">Masuk</button>
            </div>
        </form>
    </div>


</body>

</html>