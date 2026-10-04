# 🐳 Dockerized Nginx Web Server

A simple Docker project that uses a custom **Dockerfile** to build a lightweight Nginx web server image using `nginx:alpine`. The project copies static website files from the local `web1` directory into the Nginx web root and serves them through a Docker container.

This project demonstrates the fundamentals of **Docker image creation, Dockerfile instructions, container management, and port mapping**.

## 📌 Project Overview

The goal of this project is to containerize a static website using Nginx and Docker.

* **Base Image:** `nginx:alpine`
* **Web Server:** Nginx
* **Website Content:** HTML files from the `web1` directory
* **Container Port:** `80`
* **Host Port:** `8080` (configurable)
* **Build Tool:** Docker

## 🏗️ Architecture

```text
              Local Machine
                    |
               Dockerfile
                    |
             Docker Build
                    |
             Docker Image
                    |
             Docker Container
                    |
                Nginx
                    |
            /usr/share/nginx/html
                    |
              Static Website
                    |
              Port 80
                    |
             Host Port 8080
                    |
                Browser
                    |
          http://localhost:8080
```

## 📂 Project Structure

```text
docker-nginx/
│
├── Dockerfile
│
├── web1/
│   ├── index.html
│   ├── style.css
│   └── images/
│
└── README.md
```

## 🛠️ Technologies Used

* 🐳 **Docker** – Containerization platform
* 🌐 **Nginx** – High-performance web server
* 🐧 **Alpine Linux** – Lightweight Linux distribution
* 📄 **HTML/CSS** – Static website content

## ⚙️ Dockerfile

```dockerfile
FROM nginx:alpine

# Copy the entire contents of the web1 folder into the NGINX HTML directory
COPY ./web1/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

## 🔍 Dockerfile Explanation

| Instruction                           | Description                                                     |
| ------------------------------------- | --------------------------------------------------------------- |
| `FROM nginx:alpine`                   | Uses the lightweight Nginx Alpine image as the base image       |
| `COPY ./web1/ /usr/share/nginx/html/` | Copies website files into the Nginx document root               |
| `EXPOSE 80`                           | Documents that the container listens on port 80                 |
| `CMD ["nginx", "-g", "daemon off;"]`  | Starts Nginx in the foreground so the container remains running |

## 🚀 Getting Started

### 1. Prerequisites

Install the following tools:

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows/macOS) or Docker Engine (Linux)
* Git (optional, for cloning the repository)

Verify Docker installation:

```bash
docker --version
```

Check whether Docker is running:

```bash
docker info
```

### 2. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/docker-nginx.git
```

Navigate to the project directory:

```bash
cd docker-nginx
```

Ensure that the `Dockerfile` and `web1` directory are present.

### 3. Create Website Content

Create an `index.html` file inside the `web1` directory.

**web1/index.html**

```html
<!DOCTYPE html>
<html>
<head>
    <title>Docker Nginx Web Server</title>
</head>
<body>
    <h1>Welcome to My Dockerized Nginx Web Server!</h1>
    <p>This website is running inside a Docker container.</p>
</body>
</html>
```

### 4. Build the Docker Image

Run the following command from the project root directory:

```bash
docker build -t my-nginx-web .
```

**Explanation:**

* `docker build` creates a Docker image.
* `-t my-nginx-web` assigns a name to the image.
* `.` specifies the current directory as the build context.

### 5. Verify the Docker Image

```bash
docker images
```

You should see `my-nginx-web` listed among your local Docker images.

### 6. Run the Docker Container

```bash
docker run -d -p 8080:80 --name nginx-web-container my-nginx-web
```

**Command explanation:**

| Option         | Description                              |
| -------------- | ---------------------------------------- |
| `-d`           | Runs the container in detached mode      |
| `-p 8080:80`   | Maps host port 8080 to container port 80 |
| `--name`       | Assigns a custom container name          |
| `my-nginx-web` | Specifies the image to run               |

### 7. Access the Website

Open your web browser and navigate to:

**http://localhost:8080**

Your static website should now be served by Nginx inside the Docker container.

## 🧰 Useful Docker Commands

| Command                                  | Purpose                                                   |
| ---------------------------------------- | --------------------------------------------------------- |
| `docker ps`                              | Lists running containers                                  |
| `docker ps -a`                           | Lists all containers                                      |
| `docker images`                          | Lists available Docker images                             |
| `docker logs nginx-web-container`        | Displays container logs                                   |
| `docker exec -it nginx-web-container sh` | Opens a shell inside the container                        |
| `docker stop nginx-web-container`        | Stops the container                                       |
| `docker start nginx-web-container`       | Starts a stopped container                                |
| `docker restart nginx-web-container`     | Restarts the container                                    |
| `docker rm -f nginx-web-container`       | Force-removes the container                               |
| `docker rmi my-nginx-web`                | Removes the Docker image after its containers are removed |

## 🔄 Updating Website Content

Whenever you modify the HTML, CSS, or image files inside `web1`, rebuild the image and recreate the container to apply the changes.

```bash
docker build -t my-nginx-web .
docker rm -f nginx-web-container
docker run -d -p 8080:80 --name nginx-web-container my-nginx-web
```

Then refresh `http://localhost:8080` in your browser.

## 🛑 Stop and Remove the Container

Stop the running container:

```bash
docker stop nginx-web-container
```

Remove the container:

```bash
docker rm nginx-web-container
```

## 🐞 Troubleshooting

### 1. Port Already in Use

If port `8080` is already occupied, map a different host port:

```bash
docker run -d -p 8081:80 --name nginx-web-container my-nginx-web
```

Access the website at `http://localhost:8081`.

### 2. Container Exits Immediately

Check the container status:

```bash
docker ps -a
```

Review its logs:

```bash
docker logs nginx-web-container
```

### 3. Website Is Not Loading

Verify that the container is running:

```bash
docker ps
```

Check Nginx logs:

```bash
docker logs nginx-web-container
```

Ensure that `web1/index.html` exists and was included in the Docker build context.

### 4. Changes Are Not Reflected

Rebuild the Docker image after modifying website files and recreate the container. The `COPY` instruction includes files at image build time; it does not continuously synchronize host-side changes.

## 🎯 Key Learnings

Through this project, you will gain practical experience in:

* Creating custom Docker images using Dockerfiles.
* Understanding Dockerfile instructions such as `FROM`, `COPY`, `EXPOSE`, and `CMD`.
* Using lightweight Alpine-based images.
* Building and tagging Docker images.
* Deploying Nginx inside a Docker container.
* Mapping host and container ports.
* Managing container lifecycle operations.
* Viewing logs and troubleshooting basic container issues.

## 🔮 Future Enhancements

* Add a Docker Compose configuration to simplify deployment.
* Configure a custom Nginx configuration file.
* Enable HTTPS using SSL/TLS certificates.
* Add a health check to monitor Nginx availability.
* Deploy the container to an Azure cloud virtual machine.
* Set up a CI/CD pipeline using GitHub Actions.
* Push the custom image to Docker Hub.

## 👨‍💻 Author

**Jayraj M**

Application Support Engineer | Docker | Linux | SQL | DevOps

GitHub: [YOUR_GITHUB_PROFILE](https://github.com/YOUR_USERNAME)

---

⭐ If you find this project useful, consider giving the repository a star!
