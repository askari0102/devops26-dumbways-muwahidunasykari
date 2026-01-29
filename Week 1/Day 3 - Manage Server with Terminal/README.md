<h2>1. Akses server menggunakan terminal (Windows Terminal/PuTTY/etc)</h2>
1. Cek informasi konfigurasi IP di ubuntu server dengan menjalankan `ip a`
<img width="796" height="248" alt="image" src="https://github.com/user-attachments/assets/5e425425-bcc1-4527-bafc-60f34b07f736" />
2. Download open-ssh di ubuntu server dengan command `sudo apt install openssh-server`
<img width="795" height="600" alt="image" src="https://github.com/user-attachments/assets/bf8c4734-2552-41ed-9446-af112995a7ef" />

3. Jalankan command `sudo systemctl status ssh` untuk melihat status aplikasi yang sedang berjalan di server. Kalau status belum running, bisa jalankan "sudo systemctl start/restart ssh"
<img width="743" height="294" alt="image" src="https://github.com/user-attachments/assets/035922bf-316a-490b-81c4-dc3bd29f31d5" />

4. Di Windows terminal, jalankan `ssh username@IP_server`, ganti `username` dan `IP_server` dengan username/IP ubuntu server, ketik "yes" lalu enter ketika diminta verifikasi fingerprint dan masukkan password ubuntu server kita
<img width="965" height="160" alt="image" src="https://github.com/user-attachments/assets/710ece43-a265-4bc2-b5ef-f6ef96331d74" />
   Berhasil mengakses melalui windows terminal
<img width="1328" height="767" alt="image" src="https://github.com/user-attachments/assets/5dd56889-15ae-4d41-b838-a45f58a82723" />




<h2>2. Konfigurasi ssh kalian agar bisa di akses hanya menggunakan publickey (password opsional, bisa dimatikan)</h2>


<h2>3. Buat step by step penggunaan text manipulation (grep, sed, cat, echo)</h2>


<h2>4. Nyalakan ufw dengan memberikan akses untuk port 22, 80, 443, 3000, 5000, 6969!</h2>


<h3>Kendala</h3>
Failed to fetch saat mau install open-ssh server, disarankan untuk menjalankan apt-get update atau coba dengan --fix-missing.
Solved dengan menjalankan command `sudo apt-get update` terlebih dahulu
<img width="806" height="584" alt="image" src="https://github.com/user-attachments/assets/3443a7b8-d91e-43dc-b57b-3db2fd3486dc" />
