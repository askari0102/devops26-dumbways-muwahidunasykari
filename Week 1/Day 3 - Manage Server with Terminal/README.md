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

11. Hapus `#` dan ubah `yes` menjadi `no`, lalu klik Ctrl+X untuk save dan keluar.
<img width="805" height="93" alt="image" src="https://github.com/user-attachments/assets/f1beb5e2-9606-4b1f-a734-c99f8e8cb61e" />

12. Restart SSH dengan command `sudo systemctl restart ssh`
<img width="667" height="58" alt="image" src="https://github.com/user-attachments/assets/a5b66bc7-eb4c-4ee1-8aca-ef579750c2bb" />

13. Keluar dari server dengan klik Ctrl+D. Untuk men-cek apakah server sudah menolak login yang tanpa key, di sini saya coba pindahkan keynya terlebih dahulu ke folder lain
<img width="510" height="71" alt="image" src="https://github.com/user-attachments/assets/f2671fb1-7047-4d25-a502-e31d20527214" />
<img width="1678" height="118" alt="image" src="https://github.com/user-attachments/assets/fa5f86b9-2651-477e-845f-a847204ba6cc" />

14. Saat mencoba akses server dengan `ssh username@IP_server`, akses akan ditolak karena tidak memiliki key
<img width="692" height="53" alt="image" src="https://github.com/user-attachments/assets/c54c1712-a053-423c-8cde-3a5061050127" />


<h2>3. Buat step by step penggunaan text manipulation (grep, sed, cat, echo)</h2>

1. `cat` adalah command untuk melihat isi dari suatu file
   
   <img width="463" height="44" alt="image" src="https://github.com/user-attachments/assets/0b5f2543-82f6-4180-9b8d-f1be7d70e916" />

- `cat` bisa juga digunakan untuk membuat file baru atau menimpa file lama dengan cepat dengan menggunakan `>` lalu `namafile`. Jadi `cat > namafile`
  
   <img width="424" height="185" alt="image" src="https://github.com/user-attachments/assets/597f1f84-7df8-4fc5-afc1-e16d76202ec5" />

- `cat` juga dapat digunakan untuk menggabungkan isi dari 2 file menjadi 1 dengan command `cat namafile1 namafile2 > namafile3`
  
   <img width="537" height="215" alt="image" src="https://github.com/user-attachments/assets/69cdae29-cccd-45f6-8211-14a2cb1bfd7d" />

2. `sed` digunakan untuk mengubah atau memanipulasi teks di file langsung dengan command/perintah. Di sini saya mau mengganti "hello" yang ada di file1 dengan "hai". Jalankan command `sed -i 's/hello/hai/g' file1`. Terlihat "hello" sudah berubah menjadi "hai" tapi "Hello" tetap sama, itu karena `sed` case-sensitive, jadi Hello &ne; hello.

   <img width="653" height="152" alt="image" src="https://github.com/user-attachments/assets/5437e418-f9dd-4241-996f-88bee552f93c" />

4. `grep` adalah command untuk mencari teks/pola di suatu file. Bisa juga untuk mencari semua file yang mengandung suatu kata dengan `*`.
   
<img width="493" height="54" alt="image" src="https://github.com/user-attachments/assets/8abc0dbc-cc3a-48e9-892e-4be36a6e631f" />
<img width="503" height="92" alt="image" src="https://github.com/user-attachments/assets/fcdecaf4-dd66-4935-b561-40c02f54a1e7" />

- `grep` juga bisa digunakan untuk mencari berapa banyak line yang mengandung teks/pola yang dicari dengan menambah `-c`.
  
   <img width="462" height="45" alt="image" src="https://github.com/user-attachments/assets/a3ad3748-7adb-42a7-a464-bf59eceb4480" />
   <img width="455" height="164" alt="image" src="https://github.com/user-attachments/assets/c17e3869-ddcd-459a-8e4b-41fbe5ccfe8e" />

4. `echo` adalah command untuk memantulkan teks, atau menulisnya ke file baru/menimpa file dengan menambahkan `> namafile`
   
   <img width="669" height="118" alt="image" src="https://github.com/user-attachments/assets/754fd0ec-5943-49bc-ae2f-0c75a42e4b81" />

