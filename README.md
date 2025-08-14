# 🌍 Nationalize App

**Nationalize App** adalah aplikasi sederhana yang memanfaatkan **public API dari [Nationalize.io](https://nationalize.io/)** untuk memprediksi asal negara seseorang berdasarkan **nama**. Aplikasi ini mengambil data negara dan probabilitas kemunculan suatu nama di berbagai negara.

## 🔧 Fitur Utama

- 🔍 Input nama dan lihat dari negara mana nama itu kemungkinan berasal.
- 📊 Menampilkan daftar negara beserta probabilitasnya.
- 🌐 Menggunakan public API dari Nationalize.io secara real-time.

## 🧠 Cara Kerja

1. Pengguna memasukkan sebuah nama.
2. Aplikasi mengirim permintaan ke: https://api.nationalize.io/?name=nama
3. API akan mengembalikan data berupa daftar negara dengan probabilitas nama tersebut berasal dari negara tersebut.
4. Data ditampilkan secara informatif kepada pengguna.

## 🚀 Cara Menjalankan Aplikasi

1. Clone repositori ini:
    ```bash
    git clone https://github.com/username/nationalize-app.git
    ```
2. Masuk ke direktori project:
    ```bash
    git clone https://github.com/username/nationalize-app.git
    ```
3. Daftarkan dependensi ke pubspec.yaml (flutter_bloc, bloc, dan dio):
    ```pubspec.yaml
    dependencies:
      flutter:
        sdk: flutter
      dio: ^5.9.0
      bloc: ^9.0.0
      flutter_bloc: ^9.1.1
    ```
4. Jalankan perintah: 
    ```bash
    flutter pub get
    ```
5. Jalankan aplikasi:
    ```bash
    Flutter run
    ```


## 💻 Tampilan aplikasi
!["Tampilan aplikasi Flutter"](/assets/nationalize_app.png)



#
## 👤 Developer

#### Dikembangkan oleh:
**Nama**: Feri Irawan <br>
**Kelas**: XII RPL 1 <br>
**No. Presensi**: 14 <br>