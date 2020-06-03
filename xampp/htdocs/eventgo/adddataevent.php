<?php  

	include 'connect.php';
	header("Access-Control-Allow-Origin: *");

	$idacc = $_POST['idacc'];
	$nama_event = $_POST['nama_event'];
	$deskripsi_event = $_POST['deskripsi_event'];
	$tanggal_mulai = $_POST['tanggal_mulai'];
	$tanggal_selesai = $_POST['tanggal_selesai'];
	$lokasi = $_POST['lokasi'];
	$kategori = $_POST['kategori'];

	$connect->query("INSERT INTO event(idacc,nama_event,deskripsi_event,tanggal_mulai,tanggal_selesai,kategori,lokasi) VALUES ('".$idacc."','".$nama_event."','".$deskripsi_event."','".$tanggal_mulai."','".$tanggal_selesai."','".$kategori."','".$lokasi."')");

?>