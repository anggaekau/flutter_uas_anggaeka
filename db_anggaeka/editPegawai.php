<?php
include "koneksi.php";
$id = $_POST['id'];
$npm = $_POST['npm'];
$nama = $_POST['nama'];
$tempat_lahir = $_POST['tempat_lahir'];
$tanggal_lahir = $_POST['tanggal_lahir'];
$jenis_kelamin = $_POST['jenis_kelamin'];
$agama = $_POST['agama'];
$no_telp = $_POST['no_telp'];
$alamat = $_POST['alamat'];
$connect->query("UPDATE tb_mahasiswa SET npm= '".$npm."',nama = '".$nama."', tempat_lahir = '".$tempat_lahir."', tanggal_lahir= '".$tanggal_lahir."', jenis_kelamin= '".$jenis_kelamin."',agama= '".$agama."', no_telp= '".$no_telp."', alamat= '".$alamat."' WHERE id=".$id);
?>