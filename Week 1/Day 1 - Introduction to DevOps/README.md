<h2>1. Definisi DevOps</h2>

   DevOps adalah penghubung antara tim development dan tim operasi yang bertugas untuk mempercepat dan meningkatkan efisiensi proses development hingga rilis produk ke publik memastikan aplikasi atau program sudah sesuai kebutuhan dan sesuai standar untuk dirilis.

<h2>2. Step-by-step install Ubuntu Server 22.04.5 LTS dengan VirtualBox</h2>

- Download software virtualization dan .iso ubuntu yang akan digunakan, di sini saya akan menggunakan [VirtualBox](https://www.virtualbox.org/wiki/Downloads) versi 7.2.4 yang terbaru dan [Ubuntu Server versi 22.04.5 LTS](https://ubuntu.com/download/server)
   Karena saya menggunakan OS Windows 11, saya download package VirtualBox untuk windows
   <img width="1709" height="739" alt="image" src="https://github.com/user-attachments/assets/fb7d5fae-679f-4428-9d53-25f409b8f4c2" />
   Ubuntu versi 22.04.5 adalah rilisan lama, jadi scroll ke bawah lalu di _Previous Releases_ klik Download 22.04.5 LTS.
   <img width="1535" height="387" alt="image" src="https://github.com/user-attachments/assets/9eb82678-23dc-448b-8e2e-c52646ce74bc" />
- Install VirtualBox, akan ada warning kalau koneksi network akan putus selama instalasi 
   <img width="610" height="484" alt="image" src="https://github.com/user-attachments/assets/31b9f239-c070-49e8-9ec2-72f2d033d06e" />
- Buka VirtualBox yang sudah terinstall
  <img width="950" height="929" alt="image" src="https://github.com/user-attachments/assets/6dc9ce2f-e5f9-4920-8032-c0abb4e0ad17" />
- Klik New lalu isi VN Name, pilih lokasi folder penyimpanan VM dan pilih file .iso yang sudah didownload tadi. Pastikan Proceed with Unattended Installation **tidak dicentang**
  <img width="1016" height="500" alt="image" src="https://github.com/user-attachments/assets/a3c949dc-7ee4-4729-975a-a515edc3e406" />
- Pilih spesifikasi Virtual Hardware yang akan digunakan
  <img width="1014" height="502" alt="image" src="https://github.com/user-attachments/assets/5da26168-4ee0-4db1-90f5-43ec2c563261" />
- Akan ada _Summary_ dari konfigurasi yang sudah disetup tadi, klik finish
  <img width="1011" height="505" alt="image" src="https://github.com/user-attachments/assets/666a66aa-887a-4f9e-ae33-c83db25ba75f" />
- Di VirtualBox Manager klik start untuk menjalankan Ubuntu servernya
  <img width="953" height="928" alt="image" src="https://github.com/user-attachments/assets/b98109b2-64b3-400e-a201-a53a3aa9f211" />
- Pilih "Try or Install Ubuntu Server" lalu klik enter
  <img width="719" height="499" alt="image" src="https://github.com/user-attachments/assets/28288457-7ca1-4057-b1c6-4fabed8cadb6" />
- Pilih bahasa yang akan digunakan, lalu klik enter
  <img width="804" height="601" alt="image" src="https://github.com/user-attachments/assets/24290390-9d2e-4b7e-a790-393450d1135d" />
- Pilih Continue without updating, lalu klik enter
  <img width="805" height="606" alt="image" src="https://github.com/user-attachments/assets/9d25862c-1b14-4579-90ee-183cfed41d8b" />
- Pilih layout keyboard yang akan digunakan, lalu klik enter
  <img width="809" height="605" alt="image" src="https://github.com/user-attachments/assets/e04cdfb5-3f18-48d8-a934-19be17b40346" />
- Pilih tipe instalasi (Biarkan di Ubuntu Server), lalu klik enter
  <img width="802" height="600" alt="image" src="https://github.com/user-attachments/assets/06149584-c603-4703-a175-66134d93ead3" />
  




<h2>3. Menggunakan IP Address xxx.xxx.xxx.208 untuk server VM</h2>

<h2>4. Memastikan Server Ubuntu ada jaringan dengan test ping 8.8.8.8 / ping google.com</h2>
