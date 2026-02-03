<h2>1. Penjelasan tentang git</h2>
Git adalah salah satu version control system yang digunakan untuk mengelola dan mencatat setiap perubahan pada file atau kode program yang terdistribusi (Distributed Version Control System). Disebut terdistribusi karena setiap orang yang terlibat dalam proyek memiliki salinan database git, sehingga pengelolaan proyek dapat dilakukan secara offline maupun online.

<h2>2. Buat sebuah repository bernama "devops26-dumbways-nama", lalu tambahkan 3 file yang berisi text</h2>

1. Pertama jalankan command `git config --global user.name username` dan `git config --global user.email email` untuk menghubungkan github dengan git server, samakan username dan email dengan yang sedang digunakan di github. Jalankan command `git config --list` untuk melihat confignya.
   <img width="945" height="119" alt="image" src="https://github.com/user-attachments/assets/bde154c9-154e-4649-ba15-5a79dad4717c" />

2. Jalankan `ssh-keygen` untuk men-generate key, lalu masuk ke direktori .ssh.
   <img width="871" height="583" alt="image" src="https://github.com/user-attachments/assets/523a171c-aa91-4e17-8253-618cd9bc7ba4" />

3. Lihat public key yang sudah dibuat tadi dengan `cat`, lalu copy isinya.
   <img width="1458" height="124" alt="image" src="https://github.com/user-attachments/assets/ada6b8a1-8fe8-48b4-81a0-3632e78cfb0a" />

4. Masuk ke akun github lalu buka _settings_. Cari _SSH and GPG keys_, lalu klik _New SSH key_. Kasih Title dan paste public key yang sudah di copy tadi, lalu klik _Add SSH key_. Akan diminta konfirmasi akses, masukkan password github lalu klik _confirm_.
   
   <img width="353" height="796" alt="image" src="https://github.com/user-attachments/assets/8c8a4ec4-63e9-487f-9659-9e7724decc4e" />
---
   <img width="1907" height="893" alt="image" src="https://github.com/user-attachments/assets/ae26ce39-53e8-4b59-99b2-46ab9df2c627" />
   
---
   <img width="1222" height="604" alt="image" src="https://github.com/user-attachments/assets/19fdf005-6e8f-4057-bffe-f6c01d5de84a" />
   
---
   <img width="474" height="381" alt="image" src="https://github.com/user-attachments/assets/7935dc3f-357f-450a-a94f-cbf59bbce038" />

5. Jalankan command `ssh git@github.com -T` untuk mengetest apakah key sudah terhubung ke github. Jika ada keterangan "_You've successfully authenticated_" berarti sudah berhasil terhubung.
   <img width="1137" height="166" alt="image" src="https://github.com/user-attachments/assets/a221af2a-e94a-4265-8a40-47f1baa4355e" />

6. Balik ke home dengan `cd ..`, lalu buat direktori baru. Masuk ke direktori tersebut dan buat 3 file berisi text yang nantinya akan ditambahkan ke repositori yang sudah dibuat.
   <img width="721" height="496" alt="image" src="https://github.com/user-attachments/assets/ba66a30f-e61a-4dc5-9a88-95d586c1d016" />







   
