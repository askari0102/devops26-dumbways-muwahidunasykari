<h2>NodeJS (Deploy app wayshub-frontend, Berjalan di port 3000, Menggunakan NodeJS 10 & 12)</h2>

1. Install web server nginx dengan `sudo apt install nginx`
   <img width="827" height="166" alt="image" src="https://github.com/user-attachments/assets/5b05b71c-94ef-454e-b6ac-717eb0bdff64" />

2. Kunjungi halaman download [Node.js](https://nodejs.org/en/download), pilih versi Node.js, OS Linux, dan metode instalasi NVM dan pilih npm, lalu salin command yang disediakan.
   <img width="1086" height="653" alt="image" src="https://github.com/user-attachments/assets/0b6b02d0-b75f-44b2-a809-51bafad0fada" />

3. Jalankan commandnya di terminal. Refresh bash dengan command `exec bash` atau jalankan command `\. "$HOME/.nvm/nvm.sh"` seperti yang tertera di website. Install Node.js dengan command `nvm install 10`, lalu verifikasi versinya dengan `node -v`, cek versi npm dengan command `npm -v`.
   <img width="1474" height="870" alt="image" src="https://github.com/user-attachments/assets/cfe26792-ed43-4caf-8ae8-2ca79408e861" />

4. Install Node.js versi 12 dengan command `nvm install 12`. Untuk berpindah versi Node.js pakai command `nvm use 10` untuk menggunakan versi 10 atau `nvm use 12` untuk menggunakan versi 12.
   <img width="1165" height="172" alt="image" src="https://github.com/user-attachments/assets/8fb4c90a-c715-407d-9abf-a9c7a9a43812" />
   <img width="519" height="219" alt="image" src="https://github.com/user-attachments/assets/d9189cd1-5063-4d89-8ebc-c5b2352ebf62" />

5. Clone app wayshub-frontend dengan command `git clone https://github.com/dumbwaysdev/wayshub-frontend.git` lalu masuk ke direktorinya
   <img width="1405" height="287" alt="image" src="https://github.com/user-attachments/assets/3948c03a-1061-41da-a5a2-1ffa13477d01" />

6. Install dependency dengan `npm install`, akan muncul error dia menemukan banyak vulnerabilities tapi untuk kali ini hiraukan saja.
   <img width="1457" height="34" alt="image" src="https://github.com/user-attachments/assets/b34fa1e0-c08c-4cab-8fb5-3ca2e601c97a" />
   <img width="1472" height="538" alt="image" src="https://github.com/user-attachments/assets/6a82fafd-39cf-4b1a-98b9-e0c37cfb5953" />

7. Jalankan app dengan `npm start`, cek di browser dengan `IP_Server:3000`. Kalau app sudah jalan tapi tidak bisa akses di browser, bisa jalankan `sudo ufw allow 3000` untuk kasih akses ke port 3000 terlebih dahulu.
   <img width="677" height="36" alt="image" src="https://github.com/user-attachments/assets/ff420a5c-be6a-400d-86ea-e947509dfe9f" />
   <img width="1907" height="1023" alt="image" src="https://github.com/user-attachments/assets/9489dc8a-7b37-4899-bab1-9d09facb0501" />



<h2>Python (Deploy app menampilkan text nama kalian!, Berjalan di port 5000 & bisa dibuka melalui web)</h2>


<h2>Golang (Deploy app menampilkan text "Golang geming!")</h2>
