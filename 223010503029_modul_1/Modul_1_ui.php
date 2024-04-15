<?php

session_start();

if (!isset($_SESSION['data'])) {
  $_SESSION['data'] = [];
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  if (isset($_GET['aksi']) && $_GET['aksi'] == 'hapus' && isset($_GET['idx'])) {
    $idx = $_GET['idx'];
    if (isset($_SESSION['data'][$idx])) {
      array_splice($_SESSION['data'], $idx, 1);
    }
  }
} else if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['name']) && isset($_POST['role'])) {
  $name = $_POST['name'];
  $role = $_POST['role'];

  $_SESSION['data'][] = [
    'name' => $name,
    'role' => $role
  ];
}

function get_jumlah_vokal_konsonan($name)
{
  $vokal = ['a', 'i', 'u', 'e', 'o'];
  $jumlah_vokal = 0;
  foreach ($vokal as $v) {
    $jumlah_vokal += substr_count(strtolower($name), $v);
  }

  return [
    'vokal' => $jumlah_vokal,
    'konsonan' => strlen(str_replace(" ", "", $name)) - $jumlah_vokal
  ];
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Modul 1</title>
</head>

<style>
  div:has(> table) {
    margin-top: 20px;
    overflow-x: auto;
  }

  table {
    width: 100%;
    border-collapse: collapse;
  }

  th,
  td {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
  }
</style>

<body>
  <h1>Mengelola Nama Anggota Keluarga</h1>
  <form method="post">
    <input type="text" name="name" placeholder="Nama" required />
    <input type="text" name="role" placeholder="Sebagai ?" required />
    <button type="submit">Tambah</button>
  </form>
  <div>
    <?php
    if (!count($_SESSION['data'])) {
    ?>
      <h3>Data masih kosong!</h3>
    <?php
    } else {
    ?>
      <h3>Data Anggota Keluarga</h3>
      <table>
        <thead>
          <tr>
            <th>Nama</th>
            <th>Sebagai</th>
            <th>Jumlah Kata</th>
            <th>Jumlah Huruf</th>
            <th>Kebalikan Nama</th>
            <th>Jumlah Vokal</th>
            <th>Jumlah Konsonan</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $idx = count($_SESSION['data']) - 1;
          foreach (array_reverse($_SESSION['data']) as $data) {
            $name = isset($data["name"]) ? $data["name"] : '';
            $role = isset($data["role"]) ? $data["role"] : '';
          ?>
            <tr>
              <td><?= $name ?></td>
              <td><?= $role ?></td>
              <td><?= str_word_count($name) ?></td>
              <td><?= strlen(str_replace(" ", "", $name)) ?></td>
              <td><?= strrev($name) ?></td>
              <td><?= get_jumlah_vokal_konsonan($name)['vokal'] ?></td>
              <td><?= get_jumlah_vokal_konsonan($name)['konsonan'] ?></td>
              <td><a href="?aksi=hapus&idx=<?= $idx ?>"><button>Hapus</button></a></td>
            </tr>
          <?php
            $idx--;
          } ?>
        </tbody>

      </table>
    <?php
    }
    ?>
  </div>

</body>

</html>
