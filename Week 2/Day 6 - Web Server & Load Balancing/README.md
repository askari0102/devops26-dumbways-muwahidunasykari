<h2>1. Gambarkan sturktur web server menggunakan reverse proxy dan jelaskan cara kerjanya!</h2>

<img width="767" height="555" alt="image" src="https://github.com/user-attachments/assets/372927c2-c5c7-4f2a-afd8-da60558fa24f" />

1. Client mengirim request berupa HTTP/HTTPS ke server.
2. Nginx menerima request dan cek aturan routing.
3. Ngix meneruskan request ke backend server yang sesuai.
4. Backend memproses request.
5. Backend mengirim response ke Nginx.
6. Nginx meneruskan response ke client.

<h2>2. Buatlah Reverse Proxy untuk aplilkasi yang sudah kalian deploy kemarin. (wayshub), untuk domain nya sesuaikan nama masing"</h2>

<h2>Challenge</h2>

1. Terapkan Load Balancing untuk wayshub-frontend menggunakan 2 server dengan spek yang sama
2. Gunakan 2 dari 3 pilihan method ini :
- Round Robin
- IP Hash
- Least Connections

