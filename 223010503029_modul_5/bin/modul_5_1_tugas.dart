void main() {
  // Membuat sebuah map yang berisi informasi orang
  Map<String, dynamic> person = {
    'name': 'Luniko Jama', // Menyimpan nama orang
    'age': 20, // Menyimpan usia orang
    'hobbies': 'Bernyanyi, Bermain Musik, Bermain Game', // Menyimpan daftar hobi orang sebagai string
  };

  // Menampilkan hasilnya
  print('Informasi Orang : ');

  // Menampilkan nama orang
  print('Nama : ${person['name']}');

  // Menampilkan usia orang
  print('Usia : ${person['age']}');

  // Menampilkan daftar hobi orang
  print('Hobi : ${person['hobbies']}');

  // Menampilkan pesan penutup
  print('Terima Kasih!');
}
