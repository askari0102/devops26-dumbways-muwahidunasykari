**Docker and CI/CD**

------

Install Docker with this [bash script](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%204/install-docker.sh). Don't forget to add execute permission with `chmod+x install-docker.sh`

**Staging**

1. Make a new user `sudo adduser username`, add the user to the sudo and docker group with `sudo usermod -aG sudo username` and `sudo usermod -aG docker username`, run `newgrp docker` to reload membership, log in to the new account with `su - username`. Check if Docker can be run without root by running `docker ps`.
   <img width="940" height="550" alt="image" src="https://github.com/user-attachments/assets/7006b773-090a-4ded-951a-3826fcdffcd0" />
   <img width="877" height="192" alt="image" src="https://github.com/user-attachments/assets/c4fc3c85-0ac3-4f56-a7ad-09e8a2736a51" />

2. Make a new directory for the app and clone the frontend and the backend.
   <img width="1216" height="537" alt="image" src="https://github.com/user-attachments/assets/4d4d2bba-93c1-416e-9819-90664f119b65" />

3. Make a file called "Dockerfile" in the frontend and backend directories.
   <img width="1065" height="396" alt="image" src="https://github.com/user-attachments/assets/82d71175-6059-4d1b-a70d-04f36f985a12" />

4. Edit the _api.js_ in the frontend directory to connect to the backend.
   <img width="947" height="467" alt="image" src="https://github.com/user-attachments/assets/5031756f-b327-45f5-9d9e-919505a29850" />

5. Edit the _config.json_ in the backend directory to connect the backend to the database.
   <img width="955" height="235" alt="image" src="https://github.com/user-attachments/assets/47ee29ed-14fc-421f-94f5-0b3b17c28429" />

6. Make a new directory for nginx and a .conf file.
   <img width="802" height="604" alt="image" src="https://github.com/user-attachments/assets/e90d7a02-c928-4301-bee3-09a3aa5fd11a" />

7. In the app directory, make a new file called "[docker-compose.yml](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%204/docker-compose.yml)"
   
8. Make a new file called "docker-compose.env" for the environment.
   <img width="761" height="306" alt="image" src="https://github.com/user-attachments/assets/2a870ecb-fb1c-403d-ba2a-4a66752930fe" />

9. Run `docker compose up -d --build`
   <img width="1460" height="121" alt="image" src="https://github.com/user-attachments/assets/330e581d-dfde-4004-9889-6526150883de" />

10. Run `docker ps` to check whats running
    <img width="1633" height="259" alt="image" src="https://github.com/user-attachments/assets/5c38c7df-80a3-44b8-81f8-6770479a7227" />

11. The app can be accessed with a domain with all its functions.
    <img width="1919" height="976" alt="image" src="https://github.com/user-attachments/assets/216b7586-1185-4909-afe8-e17248bb48a4" />


**Production**



13. Select _GitHub hook trigger for GITScm polling_ and config your pipeline with your repo and the credentials that you created earlier then click _Save_.
    <img width="1361" height="706" alt="image" src="https://github.com/user-attachments/assets/a841d6d9-989b-47ca-8ab1-68d5233c5bbf" />

