<?php
if (!isset($_SESSION)) {
    session_start();
}
include_once("koneksi.php");
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Poliklinik Sumber Sehat</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Poliklinik Sumber Sehat</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.php">Home</a>
                    </li>
                    <?php
                    if (!isset($_SESSION["role"])) {
                    ?>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="index.php?page=pendaftaranPasien">Daftar Pasien</a>
                        </li>
                    <?php
                    }
                    ?>
                    <?php
                    if (isset($_SESSION['role'])) {
                        $role = $_SESSION['role'];
                        if ($role == "admin") {


                    ?>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Data Master</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="index.php?page=obat">Obat</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="index.php?page=dokter">Dokter</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="index.php?page=poli">Poli</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="index.php?page=olahPasien">Olah Pasien</a>
                                    </li>
                                </ul>
                            </li>
                        <?php
                        }

                        if ($role == "dokter") {
                        ?>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Data Master</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="index.php?page=periksa">Periksa</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="index.php?page=pasien">Riwayat Pasien</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="index.php?page=jadwalDokter">Jadwal Dokter</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="index.php?page=profilDokter">Profil Dokter</a>
                            </li>
                        <?php
                        }
                        if ($role == "pasien") {
                        ?>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="index.php?page=daftarPoli">Daftar Poli</a>
                            </li>
                    <?php
                        }
                    }
                    ?>
                </ul>

                <?php
                if (isset($_SESSION['role'])) {
                    $role = $_SESSION['role'];
                ?>
                    <div class="ms-auto d-flex">
                        <?php
                        // Jika pengguna sudah login, tampilkan tombol "Logout"
                        if ($role == 'admin') {
                        ?>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.php?page=registerUser">Daftar</a>
                                </li>
                            </ul>
                        <?php
                        }
                        ?>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="Logout.php">Logout (<?php echo $_SESSION['name'] ?>)</a>
                            </li>
                        </ul>
                    </div>
                <?php
                } else {
                    // Jika pengguna belum login, tampilkan tombol "Login" dan "Register"
                ?>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="index.php?page=loginUser">Admin</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="index.php?page=loginDokter">Dokter</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                <?php
                }
                ?>

            </div>
        </div>
    </nav>
    <main role="main" class="container">
        <?php

        if (isset($_GET['page'])) {
            include($_GET['page'] . ".php");
        } else {
            echo "<br><h2>Selamat Datang di Pelayanan Poliklinik Sumber Sehat";

            if (isset($_SESSION['role'])) {
                //jika sudah login tampilkan username
                echo ", " . $_SESSION['name'] . "</h2><hr>";
            } else {
                echo "</h2><hr>Untuk memanfaatkan segala fasilitas yang ditawarkan, silakan lakukan proses login. Apabila Anda belum memiliki akun, jangan khawatir, Anda bisa mendaftar Daftar pasien terlebih dahulu untuk mendapatkan akses pelayanan terbaik.";
            }
        }
        ?>
    </main>

    <style>
    body {
        background-color: #4ABDAA; /* Warna hijau pada latar belakang body */
        font-family: 'Poppins', Helvetica, sans-serif;
    }

    .navbar {
        background-color: #4ABDAA !important; /* Warna hijau pada navbar */
    }

    .navbar-dark .navbar-toggler-icon {
        background-color: #fff;
    }

    .navbar-nav .nav-link {
        color: #fff !important;
    }

    .navbar-nav .nav-link:hover {
        color: #add8e6 !important;
    }

    .navbar-toggler {
        border-color: #fff;
    }

    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 



</style>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>