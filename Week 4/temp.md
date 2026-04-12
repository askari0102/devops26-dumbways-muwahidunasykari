1. Create a new docker user and login with the new user.
   <img width="825" height="35" alt="image" src="https://github.com/user-attachments/assets/247470d1-a6f0-4362-8d24-78ffffcc9029" />
   <img width="944" height="52" alt="image" src="https://github.com/user-attachments/assets/79f30130-023d-4700-950b-057aa5f244c3" />
   <img width="729" height="36" alt="image" src="https://github.com/user-attachments/assets/8265fc48-9d44-476a-8a87-f1b2b0188be2" />

2. Make a new directory for the app, then clone the frontend and the backend
   <img width="1251" height="492" alt="image" src="https://github.com/user-attachments/assets/94deb1be-7139-4daa-8265-87819f3a25d0" />

3. Make "Dockerfile" for both the frontend and the backend.
   <img width="1147" height="393" alt="image" src="https://github.com/user-attachments/assets/12a50ad9-bafb-41af-ad3c-da719cb4d6b0" />

4. Set config to connect frontend to backend, and the backend to database.
   <img width="896" height="428" alt="image" src="https://github.com/user-attachments/assets/52251c28-b6eb-4f0e-a262-00b3289cd15a" />
   <img width="985" height="215" alt="image" src="https://github.com/user-attachments/assets/bf6487f2-78a8-42b7-ba2d-895612a390e6" />

5. Build the frontend and the backend.
   <img width="1470" height="224" alt="image" src="https://github.com/user-attachments/assets/32cc979c-d3f4-4ac3-9a6e-7cae57713b5e" />
   <img width="1472" height="232" alt="image" src="https://github.com/user-attachments/assets/0243b90b-e2f8-42c4-b644-c8cadf0895ed" />

6. Make .conf file for the web server/nginx
   <img width="819" height="602" alt="image" src="https://github.com/user-attachments/assets/79219269-44ed-4418-a848-6d1e281b9ee9" />

7. Make docker-compose.yml file, and the .env for the backend
   <img width="796" height="761" alt="image" src="https://github.com/user-attachments/assets/2a3f4785-d03e-4bf3-89af-34832503b66a" />
   <img width="802" height="171" alt="image" src="https://github.com/user-attachments/assets/9f6f3922-6612-4d95-ad40-ea97b56dee83" />

9. Run docker compose up
   <img width="1478" height="260" alt="image" src="https://github.com/user-attachments/assets/f71f226b-3ffa-400f-9078-5a0bf7c8aa7b" />

10. The app can be accessed with a domain with all its functions.
    <img width="1912" height="975" alt="image" src="https://github.com/user-attachments/assets/3713dc4e-3d85-4119-b2b4-eadbde3957df" />
    <img width="1910" height="470" alt="image" src="https://github.com/user-attachments/assets/313481da-286d-4276-9e9a-b6bda92af95a" />

**Jenkins Setup**

1. Run `docker run -d -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk21` to run jenkins on top docker
   <img width="1470" height="53" alt="image" src="https://github.com/user-attachments/assets/505e18ea-7262-400b-8344-ddb4745f0a83" />

2. Check if its running correctly by running docker ps
   <img width="1470" height="121" alt="image" src="https://github.com/user-attachments/assets/ca1e386e-275d-49b8-95b3-6e5e86b8e114" />

3. Open Jenkins with IP Address on port 8080 and login with your password
   <img width="1242" height="861" alt="image" src="https://github.com/user-attachments/assets/fad9a377-a0fa-42d4-a36e-182849df6e8b" />

4. Choose _Select plugins to install_.
   <img width="1247" height="861" alt="image" src="https://github.com/user-attachments/assets/0cbe122b-c671-4500-bd83-c0d643fc8762" />

5. Make sure _SSH Agent_ is selected and proceed by clicking _install_.
   <img width="1238" height="855" alt="image" src="https://github.com/user-attachments/assets/d1a4c37e-7fdf-49bd-8e73-4b21e20b4437" />

6. Create admin user on this page
   <img width="1233" height="856" alt="image" src="https://github.com/user-attachments/assets/9a6a00e1-37e3-44bb-953d-1949fd589dc9" />

7. Setup URL, I'm just gonna leave it at IP address and setup reverse proxy later. 
   <img width="1231" height="438" alt="image" src="https://github.com/user-attachments/assets/226e87e0-f40d-4221-a214-065ba19dac85" />

8. Jenkins is ready
   
   <img width="774" height="350" alt="image" src="https://github.com/user-attachments/assets/27e263b4-0498-451c-b4b0-786650cdb4b8" />

9. Go to _Manage Jekins_ -> _Security_ and change the _Host Key Verification_ to _Accept first connection_ and click save.
    <img width="1632" height="189" alt="image" src="https://github.com/user-attachments/assets/843a87a4-feea-409a-8ce8-9b3e09771753" />

10. Go to _Manage Jekins_ -> _Credentials_ -> _System_ -> _Global_ and choose _SSH username with private key_. Fill in the data and private key and click _Create_. Don't forget to add the public key to the appserver.
    
    <img width="688" height="845" alt="image" src="https://github.com/user-attachments/assets/e96ddd03-c200-4fce-8139-c1c293d34894" />

12. Go back to dashboard and click _New Item_ and select _Pipeline_.
    <img width="1602" height="401" alt="image" src="https://github.com/user-attachments/assets/ad4e96b2-023b-4e94-ae2b-af66622e471b" />
