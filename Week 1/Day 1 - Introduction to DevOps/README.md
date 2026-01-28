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
- Di halaman Network configuration, pilih serperti yang ada di gambar, lalu klik enter untuk meng-_edit_ konfigurasi network
  <img width="798" height="598" alt="image" src="https://github.com/user-attachments/assets/7b632244-0285-4745-9277-420f5f23d515" />
- Pilih Edit IPV4, lalu klik enter
  <img width="801" height="600" alt="image" src="https://github.com/user-attachments/assets/f996f25c-9801-494c-81f0-f9d9de089e64" />
- Klik enter di IPV4 method, lalu pilih Manual dan klik enter lagi
  <img width="801" height="597" alt="image" src="https://github.com/user-attachments/assets/49cbee92-5eb8-4eaf-a2f7-ef11f38fa768" />
  <img width="595" height="134" alt="image" src="https://github.com/user-attachments/assets/a64648fc-a4cc-446e-bb8c-8558a4d3688c" />
- Di sini samakan konfigurasi dengan yang ada di laptop, cek dengan ketik "ipconfig" di command prompt di device yang kita gunakan, setelah diisi pilih save dan klik enter
  <img width="801" height="600" alt="image" src="https://github.com/user-attachments/assets/62906eb6-e0da-41bf-a8c4-023ece6d6a3c" />
  <img width="842" height="166" alt="image" src="https://github.com/user-attachments/assets/54ce6875-6ba9-401c-8236-1b4c9778687e" />
  <img width="799" height="598" alt="image" src="https://github.com/user-attachments/assets/aa8a6115-f02e-404d-9c39-1a6ef65f4295" />


- Pilih done, lalu klik enter
  <img width="809" height="602" alt="image" src="https://github.com/user-attachments/assets/ded13572-6183-40e2-bfc4-7628a1321b2e" />
- Proxy address dan Mirror address kita lewatkan saja dengan langsung pilih Done lalu klik enter
  <img width="799" height="600" alt="image" src="https://github.com/user-attachments/assets/519f10a9-84d9-42aa-a6eb-ccaca7314515" />
  <img width="799" height="595" alt="image" src="https://github.com/user-attachments/assets/95faa199-1691-4e9a-8277-6f487affce04" />
  <img width="796" height="581" alt="image" src="https://github.com/user-attachments/assets/1815f86d-258c-4584-a0ef-a3a4b74e83de" />
- Di halaman _Guided storage configuration_, pilih _Custom storage layout_, lalu pilih Done dan klik enter 
  <img width="798" height="596" alt="image" src="https://github.com/user-attachments/assets/555842ac-2e5d-4068-96a2-579a930cc270" />
- Pilih free space lalu klik enter, pilih Add GPT Partition, input size yang diinginkan lalu pilih Create
  <img width="792" height="597" alt="image" src="https://github.com/user-attachments/assets/d503b750-6a51-401b-885e-4ee45edcba23" />
  <img width="718" height="135" alt="image" src="https://github.com/user-attachments/assets/2fe30f37-564d-403f-9670-fa5788483043" />
  <img width="793" height="595" alt="image" src="https://github.com/user-attachments/assets/e4f4413d-1744-4b55-a622-072dee0c69c4" />
- Pilih free space dan Add GPT Partition lagi
  <img width="797" height="458" alt="image" src="https://github.com/user-attachments/assets/c8908a42-239b-4b7f-b59b-2674d31f95c2" />
- Input size yang diinginkan, lalu pilih format dan klik enter
  <img width="796" height="596" alt="image" src="https://github.com/user-attachments/assets/f6378073-fb91-4d3c-945d-1a8388189967" />
- Di format pilih swap, lalu klik enter dan Create
  <img width="661" height="298" alt="image" src="https://github.com/user-attachments/assets/ab749b05-8e67-4070-9061-95a130712d56" />
  <img width="704" height="312" alt="image" src="https://github.com/user-attachments/assets/4bee78eb-054a-4e0e-8b2e-365026b49927" />
  <img width="645" height="292" alt="image" src="https://github.com/user-attachments/assets/aa73f758-4f3a-4ebd-9f26-b32835daa5a9" />
- Pilih Done, lalu klik enter
  
  <img width="800" height="601" alt="image" src="https://github.com/user-attachments/assets/4ba83a3d-8064-4894-978e-0bf6b6879a65" />
- Konfirmasi dengan pilih Continue, lalu klik enter
  <img width="796" height="598" alt="image" src="https://github.com/user-attachments/assets/6757e399-5fe7-4f10-9033-146a0f930b02" />
- Lengkapi data di Profile Configuration, lalu pilih Done dan klik enter
  <img width="799" height="595" alt="image" src="https://github.com/user-attachments/assets/e1f1ea60-ed93-4c84-a2dd-f32402458137" />
- Pilih "Skip Ubuntu Pro setup for now", lalu klik continue
  <img width="808" height="599" alt="image" src="https://github.com/user-attachments/assets/7573a62d-6844-4cda-9066-527799ed4df8" />
- Di SSH configuration tidak usah pilih Install OpenSSH server dan langsung pilih Done saja
  <img width="793" height="593" alt="image" src="https://github.com/user-attachments/assets/6e209d2e-a7d6-4b36-b228-88ae687f64a4" />
- Di Featured server snaps langsung pilih Done saja dan tidak perlu ada yang dipilih 
  <img width="793" height="599" alt="image" src="https://github.com/user-attachments/assets/96fc6aa3-b31d-4bab-9aa6-2f198a6a5d29" />
- Proses instalasi sedang berjalan, setelah Installation complete, langsung pilih Reboot now
  <img width="799" height="596" alt="image" src="https://github.com/user-attachments/assets/ed477839-7429-4237-9733-8fecc89582b7" />
  <img width="800" height="601" alt="image" src="https://github.com/user-attachments/assets/1b761f46-cd13-47b8-b70a-12520afa2eee" />
- Akan ada error seperti berikut, tapi biarkan saja dan klik Enter
  
  <img width="527" height="96" alt="image" src="https://github.com/user-attachments/assets/33e17bdc-ce80-43b1-b733-a3503807c251" />
- Setelah reboot selesai, login dengan usename dan password yang sudah dibuat sebelumnya
  <img width="550" height="152" alt="image" src="https://github.com/user-attachments/assets/dcacc964-4e6f-478a-8aad-50a31fd599da" />
 


  

<h2>KENDALA</h2>

Pop-up destructive muncul berkali kali
<img width="799" height="604" alt="image" src="https://github.com/user-attachments/assets/741c4f5f-324c-4430-b2c5-77946dd72a37" />

Instalasi stuck berjam-jam

<img width="799" height="590" alt="image" src="https://github.com/user-attachments/assets/4e796a9b-f421-46e5-a066-6104f85bbbb7" />


