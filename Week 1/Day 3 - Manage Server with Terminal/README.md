<h2>1. Akses server menggunakan terminal (Windows Terminal/PuTTY/etc)</h2>

1. Cek informasi konfigurasi IP di ubuntu server dengan menjalankan `ip a`
<img width="796" height="248" alt="image" src="https://github.com/user-attachments/assets/5e425425-bcc1-4527-bafc-60f34b07f736" />

2. Download open-ssh di ubuntu server dengan command `sudo apt install openssh-server`
<img width="795" height="600" alt="image" src="https://github.com/user-attachments/assets/bf8c4734-2552-41ed-9446-af112995a7ef" />

3. Jalankan command `sudo systemctl status ssh` untuk melihat status aplikasi yang sedang berjalan di server. Kalau status belum running, bisa jalankan `sudo systemctl start ssh` atau `sudo systemctl restart ssh`
<img width="743" height="294" alt="image" src="https://github.com/user-attachments/assets/035922bf-316a-490b-81c4-dc3bd29f31d5" />

4. Di Windows terminal, jalankan `ssh username@IP_server`, ganti `username` dan `IP_server` dengan username/IP ubuntu server, ketika diminta verifikasi fingerprint ketik "yes" lalu enter dan masukkan password ubuntu server kita
<img width="965" height="160" alt="image" src="https://github.com/user-attachments/assets/710ece43-a265-4bc2-b5ef-f6ef96331d74" />

5. Berhasil mengakses server melalui windows terminal
<img width="1328" height="767" alt="image" src="https://github.com/user-attachments/assets/5dd56889-15ae-4d41-b838-a45f58a82723" />

<h2>2. Konfigurasi ssh kalian agar bisa di akses hanya menggunakan publickey (password opsional, bisa dimatikan)</h2>

1. Jalankan command `ssh-keygen` untuk men-generate pasangan kunci dan gembok yang akan bisa dipasang di server tujuan. Di sini saya akan biarkan file disave di folder default dengan nama file default juga. passphrase/password bisa kosongkan saja dan langsung klik enter
<img width="941" height="520" alt="image" src="https://github.com/user-attachments/assets/1dbb6773-e00a-4d4e-9f51-9f255a55457d" />

2. Navigasi ke folder .ssh seperti yang tertera di step 1 dan cari nama file kunci yang sudah di-generate tadi, lalu buka file dengan format .pub dengan notepad. Copy kunci publiknya.
<img width="784" height="114" alt="image" src="https://github.com/user-attachments/assets/6bfd3e21-8f24-4a14-9da4-884c23ba3c3f" />
<img width="698" height="213" alt="image" src="https://github.com/user-attachments/assets/76385661-1004-47f3-ac96-3a860c8e517e" />

3. Akses server melalui terminal, lalu jalankan `cd .ssh` untuk masuk ke direktori .ssh dan jalankan command `ls` untuk melihat isinya
<img width="701" height="30" alt="image" src="https://github.com/user-attachments/assets/c49994d0-c4ae-4b10-af2f-1bf3724a26ac" />
<img width="411" height="98" alt="image" src="https://github.com/user-attachments/assets/2f95b9f5-4a12-412e-87aa-9858ab4cc52c" />

4. Masuk ke authorized_keys dengan command `nano authorized_keys`
<img width="594" height="35" alt="image" src="https://github.com/user-attachments/assets/5a1f3299-5563-42c0-8b15-de429a3541ef" />
<img width="1474" height="208" alt="image" src="https://github.com/user-attachments/assets/2aa7d031-4c3a-4f51-b8b5-fded1fe4f075" />

5. Paste public key yang sudah di copy tadi, lalu save dan keluar dengan klik Ctrl+O dan Ctrl+X 
<img width="1479" height="147" alt="image" src="https://github.com/user-attachments/assets/04c9cebe-59d1-43f3-991b-c1d8adbbdb28" />

6. Logout dengan Ctrl+D
<img width="655" height="102" alt="image" src="https://github.com/user-attachments/assets/4d82306f-7f37-431a-b037-ea0640964bee" />

7. Login lagi ke server dengan menggunakan key dengan command `ssh -i .ssh/nama_kunci username@IP_server`
<img width="832" height="35" alt="image" src="https://github.com/user-attachments/assets/f5c90222-54d3-4139-83c0-bfd86d643f9f" />

8. Berhasil akses server dengan key tanpa perlu menggunakan password
<img width="971" height="690" alt="image" src="https://github.com/user-attachments/assets/f55ae6ef-397e-432e-bcb1-394425fe1b5d" />

9. Untuk setting agar server hanya menerima key dan bukan password, jalankan command `cd /etc/ssh` untuk masuk ke direktori ssh, dan command `ls` untuk lihat isi direktori, terlihat ada file dengan nama "sshd_config"
<img width="1435" height="145" alt="image" src="https://github.com/user-attachments/assets/12cdcf58-5543-43ea-97d1-f01fef4348e9" />

10. Jalankan command `sudo nano sshd_config` untuk meng-edit file "sshd_config" tersebut, lalu klik Ctrl+W dan ketik "PasswordAuthentication"
<img width="1477" height="706" alt="image" src="https://github.com/user-attachments/assets/5a3d40d5-e35c-41bd-9482-0d4d92e92993" />

11. Hapus `#` dan ubah `yes` menjadi `no`, lalu klik Ctrl+O untuk save dan Ctrl+X untuk keluar
<img width="805" height="93" alt="image" src="https://github.com/user-attachments/assets/f1beb5e2-9606-4b1f-a734-c99f8e8cb61e" />

12. Restart SSH dengan command `sudo systemctl restart ssh`
<img width="667" height="58" alt="image" src="https://github.com/user-attachments/assets/a5b66bc7-eb4c-4ee1-8aca-ef579750c2bb" />

13. Keluar dari server dengan klik Ctrl+D. Untuk men-cek apakah server sudah menolak login yang bukan dengan tanpa key, di sini saya coba pindahkan keynya terlebih dahulu ke folder lain
<img width="510" height="71" alt="image" src="https://github.com/user-attachments/assets/f2671fb1-7047-4d25-a502-e31d20527214" />
<img width="1678" height="118" alt="image" src="https://github.com/user-attachments/assets/fa5f86b9-2651-477e-845f-a847204ba6cc" />

14. Saat mencoba akses server dengan `ssh username@IP_server`, akses akan ditolak karena tidak memiliki key
<img width="692" height="53" alt="image" src="https://github.com/user-attachments/assets/c54c1712-a053-423c-8cde-3a5061050127" />


<h2>3. Buat step by step penggunaan text manipulation (grep, sed, cat, echo)</h2>

1. 

<h2>4. Nyalakan ufw dengan memberikan akses untuk port 22, 80, 443, 3000, 5000, 6969!</h2>


<h3>Kendala</h3>
Failed to fetch saat mau install open-ssh server, disarankan untuk menjalankan apt-get update atau coba dengan --fix-missing.
Solved dengan menjalankan command `sudo apt-get update` terlebih dahulu
<img width="806" height="584" alt="image" src="https://github.com/user-attachments/assets/3443a7b8-d91e-43dc-b57b-3db2fd3486dc" />
