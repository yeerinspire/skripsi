<?php
session_start();
include 'koneksi.php';

$username = $_POST['username'];
$password = md5($_POST['password']);

$query = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";

$sql = mysqli_query($conn, $query);

$result = mysqli_fetch_array($sql);

if ($result > 0) {
	$_SESSION['user_id'] = $result['id'];
	$_SESSION['username'] = $username;
	$_SESSION['level'] = $result['level'];

	$level = $_SESSION['level'];
	if ($_SESSION['level'] == 'admin_poliklinik') {
		header("location:../pageadmin/404.html");
	} else if ($_SESSION['level'] == 'admin_prodi') {
		header("location:../pageadmin/index.html");
	}

	//header("location:../pageadmin/index.html");
	// echo "Login Berhasil";
} else {
	echo    '<script>
				window.alert("Login gagal");
			</script>';
	echo mysqli_error($conn);
}
// $login = mysql_query("select * from user where username='$username' and password='$password'");
// $cek = mysql_num_rows($login);
 
// if($cek > 0){
// 	session_start();
// 	$_SESSION['username'] = $username;
// 	$_SESSION['status'] = "login";
// 	header("location:admin/index.php");
// }else{
// 	header("location:index.php");	
// }
