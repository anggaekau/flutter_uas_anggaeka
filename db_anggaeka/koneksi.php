<?php
$connect = new mysqli("localhost", "root", "", "db_mahasiswa");
if(!$connect)
{
echo "Koneksi Gagal";
exit();
}
?>