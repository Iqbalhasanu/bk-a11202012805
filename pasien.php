<?php
if (!isset($_SESSION)) {
    session_start();
}
if (!isset($_SESSION['role'])) {
    // Jika pengguna sudah login, tampilkan tombol "Logout"
    header("Location: index.php?page=loginDokter");
    exit;
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Riwayat Pasien</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <style>
        body {
            background-color: #023d6f; /* Warna biru muda untuk latar belakang body */
            font-family: 'Poppins', Helvetica, sans-serif; /* Gaya font Poppins */
        }

        h2 {
            color: #fff; /* Warna teks putih pada judul h2 */
        }

        .container {
            background-color: #fff; /* Warna latar belakang container */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Efek bayangan pada container */
            margin-top: 20px; /* Jarak atas container */
        }

        .table {
            background-color: #023d6f; /* Warna biru pada tabel */
            color: #fff; /* Warna teks putih pada isi tabel */
        }

        .table th,
        .table td {
            border-color: #fff; /* Warna border putih pada sel tabel */
        }

        .table-hover tbody tr:hover {
            background-color: #add8e6; /* Warna biru muda pada hover baris tabel */
        }
    </style>
</head>

<body>
    <h2>Riwayat Pasien</h2>
    <br>
    <div class="container">
        <br>
        <br>
        <!-- Table-->
        <table class="table table-hover">
            <!--thead atau baris judul-->
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nama Pasien</th>
                    <th scope="col">Tanggal Periksa</th>
                    <th scope="col">No RM</th>
                    <th scope="col">Catatan</th>
                    <th scope="col">Obat</th>
                    <th scope="col">Biaya</th>
                </tr>
            </thead>
            <!--tbody berisi isi tabel sesuai dengan judul atau head-->
            <tbody>
                <!-- Kode PHP untuk menampilkan semua isi dari tabel urut-->
                <?php
                $result = mysqli_query($mysqli, "SELECT ps.nama, ps.no_rm, pr.tgl_periksa, pr.catatan, o.nama_obat, pr.biaya_periksa FROM pasien AS ps
                                                JOIN daftar_poli AS dp ON ps.id = dp.id_pasien
                                                JOIN periksa AS pr ON dp.id = pr.id_daftar_poli
                                                JOIN detail_periksa AS dep ON pr.id = dep.id_periksa
                                                JOIN obat AS o ON dep.id_obat = o.id
                                                JOIN jadwal_periksa AS jp ON dp.id_jadwal = jp.id
                                                JOIN dokter AS dok ON jp.id_dokter = dok.id
                                                WHERE jp.id_dokter IN (SELECT id FROM dokter WHERE id =  '" . $_SESSION['id_dokter'] . "')
                                            ");
                $no = 1;
                while ($data = mysqli_fetch_array($result)) {
                ?>
                    <tr>
                        <th scope="row"><?php echo $no++ ?></th>
                        <td><?php echo $data['nama'] ?></td>
                        <td><?php echo $data['tgl_periksa'] ?></td>
                        <td><?php echo $data['no_rm'] ?></td>
                        <td><?php echo $data['catatan'] ?></td>
                        <td><?php echo $data['nama_obat'] ?></td>
                        <td><?php echo $data['biaya_periksa'] ?></td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>
