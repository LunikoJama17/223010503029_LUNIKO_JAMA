import 'dart:io';

void clearScreen() {
  if (Platform.isWindows) {
    // Jika sistem operasi adalah Windows
    stdout.write('\x1B[2J\x1B[0;0H'); // Perintah untuk membersihkan layar konsol di Windows
  } else {
    // Jika sistem operasi bukan Windows (misalnya Linux, macOS)
    stdout.write('\x1B[2J\x1B[3J\x1B[H'); // Perintah untuk membersihkan layar konsol di Linux dan macOS
  }
}

void main() {
  List<int> angka = [1, 2, 3, 4, 5];

  while (true) {
    clearScreen(); // Membersihkan layar sebelum menampilkan menu
    print('Menu:');
    print('1. Tambah Angka');
    print('2. Tampilkan Angka');
    print('3. Ubah Angka');
    print('4. Hapus Angka');
    print('5. Keluar');

    stdout.write('Pilih menu: ');
    String pilihan = stdin.readLineSync()!;

    switch (pilihan) {
      case '1':
        create(angka);
        break;
      case '2':
        read(angka);
        break;
      case '3':
        update(angka);
        break;
      case '4':
        delete(angka);
        break;
      case '5':
        exit(0); // Keluar dari program
        break;
      default:
        print('Pilihan tidak valid!');
    }

    stdout.write('\nTekan Enter untuk melanjutkan...');
    stdin.readLineSync();
  }
}

void create(List<int> angka) {
  clearScreen(); // Membersihkan layar sebelum menambahkan angka
  stdout.write('Masukkan angka yang ingin ditambahkan: ');
  int newAngka = int.parse(stdin.readLineSync()!);
  angka.add(newAngka);
  print('Angka $newAngka berhasil ditambahkan.');
}

void read(List<int> angka) {
  clearScreen(); // Membersihkan layar sebelum menampilkan angka
  print('Daftar Angka:');
  for (int i = 0; i < angka.length; i++) {
    print('${i + 1}. ${angka[i]}');
  }
}

void update(List<int> angka) {
  clearScreen(); // Membersihkan layar sebelum mengubah angka
  read(angka); // Menampilkan daftar angka terlebih dahulu
  stdout.write('Pilih indeks angka yang ingin diubah: ');
  int index = int.parse(stdin.readLineSync()!) - 1;

  if (index >= 0 && index < angka.length) {
    stdout.write('Masukkan angka baru: ');
    int newAngka = int.parse(stdin.readLineSync()!);
    angka[index] = newAngka;
    print('Angka pada indeks $index berhasil diubah menjadi $newAngka.');
  } else {
    print('Indeks tidak valid!');
  }
}

void delete(List<int> angka) {
  clearScreen(); // Membersihkan layar sebelum menghapus angka
  read(angka); // Menampilkan daftar angka terlebih dahulu
  stdout.write('Pilih indeks angka yang ingin dihapus: ');
  int index = int.parse(stdin.readLineSync()!) - 1;

  if (index >= 0 && index < angka.length) {
    int deletedAngka = angka.removeAt(index);
    print('Angka $deletedAngka pada indeks $index berhasil dihapus.');
  } else {
    print('Indeks tidak valid!');
  }
}
