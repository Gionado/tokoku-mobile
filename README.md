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



# Tugas 8
# Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push()
Menambahkan halaman (route) baru di atas tumpukan navigasi. Halaman sebelumnya tetap ada di tumpukan, di bawah halaman baru. User dapat menekan tombol back untuk kembali ke halaman sebelumnya.
Sebaiknya digunakan saat user menavigasi ke halaman detail di mana ia diharapkan untuk kembali. Untuk penerapan yang sudah diimplementasikan adalah ketika user menekan add product yang di main page lalu ingin kembali ke halaman sebelumnya.

Navigator.pushReplacement()
engganti halaman (route) yang saat ini ada di tumpukan dengan halaman baru. Halaman sebelumnya dihapus dari tumpukan. User tidak bisa menekan tombol "kembali" untuk kembali ke halaman yang baru saja diganti.
Digunakan saat user membuka drawer dan memilih "Home" atau "Add Product", pushReplacement() digunakan, ini digunakan untuk navigasi seperti drawer agar tumpukan navigasi tidak menumpuk.


# Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Scaffold: Bertindak sebagai "kerangka" utama untuk setiap halaman (menu.dart dan productlist_form.dart), menyediakan slot-slot standar seperti appBar, body, dan drawer.

AppBar: Ditempatkan di slot appBar milik Scaffold, memberikan area header yang konsisten di bagian atas setiap halaman untuk menampilkan judul ('TokoKu' di menu.dart dan 'Form Tambah Produk' di productlist_form.dart) dan secara otomatis menampilkan tombol untuk membuka Drawer.

Drawer: Ditempatkan di slot drawer milik Scaffold, membuat widget terpisah (left_drawer.dart) dan menggunakannya kembali di setiap halaman (MyHomePage dan ProductFormPage).


# Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Padding
Kelebihan, memberikan spasi di sekitar elemen UI. Tanpa Padding, semua TextFormField akan saling menempel dan menempel ke tepi layar, membuatnya terlihat berantakan dan sulit digunakan. Contoh di productlist_form.dart, Padding dengan const EdgeInsets.all(8.0) di sekeliling setiap TextFormField, DropdownButtonFormField, dan SwitchListTile.

SingleChildScrollView
Kelebihan, ini adalah widget untuk form. Saat user mengetik di TextFormField, keyboard virtual akan muncul dan menutupi sebagian layar. Tanpa SingleChildScrollView, field yang ada di bagian bawah mungkin akan tertutup oleh keyboard dan tidak dapat diakses. Contoh di productlist_form.dart seluruh Column dibungkus di dalam body Form dengan SingleChildScrollView.

ListView
Kelebihan, mirip dengan SingleChildScrollView, ListView juga menyediakan kemampuan scrolling. Namun, ListView lebih dioptimalkan untuk menampilkan daftar widget yang panjang dan seragam. Contoh di left_drawer.dart ListView digunakan sebagai child dari Drawer.


# Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk menyesuaikan warna tema agar konsisten, dapat menggunakan ThemeData yang didefinisikan di MaterialApp (main.dart). 
colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blueAccent[]),
primarySwatch: Colors.blue memberi tahu Flutter untuk menggunakan Colors.blue sebagai warna dasar.
