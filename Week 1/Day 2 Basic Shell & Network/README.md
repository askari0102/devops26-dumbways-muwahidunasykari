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


<h3>2. Jelaskan perbedaan antara SH (Shell) dan BASH (Bourne-Again Shell) </h3>

<h3>3. Buat dokumentasi/kumpulan command linux yang kalian ketahui! (Command diluar materi akan diberi nilai ++)</h3>
