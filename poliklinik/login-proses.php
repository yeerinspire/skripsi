<?php
session_start();

include "koneksi.php";
$pass = md5($_POST['password']);

$sql = mysql_query("SELECT username,password,id FROM user where user = '$_POST[username]' AND password = '$pass'");

$data = mysql_fetch_array($sql);

$hasil = mysql_num_rows($sql);

if($hasil	> 0 )
{
	$_SESSION['username'] = $data[username];
	//$_SESSION['nama'] = $data[nama];
	$_SESSION['password'] = $data[password];
	$_SESSION['id'] = $data[id];
	if($_SESSION['level'] == 'admin'){
			$_SESSION['admin'] = $_SESSION['level'];
			header('location:admin/index.php');
			
		}elseif($_SESSION['level']=='anggota'){
				$sqli = mysql_query("SELECT tbl_anggota.nama, tbl_user.id_user 
				FROM tbl_user INNER JOIN tbl_anggota on tbl_anggota.id_user = tbl_user.id_user
				where tbl_anggota.id_user = '".$_SESSION['id']."'");
				$nama = mysql_fetch_array($sqli);
				$_SESSION['nama'] = $nama['nama'];
				echo "<script>alert('Anda sudah login'); history.go(-1);</script>";
				
			}elseif($_SESSION['level'] == 'petugas'){
					$aktif = mysql_query("select * from tbl_petugas where id_petugas = '".$_SESSION['id']."'");
					$status = mysql_fetch_array($aktif);
					$_SESSION['nama_petugas'] = $status['nama'];
						if($status['status'] == '0'){
								session_destroy();
								echo "<script>alert('Maaf id anda tidak aktif'); history.go(-1);</script>"; 
							}else{
									$_SESSION['petugas'] = $_SESSION['level'];
									header('location:admin/index.php');
								}
				
				}
	/*echo "<script>alert('Anda sudah login'); history.go(-1);</script>";*/
}else{
	echo "<script> alert ('Username dan Password Tidak Terdaftar, Silahkan Mendaftar dahulu!'); history.go(-1);</script>";
}

		
	

?>