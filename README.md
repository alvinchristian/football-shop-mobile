
<details>
<summary>Tugas 7</summary>

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree adalah struktur hierarki yang menggambarkan bagaimana widget disusun dan saling berhubungan. Setiap widget dapat berperan menjadi child atau parent. Parent widget adalah widget yang mengandung atau membungkus widget yang lain sedangkan child widget merupakan widget di dalam parent dan mewarisi konteks atau aturan tata letak dari parent.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

- MaterialApp</br>
widget root yang menyediakan tema, judul, dan navigasi
- ThemeData dan ColorScheme</br>
Mengatur warna dan gaya tampilan aplikasi
- MyHomePage</br>
Halaman utama dari aplikasi dan menampilkan data serta tombol-tombol
- Scaffold</br>
Menyediakan struktur dasar layout halaman
- AppBar</br>
Menampilkan header di bagian atas layar
- Text</br>
Menampilkan teks pada layar.
- Padding</br>
Memberikan jarak di sekitar widget internal.
- Column, Row</br>
Menyusun widget secara vertikal/horizontal
- Center</br>
Menempatkan child di tengah area yang tersedia.
- Container</br>
Wrapper untuk styling

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp memiliki fungsi untuk mengatur tema, homepage, navigation, bahasa, dan routing. Widget ini sering digunakan sebagai widget root karena fungsionalitas dari widget ini merupakan fungsionalitas yang harus konsisten di seluruh aplikasi, contohnya jika bahasa yang digunakan adalah bahasa inggris maka semua bagian aplikasi sebaiknya menggunakan bahasa inggris juka.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget tidak dapat menyimpan data yang berubah-berubah alias statik sedangkan stateful dapat menyimpan data yang berubah-berubah. StatelessWidget digunakan jika kita ingin membuat UI atau komponen yang bersifat statis dan stateful digunakan untuk UI atau komponen yang bersifat dinamis atau tergantung aksi/input pengguna

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree. BuildContext digunakan untuk mengambil data dari parent (misalnya tema, ukuran layar, atau navigator) dan Menentukan bagaimana widget dibangun di dalam metode build().

BuildContext dapat digunakan dengan mempassingnya sebagai parameter dari widget build

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Halo',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    ),
  );
}
```

5. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload adalah fitur Flutter yang memperbarui kode aplikasi secara langsung tanpa kehilangan state sehingga hanya bagian yang diubah yang berubah. Contohnya adalah ketika kita mengupdate teks atau tampilan. Hot restart memulai ulang seluruh aplikasi dari awal, termasuk menghapus semua state yang tersimpan di memori. Oleh sebab itu, hot reload akan lebih cepat dibanding hot restart
</details>


<details>
<summary> Tugas 8 </summary>

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() akan menambah page baru diatas page sekarang sehingga page lama masih ada di stack dan dapat kita gunakan back untuk balik ke page tersebut. Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru sehingga halaman lama dihapus dari stack dan tidak dapat kembali ke halaman sebelumnya. Navigator.push() cocok digunakan saat navigasi antara fitur" di aplikasi sedangkan pushReplacement lebih cocok digunakan pada saat log in dan logout, contohnya ketika user sudah logout seharusnya ia tidak dapat balik ke halaman sebelumnya

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold bertindak sebagai kerangka dasar halaman yang menyediakan struktur tata letak utama, seperti area untuk konten, AppBar, Drawer, Floating Action Button, dan sebagainya. Dengan menggunakan AppBar pada setiap halaman, aplikasi memiliki identitas visual yang konsisten, misalnya dengan menampilkan judul aplikasi dan warna tema yang sama pada bagian atas layar. Sementara itu, Drawer digunakan sebagai navigasi samping yang memuat menu utama, memungkinkan pengguna untuk berpindah antar halaman dengan mudah. 

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu. 

Padding berfungsi untuk memberikan ruang di sekitar elemen-elemen input, sehingga tampilan tidak terlihat terlalu padat dan lebih mudah dibaca. SingleChildScrollView berguna ketika form memiliki banyak field; widget ini memungkinkan seluruh halaman dapat di-scroll sehingga elemen tidak terpotong jika layar perangkat kecil atau keyboard sedang terbuka. Sementara itu, ListView mempermudah penataan elemen form dalam sebuah list yang otomatis dapat di-scroll dan mengatur ruang antar widget tanpa harus menambahkan Column dan SingleChildScrollView secara manual.

Ketika membuat halaman Create Product, saya menggunakan Padding di sekitar TextField seperti Padding(padding: EdgeInsets.all(8.0), child: TextField(...)) agar input terlihat lebih rapi dan tidak menempel ke tepi layar. Kemudian, seluruh form tersebut ditempatkan dalam SingleChildScrollView agar ketika pengguna mengetik dan keyboard muncul, halaman tetap dapat di-scroll tanpa terjadi overflow.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Pertama saya mengubah app bar menjadi warna putih dan tulisan Fulltime menjadi hijau dan Gear menjadi hitam agar sama dengan website. Setelah itu saya ubah tombol-tombol agar sama juga dengan webstie seperti all products memiliki background putih, text hitam, dan border hitam, add product dan my products memiliki background hijau

</details>

