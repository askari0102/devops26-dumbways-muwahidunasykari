**Deploying Wayshub App**

-----

1. Prepare two VM instances, both running Ubuntu Server, one for Appserver and one for Gateway.
2. Setup ssh connection on both servers so that you can only login with ssh-key without using password at all.
3. Login to the Appserver with ssh. Appserver will be used to deploy the database.
   
   <img width="299" height="33" alt="image" src="https://github.com/user-attachments/assets/5146f4a8-418b-420c-9d50-3a7d4b5ba521" />

5.  Run `sudo apt update` and `sudo apt install mysql-server` to install MySQL on the Appserver.

      <img width="1085" height="141" alt="image" src="https://github.com/user-attachments/assets/c24275e9-37c4-4638-9502-6ea1eba37e35" />
   
      <img width="973" height="93" alt="image" src="https://github.com/user-attachments/assets/3022388c-28e1-4da3-a0d9-09da2e399669" />

6. Enter mysql as 'root' with the command `sudo mysql -u root`
   
   <img width="492" height="27" alt="image" src="https://github.com/user-attachments/assets/d053b1cc-cd01-4f47-a1fd-f2713fc90141" />

8. Add password to 'root' with command `ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'your_password';`
   <img width="1100" height="46" alt="image" src="https://github.com/user-attachments/assets/5ebe8d40-9b29-413f-a663-8849d711e61b" />

9. Exit mysql and run `sudo mysql_secure_installation` to improve the security of the newly installed mysql.
   <img width="689" height="37" alt="image" src="https://github.com/user-attachments/assets/6c1cf12d-1aaa-4bad-b77d-a2c7905eac71" />
   <img width="865" height="152" alt="image" src="https://github.com/user-attachments/assets/916b210d-7645-4908-be42-d37f4a2285f1" />
   <img width="1175" height="173" alt="image" src="https://github.com/user-attachments/assets/56832773-8ad6-4553-ace8-1a900033860d" />
   <img width="969" height="31" alt="image" src="https://github.com/user-attachments/assets/2f9774aa-c741-4417-9a5f-8d87e4cdbbde" />
   <img width="840" height="30" alt="image" src="https://github.com/user-attachments/assets/647c62a9-5ecb-46bb-bb5c-18aa02f01d95" />
   <img width="947" height="34" alt="image" src="https://github.com/user-attachments/assets/98570cce-0b7e-48c6-81be-cac816136729" />
   <img width="1064" height="32" alt="image" src="https://github.com/user-attachments/assets/8ab156bf-62bc-4a6a-b191-7b3c9ffe3553" />
   <img width="899" height="101" alt="image" src="https://github.com/user-attachments/assets/2f4e41da-209b-485b-b6cf-e68a2ac8c39a" />

10. Enter mysql again with `sudo mysql -u root -p` and create new user `CREATE USER 'user'@'%' IDENTIFIED BY 'password';`
      <img width="702" height="33" alt="image" src="https://github.com/user-attachments/assets/50d5348a-fa13-41f2-8609-a6708ba3e529" />

11. Grant all privileges to the new user with `GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';`

    <img width="630" height="30" alt="image" src="https://github.com/user-attachments/assets/621f2d32-259c-4ce8-8f2c-b5b518c3265f" />

12. Exit mysql and enter again with the new user
    
    <img width="545" height="30" alt="image" src="https://github.com/user-attachments/assets/e9858cae-2289-4df0-86cf-e961ccd9c10d" />

14. Create new database for the wayshub app with `CREATE DATABASE wayshub;`
    
    <img width="393" height="37" alt="image" src="https://github.com/user-attachments/assets/d9aa60f6-9a6c-45e4-8761-73539133f053" />

15. Exit mysql and change the mysql bind address on /etc/mysql/mysql.conf.d/mysqld.cnf to "0.0.0.0" so that the database can listen for connections on all available network interfaces.
    <img width="819" height="98" alt="image" src="https://github.com/user-attachments/assets/3980cb3c-8f00-4d25-b94d-48d0b20426b3" />
 

17. Login to Gateway. Gateway will be used to deploy the frontend, backend and web server.
    <img width="502" height="33" alt="image" src="https://github.com/user-attachments/assets/801b0357-de6f-4041-9a94-cd00b18597b9" />

18. Clone the frontend and backend repositories.
    <img width="1066" height="372" alt="image" src="https://github.com/user-attachments/assets/b51aaf2a-8b41-4454-b52b-3b21f69b2a0d" />

19. Run `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash` to install nvm for Nodejs and restart the shell with `exec bash`.
    <img width="1288" height="24" alt="image" src="https://github.com/user-attachments/assets/2b8da0fc-7b61-4127-b686-0314e52f32f0" />
    <img width="471" height="25" alt="image" src="https://github.com/user-attachments/assets/c9e7ea4f-c88e-4bf0-9205-62798ba1b503" />

20. The app runs on Nodejs version 14. Run `nvm install 14` to install and run version 14.
    
    <img width="705" height="30" alt="image" src="https://github.com/user-attachments/assets/10a4a313-9ea5-4328-a807-b52477729937" />


21. Open 'config.json' in the backend directory.
    <img width="1185" height="174" alt="image" src="https://github.com/user-attachments/assets/cfd30e08-d298-4696-8b05-f32d2e179a8e" />
    
22. Edit the file to match the database. Don't forget to change the "host" to the IP address of the Appserver.
    <img width="533" height="240" alt="image" src="https://github.com/user-attachments/assets/cc95fcf0-f6a8-4163-a3ab-e81b86c18856" />

18. Go back to the backend directory and run `npm i -g sequelize-cli` to integrate the database to the backend.
    <img width="1470" height="234" alt="image" src="https://github.com/user-attachments/assets/5e399d54-f995-4954-94fc-f7eb4bf9dedc" />

