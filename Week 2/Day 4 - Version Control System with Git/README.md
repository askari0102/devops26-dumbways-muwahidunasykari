<h2>1. Penjelasan tentang Git</h2>

Git adalah salah satu version control system yang digunakan untuk mengelola dan mencatat setiap perubahan pada file atau kode program yang terdistribusi _(Distributed Version Control System)_. Disebut terdistribusi karena setiap orang yang terlibat dalam proyek memiliki salinan database Git, sehingga pengelolaan proyek dapat dilakukan secara offline maupun online.

<h2>2. Buat sebuah repository bernama "devops26-dumbways-nama", lalu tambahkan 3 file yang berisi text</h2>

1. Pertama, jalankan command `git config --global user.name username` dan `git config --global user.email email` untuk mengatur identitas user Git di server. Pastikan username dan email sesuai dengan akun Github. Jalankan command `git config --list` untuk melihat confignya.
   <img width="945" height="119" alt="image" src="https://Github.com/user-attachments/assets/bde154c9-154e-4649-ba15-5a79dad4717c" />

2. Jalankan `ssh-keygen` untuk men-generate sepasang key ssh, lalu masuk ke direktori .ssh.
   <img width="871" height="583" alt="image" src="https://Github.com/user-attachments/assets/523a171c-aa91-4e17-8253-618cd9bc7ba4" />

3. Lihat public key yang sudah dibuat tadi dengan `cat`, lalu copy isinya.
   <img width="1458" height="124" alt="image" src="https://Github.com/user-attachments/assets/ada6b8a1-8fe8-48b4-81a0-3632e78cfb0a" />

4. Masuk ke akun Github lalu buka _settings_. Cari _SSH and GPG keys_, lalu klik _New SSH key_. Kasih Title dan paste public key yang sudah di copy tadi, lalu klik _Add SSH key_. Masukkan password jika diminta untuk konfirmasi.
   
   <img width="353" height="796" alt="image" src="https://Github.com/user-attachments/assets/8c8a4ec4-63e9-487f-9659-9e7724decc4e" />
---
   <img width="1907" height="893" alt="image" src="https://Github.com/user-attachments/assets/ae26ce39-53e8-4b59-99b2-46ab9df2c627" />
   
---
   <img width="1222" height="604" alt="image" src="https://Github.com/user-attachments/assets/19fdf005-6e8f-4057-bffe-f6c01d5de84a" />
   
---
   <img width="474" height="381" alt="image" src="https://Github.com/user-attachments/assets/7935dc3f-357f-450a-a94f-cbf59bbce038" />

5. Jalankan command `ssh git@github.com -T` untuk mengetest apakah key sudah terhubung ke Github. Jika ada keterangan "_You've successfully authenticated_" berarti sudah berhasil terhubung.
   <img width="1137" height="166" alt="image" src="https://Github.com/user-attachments/assets/a221af2a-e94a-4265-8a40-47f1baa4355e" />

6. Kembali ke home dengan `cd ..`, lalu buat direktori baru. Masuk ke direktori tersebut dan buat 3 file berisi text yang nantinya akan ditambahkan ke repository yang sudah dibuat.
   <img width="721" height="496" alt="image" src="https://Github.com/user-attachments/assets/ba66a30f-e61a-4dc5-9a88-95d586c1d016" />

7. Inisialisasi repository Git dengan `git init nama_repo` di direktori saat ini, kemudian copy 3 file tadi ke dalam direktori repository yang telah dibuat.
   <img width="1262" height="509" alt="image" src="https://Github.com/user-attachments/assets/a35daac4-e0d9-4c75-bc5a-f960524519bc" />
   <img width="867" height="55" alt="image" src="https://Github.com/user-attachments/assets/8dd07c07-6f37-4515-a1b2-28eed850ad09" />

8. Klik ikon + lalu pilih "_New Repository_" untuk membuat repository baru di GitHub.
   <img width="1893" height="83" alt="image" src="https://Github.com/user-attachments/assets/14172744-8db5-4610-9fed-758af1017255" />
   <img width="243" height="381" alt="image" src="https://Github.com/user-attachments/assets/bc64483e-1ca5-4aa9-bd67-4eda0dbceaa7" />

9. Masukkan nama repository di Github, sesuai dengan nama repository lokal yang sudah dibuat tadi, lalu klik _Create Repository_. Di sini karena saya sudah ada repository dengan nama yang sama, saya coba buat repository dengan nama lain terlebih dahulu
   <img width="939" height="798" alt="image" src="https://Github.com/user-attachments/assets/a9a77dbe-7965-49a3-85f8-fa4233799f50" />

10. Setelah repository dibuat, akan muncul halaman _Quick Setup_. Klik SSH, lalu pilih opsi kedua ("…or push an existing repository from the command line") dan copy commandnya. Di sini saya modifikasi commandnya agar sesuai dengan nama repository awal yang sudah dibuat. Jalankan command di terminal untuk menghubungkan repository lokal dengan repository remote di GitHub.
    <img width="1518" height="664" alt="image" src="https://Github.com/user-attachments/assets/e808807e-dbdb-4db9-81ae-2b369b390e36" />

