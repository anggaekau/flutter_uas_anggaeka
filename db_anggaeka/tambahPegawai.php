<?php
include "koneksi.php";
$npm = $_POST['npm'];
$nama = $_POST['nama'];
$tempat_lahir = $_POST['tempat_lahir'];
$tanggal_lahir = $_POST['tanggal_lahir'];
$jenis_kelamin = $_POST['jenis_kelamin'];
$agama = $_POST['agama'];
$no_telp = $_POST['no_telp'];
$alamat = $_POST['alamat'];
$connect->query("INSERT INTO tb_mahasiswa (npm, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, agama, no_telp, alamat) VALUES ('".$npm."','".$nama."','".$tempat_lahir."','".$tanggal_lahir."','".$jenis_kelamin."','".$agama."','".$no_telp."','".$alamat."')");
?>