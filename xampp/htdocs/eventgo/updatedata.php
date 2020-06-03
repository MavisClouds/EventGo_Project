<?php  

include 'connect.php';
header("Access-Control-Allow-Origin:*");

$idevent = $_POST['idevent'];
$nama_event = $_POST['nama_event'];
$deskripsi_event = $_POST['deskripsi_event'];
$tanggal_mulai = $_POST['tanggal_mulai'];
$tanggal_selesai = $_POST['tanggal_selesai'];
$lokasi = $_POST['lokasi'];
$kategori = $_POST['kategori'];

$connect->query(" UPDATE event SET nama_event = '".$nama_event."', deskripsi_event = '".$deskripsi_event."', tanggal_mulai = '".$tanggal_mulai."', tanggal_selesai = '".$tanggal_selesai."', lokasi = '".$lokasi."', kategori = '".$kategori."' WHERE idevent = ".$idevent);

?>