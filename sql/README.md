# Custom MySQL Docker Image

This project provides a comprehensive guide on how to build and run a custom MySQL Docker image, establish a connection to the database container, and perform basic interactions with a sample database.

## 🚀 Getting Started

Follow these steps to set up and interact with your custom MySQL Docker image.

### Prerequisites

Before you begin, ensure you have Docker installed on your system.

* [Install Docker](https://docs.docker.com/get-docker/)

### 1. Build the Docker Image

Navigate to the root directory of this project in your terminal and execute the following command to build your custom MySQL image:

```bash
docker build -t louaii/custom-mysql .
This command builds a Docker image named louaii/custom-mysql using the Dockerfile in the current directory. The . at the end specifies the build context.

2. Run the MySQL Container
Once the image is built, you can run a container from it. This command will start the MySQL server:

Bash

docker run --rm -e MYSQL_ROOT_PASSWORD=your_secure_password -p 3307:3306 --name sql louaii/custom-mysql:latest
Explanation of Flags:

--rm: Automatically remove the container when it exits. This helps keep your Docker environment clean.
-e MYSQL_ROOT_PASSWORD=your_secure_password: Sets the MYSQL_ROOT_PASSWORD environment variable, which is crucial for the MySQL root user. Replace your_secure_password with a strong, secure password.
-p 3307:3306: Maps port 3307 on your host machine to port 3306 inside the container (the default MySQL port). You can change 3307 to any available port on your host.
--name sql: Assigns the name sql to your container, making it easier to reference.
louaii/custom-mysql:latest: Specifies the image to use, including the tag latest.
3. Access the Container's Shell
To interact directly with the running MySQL container (e.g., to debug or inspect files), you can execute a bash shell inside it:

Bash

docker exec -it sql bash
docker exec: Executes a command in a running container.
-it: Allocates a pseudo-TTY and keeps stdin open, allowing for interactive input.
sql: The name of your running container.
bash: The command to execute (starts a bash shell).
4. Connect to MySQL from Your Host Machine
With the container running, you can connect to the MySQL server from your host machine using a MySQL client:

Bash

mysql -h 127.0.0.1 -P 3307 -u root -p
-h 127.0.0.1: Specifies the host address. Since we mapped port 3307 from the container to your host, you connect to 127.0.0.1 (localhost).
-P 3307: Specifies the port number. This should match the host port you mapped earlier (3307).
-u root: Specifies the user as root.
-p: Prompts you for the password. Enter the your_secure_password you set when running the container.
5. Basic MySQL Commands (Inside the MySQL Client)
Once connected to the MySQL prompt, you can execute standard SQL commands:

List all databases:

SQL

show databases;
Select a database (e.g., cLouay if it exists and was created by your Dockerfile or initialization scripts):

SQL

use cLouay;
Show tables in the selected database:

SQL

show tables;
Retrieve all data from a specific table (e.g., persons):

SQL

select * from persons;
📂 Project Structure (Optional, if applicable)
If you have other files that contribute to the custom image (e.g., SQL initialization scripts, configuration files), you might want to add a section here describing them:

.
├── Dockerfile
└── init.sql (example, if you have one)
└── README.md
🤝 Contributing
Feel free to fork this repository, open issues, or submit pull requests to improve this project.

📄 License
This project is open-source and available under the MIT License. (You should create a LICENSE.md file if you plan to share this widely).
