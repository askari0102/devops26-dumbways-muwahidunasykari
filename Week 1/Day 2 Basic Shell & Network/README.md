<h3>1. Buat sebuah diagram sebuah jaringan komputer dengan 4 device dengan kondisi :
IP Class C : 192.168.4.xxx
CIDR Block : 192.168.11.0/24</h3>

Tidak bisa diterapkan langsung karena IP host yang diberikan (192.168.4.xxx) tidak termasuk dalam network 192.168.11.0/24, Agar jaringan valid, IP host saya ubah mengikuti CIDR.
<img width="760" height="438" alt="image" src="https://github.com/user-attachments/assets/f16114a0-f7e4-446c-9e1c-89a783ac3169" />


| Device    | IP Address      | Gateway       | Subnet Mask       |
|-----------|----------------|---------------|-----------------|
| Router    | 192.168.11.1   | –             | 255.255.255.0 (/24) |
| Device 1  | 192.168.11.2   | 192.168.11.1 | 255.255.255.0 (/24) |
| Device 2  | 192.168.11.3   | 192.168.11.1 | 255.255.255.0 (/24) |
| Device 3  | 192.168.11.4   | 192.168.11.1 | 255.255.255.0 (/24) |
| Device 4  | 192.168.11.5   | 192.168.11.1 | 255.255.255.0 (/24) |


<h3>2. Jelaskan perbedaan antara SH (Shell) dan BASH (Bourne-Again Shell)</h3>

Shell adalah versi minimalis dari program antarmuka yang menghubungkan user dengan operating system melalui perintah, sedangkan BASH adalah pengembangan dari Shell dengan fitur yang lebih lengkap.

<h3>3. Buat dokumentasi/kumpulan command linux yang kalian ketahui! (Command diluar materi akan diberi nilai ++)</h3>

| Command | Keterangan |
|---------|------------|
| `sudo` | Jalankan perintah sebagai admin/root |
| `clear` | Membersihkan layar terminal |
| `ls -la` | Melihat isi direktori lengkap, termasuk file tersembunyi dan detail permission |
| `cd <folder>` / `cd ..` | Masuk ke direktori / kembali satu level |
| `pwd` | Menampilkan path direktori saat ini |
| `mkdir <folder>` | Membuat direktori baru |
| `touch <file>` | Membuat file kosong |
| `cp <asal> <tujuan>` | Menyalin file atau direktori dari **asal** ke **tujuan** |
| `mv <asal> <tujuan>` | Memindahkan atau mengganti nama file/direktori dari **asal** ke **tujuan** |
| `rm <file>` / `rm -r <folder>` | Menghapus file atau direktori beserta isinya |
| `cat <file>` | Melihat isi file |
| `echo "text" > file` / `>> file` | Menulis atau menambahkan text ke file |
| `nano <file>` | Membuka file dengan text editor nano |
| `vim <file>` | Membuka file dengan text editor vim (alternatif nano) |
| `grep <text> <file>` | Mencari text dalam file |
| `find <path> -name <nama>` | Mencari file atau direktori berdasarkan nama |
| `chmod <mode> <file>` | Mengubah permission file atau direktori |
| `chown <user>:<group> <file>` | Mengubah kepemilikan file atau direktori |
| `history` | Menampilkan perintah-perintah yang pernah dijalankan |
| `apt update` / `apt upgrade` | Memperbarui daftar paket dan meng-upgrade aplikasi (Debian/Ubuntu) |
| `top` | Memantau proses yang berjalan secara real-time |
| `htop` | Alternatif `top` dengan tampilan lebih interaktif |
| `df -h` | Melihat kapasitas dan penggunaan disk |
| `du -h <folder>` | Menampilkan penggunaan space folder/file |
| `free -h` | Melihat penggunaan RAM |
| `ping <host>` | Mengecek koneksi ke host tertentu |
| `tar -cvf file.tar <folder>` / `tar -xvf file.tar` | Membuat atau mengekstrak archive folder |
| `wget <url>` | Mengunduh file dari internet |
| `curl <url>` | Mengambil data dari internet |
| `head <file>` | Melihat 10 baris pertama file |
| `tail <file>` | Melihat 10 baris terakhir file |
| `tail -f <file>` | Memantau file secara real-time, misalnya log |
| `uname -a` | Menampilkan informasi sistem lengkap |
| `whoami` | Menampilkan user yang sedang login |
| `man <command>` | Melihat manual/help command |
| `alias` | Membuat shortcut atau alias untuk command |