11. Jalankan commandnya di terminal. Untuk command `git branch -M main` dan `git push -u origin main` ubah `main` menjadi `master` untuk tetap berada di branch `master`.
   <img width="1469" height="566" alt="image" src="https://Github.com/user-attachments/assets/33bf7345-5b7c-4a13-8796-2fe57c1bf120" />

<h2>3. Manage repository tugas kalian menggunakan terminal!</h2>

1. Buat sebuah file dengan nama `.gitignore` untuk menyimpan daftar file atau direktori yang ingin diabaikan oleh Git. Isi file `.gitignore` dengan nama file/direktori yang ingin di-ignore, misalnya `file4` . Jalankan `git status` untuk melihat status saat ini, `file4` tidak muncul karena sudah dimasukkan ke `.gitignore`.
   <img width="1006" height="22" alt="image" src="https://Github.com/user-attachments/assets/0b483071-ffd4-4feb-867e-7e6ba19e2483" />

   <img width="320" height="63" alt="image" src="https://Github.com/user-attachments/assets/b159a2d1-bce6-44d5-af1b-bd7fccfb26c7" />
   <img width="1021" height="378" alt="image" src="https://Github.com/user-attachments/assets/1f2e0901-8ec1-42d8-88bc-647aaa4a4549" />

2. Jalankan `git status` lagi untuk melihat status file-file saat ini, terlihat masih "_Untracked_". Jalankan `git add namafile` untuk menandai file di staging. Bisa juga menggunakan `git add .` untuk menandai semua file yang ada di repository sekaligus.
   <img width="952" height="600" alt="image" src="https://Github.com/user-attachments/assets/b51775dc-4e17-4e80-b6d7-65d19125a33f" />

3. Lakukan commit pada file yang sudah di-staging menggunakan `git commit -m "Komentar"` untuk menyimpan perubahan ke repository beserta keterangan perubahan.
   <img width="1197" height="237" alt="image" src="https://Github.com/user-attachments/assets/3b7f8a76-0515-4079-8697-6a99b8f21480" />

4. Jika kita melakukan perubahan pada salah satu file yang sudah di-commit tadi, akan terlihat statusnya menjadi _modified_. Untuk menyimpan perubahan, gunakan `git add namafile` lalu lakukan commit dengan Git commit -m "pesan commit". Jika perubahan tidak ingin disimpan, jalankan `git restore namafile` untuk mengembalikan file seperti sebelumnya.
   <img width="916" height="34" alt="image" src="https://Github.com/user-attachments/assets/dd25f00f-c4b4-43a3-a2f1-94d14940b38b" />
   <img width="467" height="80" alt="image" src="https://Github.com/user-attachments/assets/dea45de7-e0f9-4673-990e-c3af5bc93896" />
   <img width="898" height="195" alt="image" src="https://Github.com/user-attachments/assets/7edb7cb6-2b35-4674-9c2c-70720e552d9a" />
   <img width="1132" height="310" alt="image" src="https://Github.com/user-attachments/assets/154b788e-3fb5-4ad6-a209-72af7cf65acf" />

5. Jalankan command `git push origin master` untuk push hasil commit ke Github.
   <img width="1112" height="35" alt="image" src="https://Github.com/user-attachments/assets/1fb92f8f-6540-4e01-909b-6fc1f424c8b3" />

<h2>4. Demokan cara untuk mencari perubahan text pada suatu file di GitHub!</h2>

1. Masuk ke Github dan buka repository yang sudah dibua. 
   
   <img width="330" height="305" alt="image" src="https://github.com/user-attachments/assets/a8cc0149-cdc0-4af9-884a-0efbafc445af" />
   
2. Perhatikan daftar file, jika file yang tadi dipush belum terlihat, periksa branch saat ini. Klik dropdown branch dan ganti dari main ke master.
   <img width="938" height="383" alt="image" src="https://github.com/user-attachments/assets/c8253480-92a5-4808-aa01-aaa549c0ad35" />
   <img width="324" height="296" alt="image" src="https://github.com/user-attachments/assets/555b9fd6-c4ef-4eaa-a231-ae27b918fa7b" />
   <img width="928" height="430" alt="image" src="https://github.com/user-attachments/assets/e888c3ee-4c41-4e9b-ad9d-fb2bb0a44b8c" />

3. Klik "2 commits" di pojok kanan atas untuk melihat daftar commit yang sudah dibuat.
   <img width="904" height="60" alt="image" src="https://github.com/user-attachments/assets/d5507065-26c5-4d35-9dff-73b7200e43d3" />
   <img width="1361" height="306" alt="image" src="https://github.com/user-attachments/assets/41d818c4-bb0c-45bd-b11d-2354983bedb2" />

4. Untuk melihat perubahan yang dilakukan di setiap commit, cukup klik commit yang diinginkan.
   <img width="1887" height="558" alt="image" src="https://github.com/user-attachments/assets/b54f5f35-e69d-480b-9cd4-f311f1902dd4" />
   <img width="1871" height="254" alt="image" src="https://github.com/user-attachments/assets/4eeb9106-a455-4deb-9dd7-f9217774447f" />

