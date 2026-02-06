<h2>1. Gambarkan sturktur web server menggunakan reverse proxy dan jelaskan cara kerjanya!</h2>

<img width="767" height="555" alt="image" src="https://github.com/user-attachments/assets/372927c2-c5c7-4f2a-afd8-da60558fa24f" />

1. Client mengirim request berupa HTTP/HTTPS ke server.
2. Nginx menerima request dan cek aturan routing dan load balancing.
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


<h2>Challenge</h2>

1. Load Balancing menggunakan Round Robin
   