- Untuk menambahkan teks ke file bisa dengan menggunakan `>>`
  
   <img width="645" height="96" alt="image" src="https://github.com/user-attachments/assets/bf920933-9fd4-4e0c-bb54-1d8ad430f1bc" />

<h2>4. Nyalakan ufw dengan memberikan akses untuk port 22, 80, 443, 3000, 5000, 6969!</h2>

1. Aktifkan ufw dengan command `sudo ufw enable`
<img width="970" height="70" alt="image" src="https://github.com/user-attachments/assets/f7bc928f-e91c-4a93-8e2c-677f830ee3c1" />

2. Untuk memberikan akses, jalankan command `sudo ufw allow "Port"`, ganti "Port" dengan port yang mau kita beri akses. Untuk cek jalankan command `sudo ufw status`
<img width="632" height="419" alt="image" src="https://github.com/user-attachments/assets/a7440721-7efa-478d-b001-01bd7d81afd6" />

<img width="714" height="449" alt="image" src="https://github.com/user-attachments/assets/b4be0213-c821-4c93-975e-91029cd55bcb" />

3. Untuk menolak akses, tinggal ubah `allow` menjadi `deny`. Di sini saya coba tolak akses port 5432 jadi command yang dijalankan `sudo ufw deny 5432`
<img width="651" height="500" alt="image" src="https://github.com/user-attachments/assets/a25c21ad-b677-476f-aac0-a5ac8290fee7" />

<h2>Challenge: Jalankan tugas nomor 3 & 4 di day 3 dalam bentuk script BASH! Scriptnya bisa menyalakan/menambahkan, dan juga bisa mematikan/menghapus konfigurasinya (No. 1) </h2>

- Text Manipulation
   1. Pertama saya akan buat file .txt yang nantinya akan dimodifikasi menggunakan script, dengan command `echo` seperti berikut
     <img width="971" height="106" alt="image" src="https://github.com/user-attachments/assets/1b2c3c56-89d4-469f-936d-99b0a4a266a9" />
     
   2. Buat script dengan text editor _vim_ dengan command `vim namafile.sh`
      <img width="433" height="32" alt="image" src="https://github.com/user-attachments/assets/3dac6f9a-34eb-44a4-8057-d543f3efc474" />
      
   3. Klik I untuk ke mode insert/tulis, lalu ketik _shebang_ untuk bashnya dan sebagai berikut. Setelah selesai ketik Esc untuk keluar dari mode insert lalu ketik `:wq` untuk save dan keluar
      <img width="760" height="865" alt="image" src="https://github.com/user-attachments/assets/8f83c728-4c91-4741-b159-6b1ba412d0d3" />

   4. Jalankan script dengan `./namafile.sh`. Scriptnya akan menampilkan isi file .txt. saat ini dan akan meminta perintah. Setelah kita input scriptnya akan menampilkan hasil file yang sudah dimodifikasi

       <img width="577" height="449" alt="image" src="https://github.com/user-attachments/assets/81246aaf-1ba9-4534-bf7b-8ba52d2cf344" />
       <img width="526" height="429" alt="image" src="https://github.com/user-attachments/assets/42685052-bb4b-4e6d-9696-39316d3bfa68" />
       <img width="504" height="395" alt="image" src="https://github.com/user-attachments/assets/17c9dd3a-c446-493e-86af-f3c9457bb8d6" />

- Ufw
  1. Buat script dengan text editor _vim_ dengan command `vim namafile.sh`
     
      <img width="439" height="37" alt="image" src="https://github.com/user-attachments/assets/da7608e3-2008-4449-a800-92abdafa9c12" />
      
  2. Tulis script sebagai berikut. Lalu jalankan scriptnya
     <img width="779" height="531" alt="image" src="https://github.com/user-attachments/assets/9b848f1f-4e10-42f4-9e1a-c61e3d9f2652" />
     <img width="962" height="731" alt="image" src="https://github.com/user-attachments/assets/f5ad00a3-74fa-4997-ab88-f6051cdeb7ab" />

     


      

