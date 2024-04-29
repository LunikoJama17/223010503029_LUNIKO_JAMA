void main() {
  // Membuat sebuah variabel list yang berisi map
  List<Map<String, dynamic>> people = [
    {
    'name': 'Luniko Jama', // Menyimpan nama orang
    'age': 20, // Menyimpan usia orang
    'hobbies': 'Bernyanyi, Bermain Musik, Bermain Game', // Menyimpan daftar hobi orang sebagai string
    },

    {
    'name': 'Jamal',
    'age': 21,
    'hobbies': 'Mendaki, Berkebun, Membaca',
    },

    {
    'name': 'Imroatus',
    'age': 25,
    'hobbies': 'Olahraga, Jalan-Jalan, Memancing',
    }

  ];

  // Menampilkan hasilnya
  print('Informasi Orang :');
  for (var person in people) {
    print('Nama : ${person['name']}');

  // Menampilkan usia orang
    print('Usia : ${person['age']}');

  // Menampilkan daftar hobi orang
    print('Hobi : ${person['hobbies']}');

    print('================================================');
  }
  // Menampilkan pesan penutup
    print('Terima Kasih!');
}
