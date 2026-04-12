**Docker and CI/CD**

------

Install Docker with this [bash script](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%204/install-docker.sh). Don't forget to add execute permission with `chmod+x install-docker.sh`

**Staging**

------
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


**Production with Jenkins**

-------
1. Fork the frontend and backend repositories to your own github. Mine can be found [here(frontend)](https://github.com/askari0102/wayshub-frontend) and [here(backend)](https://github.com/askari0102/wayshub-backend)
   
2. Clone both repo to your own computer.
   <img width="811" height="194" alt="image" src="https://github.com/user-attachments/assets/8f2a16ca-b3bd-4186-8ae9-92d37f7b9491" />

3. Edit the _api.js_ in the frontend and the _config.json_ in the backend so they're connected with one another
   <img width="802" height="88" alt="image" src="https://github.com/user-attachments/assets/93272cb5-0b07-40f5-a216-d05d6aaa62ec" />
   <img width="512" height="151" alt="image" src="https://github.com/user-attachments/assets/8bf9a487-9f7b-4b8c-a0ed-63d171e9510c" />

4. Create Dockerfile for the frontend and the backend. The content is the same as  the Dockerfile in Staging.
   
5. Create Jenkinsfile for the [frontend](https://github.com/askari0102/wayshub-frontend/blob/main/Jenkinsfile) and the [backend](https://github.com/askari0102/wayshub-backend/blob/main/Jenkinsfile).

6. Commit and push all the changes to github.
   <img width="944" height="79" alt="image" src="https://github.com/user-attachments/assets/903f7f47-6752-4ecb-a05a-3b9462d00b44" />
   <img width="944" height="77" alt="image" src="https://github.com/user-attachments/assets/35985db4-7fc4-409d-b041-e4216f0ba2ba" />

7. Prepare two servers, one for Appserver and one for CI/CD and Database.
   
8. In the Appserver, create a new directory for Wayshub and make the [docker-compose.yml](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%204/Production/docker-compose.yml) file and the [environment](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%204/Production/docker-compose.env).

9. Create .conf file for nginx
    <img width="816" height="604" alt="image" src="https://github.com/user-attachments/assets/5c9437c6-8301-45af-87a7-a87ccea40d3d" />

10. In the CI/CD server, create a new directory for Wayshub and make the [.yml for the docker compose](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%204/Production/CICD/docker-compose.yml) and the [environment file](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%204/Production/CICD/docker-compose.env).
    
12. Create Dockerfile for Jenkins.
    
    <img width="703" height="213" alt="image" src="https://github.com/user-attachments/assets/3c3c3cdd-b400-40c7-a30b-e40f59aad43d" />

14. Create .conf for nginx
    
    <img width="719" height="304" alt="image" src="https://github.com/user-attachments/assets/b4ae890a-22e7-4d93-afae-589bb5d4a262" />

16. Run `docker compose up -d --build` and access the jenkins container by running `docker exec -it wayshub_jenkins bash`. Run `docker ps` to make sure jenkins have permission to run docker commands.

17. Open Jenkins by using `Server_IP:8080` in your browser. In terminal run `docker logs wayshub-jenkins`, copy the password and paste it in your browser.
    <img width="1197" height="335" alt="image" src="https://github.com/user-attachments/assets/58d842b8-d7a1-4d66-bdde-665d7c427238" />
    <img width="1155" height="468" alt="image" src="https://github.com/user-attachments/assets/2a7064ac-6c66-4486-8584-81c319fa37e0" />

18. Finish the Jenkins setup, make sure "SSH Agent" plugin and "NodeJS" plugin are installed.
    <img width="929" height="111" alt="image" src="https://github.com/user-attachments/assets/4d6ff454-f70a-48ba-98e0-8355c0761df4" />
    <img width="993" height="217" alt="image" src="https://github.com/user-attachments/assets/d949d122-9324-4695-bae7-ff5b13ff3e7d" />

19. Go to _Manage Jenkins_ -> _Tools_ -> _Add NodeJs_. Select version 14 and save.
    <img width="1628" height="405" alt="image" src="https://github.com/user-attachments/assets/27260db2-cc48-4f05-b1cd-1f51ec11202a" />

17. Go to _Manage Jekins_ -> _Security_ and change the _Host Key Verification_ to _Accept first connection_ and click save.
    <img width="1632" height="189" alt="image" src="https://github.com/user-attachments/assets/843a87a4-feea-409a-8ce8-9b3e09771753" />

18. Create a pair of ssh key. Go to _Manage Jekins_ -> _Credentials_ -> _System_ -> _Global_ and choose _SSH username with private key_. Fill in the data and private key and click _Create_. Don't forget to add the public key to the appserver.
    <img width="664" height="143" alt="image" src="https://github.com/user-attachments/assets/e1c5ce88-813c-4382-93de-427dbcb43eac" />

19. Create another Credential for Docker Hub's username and password.
    <img width="1565" height="92" alt="image" src="https://github.com/user-attachments/assets/34e7086a-85b1-4739-971a-b07f3f50f4f4" />

20. Go back to Jenkins' main page and click create _New Item_ and select pipeline
    <img width="1129" height="325" alt="image" src="https://github.com/user-attachments/assets/9fc59a35-0015-4d4d-bff7-fd2ba616fa67" />

21. Select _GitHub hook trigger for GITScm polling_
    <img width="960" height="214" alt="image" src="https://github.com/user-attachments/assets/470a0ba6-271c-4d85-a5ac-217a592a8079" />

22. Select _Pipeline script from SCM_, select _Git_ and paste in the repo's url
    <img width="1336" height="650" alt="image" src="https://github.com/user-attachments/assets/2ea65458-3d7d-4966-bac5-dd1635f3db63" />

23. Create another pipeline for the backend.
    <img width="1455" height="291" alt="image" src="https://github.com/user-attachments/assets/05ec0789-478f-4713-b2e4-e5fb2a1cc52e" />

24. Go to your github repository and click _Settings_ -> _Weebhooks_ -> _Add Webhook_. Paste the Jenkins url and save webhook. Add webhook for both the frontend and the backend repositories.
    <img width="964" height="93" alt="image" src="https://github.com/user-attachments/assets/01f0fce9-9648-4d15-9871-56392c5a4d13" />

25. Push something to your github repo. The pipeline will trigger automatically every time there's a change in the SCM.
    <img width="982" height="307" alt="image" src="https://github.com/user-attachments/assets/c6c3477c-2bd2-4842-bad6-583960962501" />
    <img width="1433" height="187" alt="image" src="https://github.com/user-attachments/assets/a59a9d2a-8acd-4ed7-b392-29f5ac2687aa" />

26. Open the domain, the site is fully functional with login and register.
    <img width="1919" height="939" alt="image" src="https://github.com/user-attachments/assets/b19796a5-ab79-48b3-af2a-cfd95b6c9d86" />
    <img width="1919" height="390" alt="image" src="https://github.com/user-attachments/assets/7afd91c9-4e87-425b-b548-97b9d2ec5244" />

**Extra**

----
**Adding "test" stage to frontend and backend**

1. The frontend already have react library and script so you only have to add new file for testing.
   <img width="1095" height="512" alt="image" src="https://github.com/user-attachments/assets/85ee4033-4d56-45cd-87ed-5dc55676d7fc" />

2. The backend is a bit different. Create a new file for testing.
   <img width="568" height="378" alt="image" src="https://github.com/user-attachments/assets/c76e7a71-6925-4646-b9eb-09e99b0c037b" />

3. Edit the Jenkinsfile and add node:20 tool. The test will be ran with a zero-dependency built-in test runner.
   
   <img width="314" height="174" alt="image" src="https://github.com/user-attachments/assets/c6bc2f64-f88e-4d1b-b1b7-078aed17d47f" />
   <img width="435" height="220" alt="image" src="https://github.com/user-attachments/assets/cfe10230-72a5-4736-a867-1f83e0d0b428" />

**Discord Notifications with Jenkins**

1. Go to _Server settings_ -> _Integrations_. Click _Create Webhook_
   <img width="1456" height="796" alt="image" src="https://github.com/user-attachments/assets/4cc7b197-e08e-4b15-95f6-8c82fddc2481" />

2. Create or edit an existing webhook and click _Copy Webhook URL_
   <img width="884" height="500" alt="image" src="https://github.com/user-attachments/assets/71adfcc2-5cc9-40b0-9d92-70a78faec458" />

3. Go to Jenkins and add a new secret text crendential for the webhook url.

   <img width="688" height="643" alt="image" src="https://github.com/user-attachments/assets/3aad42ad-7353-4f8a-bb5b-4f164a463e88" />

4. Update your Jenkinsfile to add the webhook and setup notification.
   
   <img width="645" height="44" alt="image" src="https://github.com/user-attachments/assets/c00131aa-fbd0-4bb2-b8af-f00036c94c62" />
   <img width="1145" height="918" alt="image" src="https://github.com/user-attachments/assets/2591444a-0c8e-4977-b07d-83fed0802799" />

5. The bot will notify if all stages ran successfully or not.
   <img width="1315" height="233" alt="image" src="https://github.com/user-attachments/assets/61f66635-e656-452b-a9f7-dde373b4d257" />

   
**Backend crashes when registering**

1. If your backend crashes when registering, add `JWT_PRIVATE_KEY` to `docker-compose.env`
   <img width="845" height="124" alt="image" src="https://github.com/user-attachments/assets/1d5f2e96-7105-41d2-bdf3-5bb007caa80f" />
   
2. Change `bcrypt` to `bcryptjs`.
      - in `package.json` = `"bcryptjs": "^2.4.3"`
      - in all controllers with bcrypt = `const bcrypt = require('bcryptjs');`

-----
**GitLab**

-----

1. Add public key to your gitlab account
   <img width="1360" height="272" alt="image" src="https://github.com/user-attachments/assets/89446ff9-4338-4bbd-8095-c8e120d4331e" />

2. Generate a new key that will be used for deploying to appserver from gitlab. Copy and paste the public key to the appserver
   <img width="1359" height="51" alt="image" src="https://github.com/user-attachments/assets/89dddba0-5c95-4400-8d0b-e9fcf6408ddd" />

3. Go to Gitlab -> Repo -> _Settings_ -> _CI/CD_ -> _Variables_ -> _Add variable_ and add several things
   <img width="931" height="321" alt="image" src="https://github.com/user-attachments/assets/333115ca-55c6-42ae-a775-66897e5479ff" />

4. Create a new file called `[.gitlab-ci.yml](https://gitlab.com/askari0102/wayshub-backend/-/blob/main/.gitlab-ci.yml)` in your repo
   
5. Push the file to gitlab
   <img width="1153" height="328" alt="image" src="https://github.com/user-attachments/assets/375b140d-ece8-4eb0-945c-8515f73c6729" />

   
