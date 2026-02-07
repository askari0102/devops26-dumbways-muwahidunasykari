Pastikan Firewall menyala terlebih dahulu dengan command `sudo ufw enable`. Untuk cek status jalankan `sudo ufw status`
<img width="983" height="565" alt="image" src="https://github.com/user-attachments/assets/cbd2459c-194a-4460-aa99-94f220ad0f96" />

<h2>NodeJS (Deploy app wayshub-frontend, Berjalan di port 3000, Menggunakan NodeJS 10 & 12)</h2>

1. Kunjungi halaman download [Node.js](https://nodejs.org/en/download), pilih versi Node.js, OS Linux, dan metode instalasi NVM dan pilih npm, lalu salin command yang disediakan.
   <img width="1086" height="653" alt="image" src="https://github.com/user-attachments/assets/0b6b02d0-b75f-44b2-a809-51bafad0fada" />

2. Jalankan commandnya di terminal. Refresh bash dengan command `exec bash` atau jalankan command `\. "$HOME/.nvm/nvm.sh"` seperti yang tertera di website. Install Node.js dengan command `nvm install 10`, lalu verifikasi versinya dengan `node -v`, cek versi npm dengan command `npm -v`.
   <img width="1474" height="870" alt="image" src="https://github.com/user-attachments/assets/cfe26792-ed43-4caf-8ae8-2ca79408e861" />

3. Install Node.js versi 12 dengan command `nvm install 12`. Untuk berpindah versi Node.js pakai command `nvm use 10` untuk menggunakan versi 10 atau `nvm use 12` untuk menggunakan versi 12.
   <img width="1165" height="172" alt="image" src="https://github.com/user-attachments/assets/8fb4c90a-c715-407d-9abf-a9c7a9a43812" />
   <img width="519" height="219" alt="image" src="https://github.com/user-attachments/assets/d9189cd1-5063-4d89-8ebc-c5b2352ebf62" />

4. Clone app wayshub-frontend dengan command `git clone https://github.com/dumbwaysdev/wayshub-frontend.git` lalu masuk ke direktorinya
   <img width="1405" height="287" alt="image" src="https://github.com/user-attachments/assets/3948c03a-1061-41da-a5a2-1ffa13477d01" />

5. Install dependency dengan `npm install`, akan muncul banyak warning terkait vulnerabilities tapi untuk kali ini abaikan saja.
   <img width="1457" height="34" alt="image" src="https://github.com/user-attachments/assets/b34fa1e0-c08c-4cab-8fb5-3ca2e601c97a" />
   <img width="1472" height="538" alt="image" src="https://github.com/user-attachments/assets/6a82fafd-39cf-4b1a-98b9-e0c37cfb5953" />

6. App secara default akan berjalan di port 3000 jadi langsung jalankan `npm start`, cek di browser dengan `IP_Server:3000`. Kalau app sudah jalan tapi tidak bisa akses di browser, bisa jalankan `sudo ufw allow 3000` untuk kasih akses ke port 3000 terlebih dahulu.
   <img width="677" height="36" alt="image" src="https://github.com/user-attachments/assets/ff420a5c-be6a-400d-86ea-e947509dfe9f" />
   <img width="1907" height="1023" alt="image" src="https://github.com/user-attachments/assets/9489dc8a-7b37-4899-bab1-9d09facb0501" />

<h2>Python (Deploy app menampilkan text nama kalian!, Berjalan di port 5000 & bisa dibuka melalui web)</h2>

1. Install Python dengan `sudo apt install python3`, kalau sudah ada langsung install pip dengan `sudo apt install python3-pip`
   <img width="903" height="282" alt="image" src="https://github.com/user-attachments/assets/228b3c00-02b4-4ae2-8b86-fe22fa96d124" />

2. Buat direktori `python` lalu masuk ke direktori tersebut
   
   <img width="506" height="77" alt="image" src="https://github.com/user-attachments/assets/04aca768-ee8e-469a-8bb8-b005f6584932" />

3. Install flask dengan command `pip install flask`
   <img width="1474" height="576" alt="image" src="https://github.com/user-attachments/assets/726726c8-f86b-413b-ac38-3510309c7d18" />

4. Buat file baru `index.py` dengan text editor. Lalu isi filenya dengan seperti berikut
   <img width="524" height="37" alt="image" src="https://github.com/user-attachments/assets/d209d460-bee2-4efa-8d8e-28be6d5c7bc4" />
   <img width="497" height="257" alt="image" src="https://github.com/user-attachments/assets/905ed796-f742-4770-9c31-5c7e44058cb8" />

5. Jalankan aplikasi dengan command `python3 nama_aplikasi.py`
   <img width="1466" height="197" alt="image" src="https://github.com/user-attachments/assets/106ece28-cb01-4d84-b7b3-ad827a32b19f" />

6. Akses aplikasi dengan di browser dengan `IP_Server:5000` atau seperti yang tertampil di terminal di step sebelumnya. Kalau tidak bisa buka di browser kasih akses ke port 5000 terlebih dahulu.
   <img width="1318" height="179" alt="image" src="https://github.com/user-attachments/assets/23f57719-2caa-4115-b725-d4dd71a99e22" />

<h2>Golang (Deploy app menampilkan text "Golang geming!")</h2>

1. Buka halaman download Golang di https://go.dev/dl/. Cari versi yang diinginkan, lalu copy linknya.
   <img width="1805" height="856" alt="image" src="https://github.com/user-attachments/assets/8fbfef75-4fc5-4069-a602-4b8754287b03" />

2. Di terminal gunakan command `wget` diikuti link yang sudah dicopy untuk mendownload file Go.
   <img width="1478" height="382" alt="image" src="https://github.com/user-attachments/assets/d3b4926f-1d39-4016-82ba-f40145b0cbcf" />

3. Buka halaman dokumentasi instalasi Golang di https://go.dev/doc/install, pilih OS Linux, lalu salin commandnya.
   <img width="1571" height="1013" alt="image" src="https://github.com/user-attachments/assets/70017b56-fca5-4ae5-9477-a0350a2af66e" />

4. Jalankan command yang sudah di copy dari halaman dokumentasi. untuk command pertama jalankan sebagai root dengan menjalankan `sudo su` terlebih dahulu, setelah selesai keluar dari root shell dengan Ctrl+D.
   <img width="1331" height="213" alt="image" src="https://github.com/user-attachments/assets/d05a3c35-d9c9-429c-8811-b59468968beb" />

5. Buat direktori baru lalu masuk ke direktori tersebut. Buat file dengan nama index.go
   <img width="508" height="82" alt="image" src="https://github.com/user-attachments/assets/06fcdb01-2a31-4f7f-abe3-c019fb2dedff" />

6. Isi file seperti berikut lalu save. Jalankan aplikasi dengan command `go run index.go`
   <img width="479" height="262" alt="image" src="https://github.com/user-attachments/assets/a66c1c71-03c1-4a01-ac85-36034cf86531" />
   <img width="547" height="47" alt="image" src="https://github.com/user-attachments/assets/1bec9994-7182-4973-8244-d4e7001f7b37" />

   
<h2>Challenge</h2>

- **Aplikasi Node.js dan Python berjalan di background**
1. Jalankan aplikasi dengan menambahkan `&` di akhir. Jadi di sini saya jalankan `npm start &` dan `python3 index.py &`. Output aplikasi tetap akan muncul di terminal, tapi terminal tetap bisa digunakan untuk perintah lain, dan proses akan terus berjalan selama terminal tetap terbuka
   
   <img width="635" height="66" alt="image" src="https://github.com/user-attachments/assets/b4669a1c-9aec-4e81-b225-48d4345c315f" />
   <img width="1479" height="260" alt="image" src="https://github.com/user-attachments/assets/17a9a905-edcd-4744-98a1-559b24f19395" />

3. Cek aplikasi yang sedang berjalan menggunakan command `jobs`. Jalankan aplikasi di browser, keduanya bisa terbuka.
   <img width="880" height="70" alt="image" src="https://github.com/user-attachments/assets/2ce046c9-13d1-40e8-a25b-b27e8a7e093d" />
   <img width="1919" height="1019" alt="image" src="https://github.com/user-attachments/assets/15ea5bde-aea0-4fec-8dce-ee58e362660a" />

4. Untuk menghentikan aplikasi yang sedang berjalan, cek lagi dengan `jobs`. Dari daftar aplikasi yang sedang running tersebut, perhatikan nomor job yang ingin dihentikan. Kemudian hentikan aplikasi menggunakan command `kill %<nomor_job>`
   <img width="863" height="268" alt="image" src="https://github.com/user-attachments/assets/8c062e60-e28a-403e-a634-5066d361b63d" />

- **Golang bisa dibuka di browser kalian, menampilkan text "Jangan lupa sahur baby gurl rawr"**

1. Buat file baru di direktori `golang`, lalu isi filenya seperti berikut
   <img width="544" height="53" alt="image" src="https://github.com/user-attachments/assets/91e8addd-886f-4384-9121-abca60ee5b4e" />
   <img width="902" height="393" alt="image" src="https://github.com/user-attachments/assets/5d1155d2-4505-4f16-80eb-978ac81f9b8e" />

2. Kasih akses ke port 4000, jalankan aplikasi, lalu cek dengan browser.
   <img width="561" height="92" alt="image" src="https://github.com/user-attachments/assets/3f583b65-7145-4247-a04f-3e408b452b60" />
   <img width="559" height="35" alt="image" src="https://github.com/user-attachments/assets/b79e1d06-0808-42ad-be88-34ecf63896cf" />
   <img width="1055" height="420" alt="image" src="https://github.com/user-attachments/assets/6e562984-ddb6-482e-9987-b1e925035747" />

