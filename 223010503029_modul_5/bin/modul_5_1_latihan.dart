import 'dart:io'; // Import library untuk menggunakan input/output

void main() {
  // Meminta pengguna untuk memasukkan banyak bilangan
  stdout.write('Masukkan banyak bilangan : ');
  int n = int.parse(stdin.readLineSync()!);
  int total = 0;
  
  // Meminta pengguna untuk memasukkan bilangan sebanyak n kali
  for (int i = 1; i <= n; i++) {
    stdout.write('Masukkan bilangan ke-$i : ');
    int bilangan = int.parse(stdin.readLineSync()!);
    total += bilangan; // Mengakumulasi total bilangan
  }
  
  // Menghitung rata-rata dan mencetak hasilnya
  double rata = total / n;
  print('Rata-rata : $rata');
}
