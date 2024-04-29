import 'dart:io'; // Import library untuk menggunakan input/output

void main() {
  // Meminta pengguna untuk memasukkan teks
  stdout.write('Masukkan teks : ');

  // Membaca teks dari input pengguna
  String teks = stdin.readLineSync()!;

  // Membagi teks menjadi kata-kata berdasarkan spasi
  List<String> kata = teks.split(' ');

  // Menghitung jumlah kata dalam teks
  int jumlahKata = kata.length;

  // Menampilkan jumlah kata
  print('Jumlah kata dalam teks : $jumlahKata');
}