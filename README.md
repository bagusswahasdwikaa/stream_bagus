
# **State Management dengan Streams**

## Nama : Sukma Bagus Wahasdwika

## NIM  : 2241720223

## **Praktikum 1 - Dart Streams**

### **Soal 1:**
* Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
* Gantilah warna tema aplikasi sesuai kesukaan Anda.

    ![alt text](image.png)

### **Soal 2:**
* Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

    ![alt text](image-1.png)

### **Soal 3:**
* Jelaskan fungsi keyword yield* pada kode tersebut!
    **Jawab:** 
    
    keyword yield* digunakan untuk menghasilkan (yield) seluruh elemen dari stream lain secara langsung. Dalam konteks ini: yield* Stream.periodic(...) berarti semua elemen yang dihasilkan oleh Stream.periodic akan diteruskan (forwarded) ke stream yang dihasilkan oleh fungsi getColors().

* Apa maksud isi perintah kode tersebut?
    **Jawab:**

    - Fungsi getColors() akan mengalirkan warna secara berulang setiap 1 detik.
    - Warna yang dihasilkan mengikuti urutan dari daftar colors.
    - Jika sudah mencapai warna terakhir, stream akan kembali ke awal daftar (karena menggunakan modulus %).


### **Soal 4:**
* Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

    ![alt text](gif/praktikum1.1.gif)

### **Soal 5:**
* Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

    **Jawab:**

    | **Fitur**                 | **`await for`**               | **`listen`**                  |
    |---------------------------|-------------------------------|-------------------------------|
    | **Fleksibilitas**         | Terbatas                      | Tinggi(Bisa Menghentikan)     |
    | **Sifat**                 | Sequential dan sederhana      | Memberikan kontrol penuh      |
    | **Penanganan Error**      | Tidak tersedia                | Dapat menggunakan "onError"   |
    | **Penanganan Selesai**    | Implicit (otomatis berhenti)  | Dapat menggunakan "onDone"    |

## **Praktikum 2 - Stream controllers dan sinks**

### **Soal 1:**
