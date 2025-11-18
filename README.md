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




# Tugas 9
# Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map String, dynamic tanpa model (terkait validasi tipe, null-safety, maintainability)?
Mengapa perlu model?
Type Safety, Dart adalah bahasa yang strongly-typed. JSON murni bersifat dinamis. Dengan membuat model, kita memastikan bahwa data yang diolah memiliki tipe yang benar (misalnya, price pasti int, bukan String).
Struktur Data yang Jelas, Model mendefinisikan struktur data secara eksplisit. Ini memudahkan developer lain (atau diri sendiri di masa depan) untuk memahami data apa yang tersedia tanpa harus menebak-nebak dari respons API mentah.
Auto-completion & Compile-time Check, Dengan model, IDE (seperti VS Code) bisa memberikan saran kode (autocomplete) saat mengakses properti (misal: .name, .price). Jika kita salah ketik nama properti, compiler akan langsung memberitahu error sebelum aplikasi dijalankan.

Konsekuensi jika hanya memakai Map String, dynamic:
Rawan Typo, Kita harus mengetik key secara manual (contoh: data['prsce'] bukannya data['price']). Kesalahan ini tidak akan terdeteksi saat coding, tapi akan menyebabkan aplikasi crash saat dijalankan (runtime error).
Kehilangan Fitur IDE, Tidak ada autocomplete. Kita harus hafal semua key yang ada di JSON.
Validasi Manual,Kita harus melakukan pengecekan tipe data secara manual setiap kali mengakses data untuk menghindari error (misalnya, mencoba melakukan operasi matematika pada String).

# Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Fungsi:
Package http, Merupakan pustaka dasar di Flutter untuk melakukan permintaan HTTP standar (GET, POST, PUT, DELETE) ke server/API.
Package pbp_django_auth (CookieRequest), Merupakan wrapper (pembungkus) khusus yang dibuat untuk mempermudah interaksi antara Flutter dan Django, khususnya dalam menangani sesi (session).

Perbedaan Peran:
http (Stateless), Secara default, protokol HTTP itu stateless. Jika kita login menggunakan package http biasa, server memberikan cookie sesi, tetapi http tidak menyimpannya secara otomatis untuk permintaan berikutnya. Akibatnya, setelah login, jika kita meminta data "My Products", server akan menganggap kita belum login.
CookieRequest (Stateful), CookieRequest bekerja seperti browser. Ia menyimpan cookies (seperti sessionid dan csrftoken) yang diberikan server saat login. Setiap kali kita mengirim permintaan baru menggunakan CookieRequest, ia otomatis menyertakan cookies tersebut. Ini memungkinkan server mengenali bahwa "ini adalah user yang sama yang tadi sudah login".


# Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Instance CookieRequest menyimpan state login (melalui cookies/session ID) pengguna saat ini.
Jika kita membuat instance baru CookieRequest di setiap halaman (misalnya, satu di Login Page, satu lagi di Product Page), maka instance di Product Page adalah objek baru yang kosong (tidak punya cookie). Akibatnya, server akan menganggap pengguna belum login di halaman tersebut.
Dengan membagikan satu instance yang sama (Single Source of Truth) menggunakan Provider ke seluruh aplikasi, kita memastikan bahwa sesi login yang didapat di halaman Login tetap terjaga dan bisa digunakan saat pengguna berpindah ke halaman Home, Daftar Produk, atau Tambah Produk.


# Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Konfigurasi & Alasannya:
ALLOWED_HOSTS = ['10.0.2.2', ...]:
Di dalam emulator Android, localhost atau 127.0.0.1 merujuk pada emulator itu sendiri, bukan komputer host.
Alamat IP khusus 10.0.2.2 digunakan oleh emulator Android untuk mengakses localhost komputer host (tempat server Django berjalan). Django perlu mengizinkan host ini agar tidak menolak permintaan.

Mengaktifkan CORS (django-cors-headers):
Mekanisme keamanan browser/web memblokir permintaan dari origin (asal) yang berbeda. Aplikasi Flutter dianggap sebagai origin yang berbeda dari server Django. CORS headers memberitahu browser/klien bahwa "Origin ini diizinkan mengambil data".

Pengaturan SameSite/Cookie:
Di lingkungan development (lokal), pengaturan cookie yang terlalu ketat (Secure/SameSite=Strict) bisa menyebabkan cookie sesi ditolak oleh aplikasi mobile karena tidak menggunakan HTTPS. Melonggarkan aturan ini memungkinkan sesi login tersimpan.

Izin Internet di Android (AndroidManifest.xml):
Secara default, aplikasi Android tidak diizinkan mengakses jaringan demi keamanan pengguna. Kita wajib menambahkan uses-permission android:name="android.permission.INTERNET"  agar aplikasi bisa mengirim request ke luar.

Akibat jika salah konfigurasi: Aplikasi akan mengalami error koneksi (Connection Refused, Network Error), atau proses login berhasil tetapi pengguna langsung ter-logout kembali karena cookie sesi ditolak/tidak tersimpan.


# Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Input: Pengguna mengisi form di Flutter (Judul, Harga, Deskripsi).

Serialisasi: Saat tombol simpan ditekan, data dari form diambil dan diubah (diserialisasi) menjadi format JSON string menggunakan jsonEncode.

Transmisi (POST): Flutter (melalui CookieRequest) mengirim HTTP POST request ke endpoint Django (misal: /create-flutter/) membawa data JSON tadi.

Pemrosesan di Django:
Django menerima request.
Membaca body JSON.
Membuat objek model baru.
Menyimpan ke database (.save()).
Mengembalikan respons JSON (misal: {"status": "success"}).

Fetching (GET): Untuk menampilkan, Flutter mengirim HTTP GET request ke endpoint JSON Django (misal: /json/).

Deserialisasi: Flutter menerima respons JSON mentah, lalu mengubahnya menjadi objek Dart (Model ProductEntry) menggunakan ProductEntry.fromJson.

Display: Data objek tadi ditampilkan ke layar menggunakan widget seperti ListView, Text, atau Card.


# Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Register:
Flutter: Mengirim POST request berisi username dan password ke endpoint register Django.
Django: Memvalidasi data, lalu membuat akun baru menggunakan User.objects.create_user(). Mengirim respons sukses.

Login:
Flutter: Mengirim POST request berisi kredensial ke endpoint login.
Django: Memverifikasi kredensial dengan authenticate(). Jika valid, panggil login(). Fungsi ini membuat Session ID di database server.

Response: Django mengirim respons sukses beserta header Set-Cookie yang berisi sessionid.
Flutter (CookieRequest): Menangkap header tersebut dan menyimpan sessionid di memori lokal aplikasi.

Akses Halaman Terproteksi:
Saat Flutter meminta data produk, ia mengirim request + cookie sessionid.
Django mengecek session ID tersebut valid dan milik siapa, lalu memberikan data milik user tersebut.

Logout:
Flutter: Mengirim request ke endpoint logout.
Django: Menghapus sesi dari database server (auth_logout).
Flutter: CookieRequest menghapus cookie yang tersimpan di lokal. User kembali ke status guest.


# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Persiapan Backend (Django):
Membuat aplikasi authentication baru di Django.
Membuat fungsi view login, register, dan logout di views.py yang mengembalikan JsonResponse dan menggunakan @csrf_exempt.
Menambahkan konfigurasi CORS dan ALLOWED_HOSTS di settings.py.
Membuat endpoint JSON khusus (show_my_products_json) yang memfilter produk berdasarkan request.user.

2. Persiapan Frontend (Flutter):
Menambahkan dependensi: provider, pbp_django_auth, http di pubspec.yaml.
Mengonfigurasi AndroidManifest.xml untuk izin internet.
Membungkus widget utama MyApp dengan Provider yang menyediakan CookieRequest agar state login bisa diakses global.

3. Membuat Model Kustom:
Mengambil contoh data JSON dari endpoint Django.
Menggunakan Quicktype untuk men-generate model ProductEntry (file lib/models/product_entry.dart) agar sesuai dengan struktur data Django.

4. Implementasi Fitur Auth (Register & Login):
Membuat LoginPage dan RegisterPage.
Menggunakan request.login() dari pbp_django_auth untuk login.
Menambahkan logika navigasi: Jika login sukses, arahkan ke MyHomePage (Menu Utama).

5. Implementasi Daftar Produk (Product Entry List):
Membuat halaman ProductEntryListPage.
Menggunakan FutureBuilder untuk memanggil fungsi fetchProduct.

Menambahkan logika filter di fungsi fetchProduct:
Jika ingin "My Products", panggil endpoint /my-products-json/.
Jika "All Products", panggil /json/.
Jika filter "Featured" aktif, lakukan penyaringan list di sisi Flutter (if (product.isFeatured)...).
Menampilkan data menggunakan ListView.builder dan widget custom ProductEntryCard.

6. Implementasi Detail Page:
Membuat halaman ProductDetailPage yang menerima objek ProductEntry via konstruktor.
Menampilkan seluruh atribut (Gambar, Nama, Harga, Deskripsi, Kategori, dll) dengan tata letak yang rapi.
Menambahkan tombol "Back" menggunakan Navigator.pop().

7. Integrasi & Navigasi (Drawer & AppBar):
Memperbarui LeftDrawer untuk memiliki menu navigasi ke Home, Tambah Produk, Daftar Produk, dan Logout.
Menambahkan tombol Logout di AppBar.
Menambahkan logika filter (Dropdown Menu) di halaman List untuk berpindah antara "All Products", "My Products", dan "Featured".

8. Styling (Pewarnaan):
Menyesuaikan tema global di main.dart menggunakan colorScheme dengan warna dasar Coklat (0xFF713F12) agar senada dengan desain Django.
Mengganti warna-warna hardcoded (seperti Colors.indigo) menjadi Theme.of(context).colorScheme.primary.