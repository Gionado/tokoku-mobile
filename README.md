# TokoKu

# Tugas 7
# Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget Tree adalah struktur hierarki yang menggambarkan bagaimana semua widget saling berhubungan di dalam aplikasi Flutter. Setiap elemen visual (teks, tombol, gambar, layout, dan lain lain) adalah sebuah widget dimana mereka tersusun seperti pohon.

Hubungan Parent–Child antar widget, Setiap widget child hanya bisa memiliki satu parent dan Parent bertanggung jawab untuk menentukan layout (penempatan) child dan memberikan data atau style ke child melalui inherited widgets. Child hanya mengontrol tampilannya sendiri (isi dan gaya internal).

# Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
MaterialApp, Widget utama yang menyediakan konfigurasi global aplikasi (tema, navigasi, dll).
Scaffold, Struktur dasar halaman (memiliki AppBar, Body, FloatingActionButton, dll).
AppBar,   Menampilkan bilah atas (judul aplikasi).
Padding,  Memberi jarak di sekitar widget lain.
Column,   Menyusun widget secara vertikal.
Row,      Menyusun widget secara horizontal.
InfoCard, Widget buatan untuk menampilkan NPM, Nama, dan Kelas dalam bentuk kartu.
Card,     Menampilkan tampilan seperti kartu dengan bayangan.
Container,Mengatur ukuran, padding, dan warna latar widget.
Text,     Menampilkan teks.
SizedBox, Memberikan jarak atau ukuran kosong antar widget.
Center,   Menempatkan widget di tengah.
GridView.count, Membuat tata letak grid dengan jumlah kolom tertentu.
ItemCard, Widget buatan sendiri untuk menampilkan ikon + nama menu.
Material, Memberi efek visual khas Material Design (seperti warna latar & ripple effect).
InkWell,  Memberikan efek tap (gelombang) dan fungsi onTap.
Icon,     Menampilkan ikon.
SnackBar, Menampilkan pesan pop-up sementara di bagian bawah layar.
ScaffoldMessenger, Menangani tampilan SnackBar di dalam Scaffold.
MediaQuery, Mendapatkan informasi ukuran layar (dipakai di InfoCard).

# Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp bisa dibilang adalah pondasi utama dari hampir semua aplikasi Flutter yang memakai gaya desain Material Design (desain khas Android).
Widget ini berperan sebagai pembungkus besar (root) yang mengatur banyak hal penting dalam aplikasi — mulai dari tema warna, navigasi antar halaman, judul aplikasi, hingga tampilan dasar komponen seperti tombol dan AppBar.

# Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaannya terletak pada apakah widget tersebut memiliki keadaan (state) yang bisa berubah selama aplikasi berjalan atau tidak.

StatelessWidget adalah widget yang tidak bisa berubah. Artinya, semua data di dalamnya sudah tetap dari awal dan tidak akan diperbarui meskipun pengguna berinteraksi. Contoh: teks, ikon, atau tombol statis.

StatefulWidget digunakan jika ingin membuat tampilan yang bisa berubah secara dinamis. StatefulWidget memiliki state object di mana data bisa diperbarui, dan setiap kali data berubah, tampilan akan dibangun ulang secara otomatis. Misalnya, sebuah tombol yang ketika ditekan menambah angka dan form yang menyimpan input pengguna

# Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah sebuah referensi yang menunjukkan lokasi sebuah widget di dalam pohon widget. BuildContext bukan widget itu sendiri, melainkan informasi tentang di mana widget tersebut berada. 
Dengan BuildContext, kita bisa mengakses hal-hal seperti, tema aplikasi (Theme.of(context)), navigator untuk berpindah halaman (Navigator.of(context)), scaffold untuk menampilkan SnackBar (ScaffoldMessenger.of(context)).
Setiap kali terdapat build(BuildContext context), Flutter sedang memberikan "alamat" posisi widget tersebut di dalam UI-nya, supaya bisa memanfaatkan informasi yang relevan di tempat tersebut.

# Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot Reload memungkinkan untuk menyimpan perubahan kode, dan Flutter akan langsung memperbarui tampilan tanpa mengulang aplikasi dari awal.
Artinya, data dan posisi tampilan yang sedang aktif tetap dipertahankan.
Misalnya, sedang membuka halaman tertentu dan hanya ingin mengubah warna atau teks dengan hot reload, kita bisa melihat hasilnya dalam hitungan detik tanpa kehilangan posisi halaman.

Sedangkan Hot Restart akan memulai ulang seluruh aplikasi dari awal, seperti menekan tombol restart di komputer.
Semua data, variabel, dan state akan hilang, dan aplikasi dibangun kembali dari nol.
Hot restart digunakan ketika mengubah bagian kode yang mempengaruhi state awal aplikasi atau struktur utamanya, misalnya menambah widget baru di root.