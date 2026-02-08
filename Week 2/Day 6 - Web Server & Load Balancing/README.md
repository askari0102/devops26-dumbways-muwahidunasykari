<h2>1. Gambarkan sturktur web server menggunakan reverse proxy dan jelaskan cara kerjanya!</h2>

<img width="767" height="555" alt="image" src="https://github.com/user-attachments/assets/372927c2-c5c7-4f2a-afd8-da60558fa24f" />

1. Client mengirim request berupa HTTP/HTTPS ke server.
2. Nginx menerima request dan cek aturan routing/load balancing.
3. Nginx meneruskan request ke backend server yang sesuai.
4. Backend memproses request.
5. Backend mengirim response ke Nginx.
6. Nginx meneruskan response ke client.

<h2>2. Buatlah Reverse Proxy untuk aplikasi yang sudah kalian deploy kemarin. (wayshub), untuk domain nya sesuaikan nama masing"</h2>

1. Jalankan app `wayshub-frontend`nya terlebih dahulu, lalu buka tab baru di terminal untuk konfigurasi reverse proxy.
   <img width="545" height="33" alt="image" src="https://github.com/user-attachments/assets/9147399a-a56d-4f86-81a5-00d25a109314" />
   <img width="1467" height="267" alt="image" src="https://github.com/user-attachments/assets/720b0a04-79a2-40fd-86ce-66f96908b601" />

2. Buka file hosts yang terletak di `/Windows/System32/drivers/etc` dengan notepad sebagai admin. Tambah line `IP_server domain`, lalu simpan.
   <img width="963" height="627" alt="image" src="https://github.com/user-attachments/assets/84726305-4df7-496e-bd60-124831c008cd" />

3. Jalankan `sudo apt update` untuk memastikan repo archive ubuntu sudah yang terupdate.
   <img width="894" height="95" alt="image" src="https://github.com/user-attachments/assets/207606e9-95cd-4bfb-991a-d5eb2d55691a" />

4. Install nginx dengan `sudo apt install nginx`
   <img width="767" height="136" alt="image" src="https://github.com/user-attachments/assets/bb49d60e-8fc4-46e6-afe9-2c7b39b5268c" />

5. Cek status nginx dengan `sudo systemctl status nginx`, pastikan sudah running.
   <img width="1203" height="95" alt="image" src="https://github.com/user-attachments/assets/9d4aff83-f6a0-4840-a559-0bdbfa7e6702" />

6. Cek firewall dengan `sudo ufw status` dan pastikan port 80 (HTTP) sudah diberi akses. Kalau belum ada bisa jalankan command `sudo ufw allow 80`
   
   <img width="609" height="185" alt="image" src="https://github.com/user-attachments/assets/9bfb5452-4231-4969-848c-c33bad589bfd" />

7. Masuk ke direktori nginx dengan `cd /etc/nginx` lalu masuk ke direktori `sites-enabled`.
   <img width="1475" height="158" alt="image" src="https://github.com/user-attachments/assets/777eab64-0937-4d97-9c84-ee4b7d1cc66b" />

8. Buat file baru untuk set konfigurasinya, lalu isi seperti berikut.
   <img width="788" height="26" alt="image" src="https://github.com/user-attachments/assets/ec93eb14-4716-449d-9f7e-e45b6e9ed1d1" />
   <img width="652" height="208" alt="image" src="https://github.com/user-attachments/assets/802d879e-d1f3-42ca-8a4c-91e0f0a34838" />

10. Cek apakah konfigurasi sudah benar dengan `sudo nginx -t`
    <img width="809" height="70" alt="image" src="https://github.com/user-attachments/assets/6c9d59f3-75b0-4efd-9bd2-f7ad2eed47b3" />

11. Reload nginx dengan `sudo systemctl reload nginx`
    <img width="1227" height="139" alt="image" src="https://github.com/user-attachments/assets/ed066e91-acd1-4f06-856c-7fa2f11d3cdd" />

12. Server sudah bisa dibuka di browser dengan domain
    <img width="1917" height="1022" alt="image" src="https://github.com/user-attachments/assets/aa3aec2f-d62e-4263-a783-5b72c6641dca" />


<h2>Challenge: Terapkan Load Balancing untuk wayshub-frontend menggunakan 2 server dengan spek yang sama. Gunakan 2 dari 3 pilihan method (Round Robin, IP Hash, Least Connections)</h2>

1. Siapkan 1 VM lagi dengan spek yang sama, di sini saya beri IP `192.168.0.209` dan setup semua yang dibutuhkan.
   
   | VM   | IP Address       | Role                          |
   |----- |------------------|-------------------------------|
   | VM 1 | 192.168.0.208    | Load Balancer + Backend 1     |
   | VM 2 | 192.168.0.209    | Backend 2                     |

2. Jalankan aplikasi di kedua VM
   <img width="1457" height="363" alt="image" src="https://github.com/user-attachments/assets/7eebfc4f-c618-4be2-abd0-230af79e77ea" />
   <img width="1472" height="364" alt="image" src="https://github.com/user-attachments/assets/6a86a707-a1fb-4d6a-b569-a107580a7090" />

3. Edit konfigurasi nginx sebelumnya yang sudah ada dan isi seperti berikut
   - **Round Robin**
   <img width="940" height="527" alt="image" src="https://github.com/user-attachments/assets/b1aaa2c5-5638-436e-bc80-7e24220813f6" />
   
   - Untuk **Least Connection** tinggal tambahkan line `least_conn;` di `upstream`
   <img width="928" height="172" alt="image" src="https://github.com/user-attachments/assets/373998e0-55e9-442f-9375-c272081b3e75" />


5. Cek konfigurasi nginx apakah sudah benar dengan `sudo nginx -t` lalu reload dengan `sudo systemctl reload nginx`
   <img width="891" height="89" alt="image" src="https://github.com/user-attachments/assets/c91ac8d4-d910-4584-a736-5ec0c00dd992" />

6. Buka domain di browser, untuk cek sedang akses server yang mana bisa klik `F12` lalu pilih tab network dan refresh pagenya.
   <img width="1918" height="901" alt="image" src="https://github.com/user-attachments/assets/686180d4-661e-4198-b3e5-e3238c8f3e86" />
   <img width="1914" height="893" alt="image" src="https://github.com/user-attachments/assets/5dfdc297-35e2-4e58-9d0e-9cb6edef3f18" />







