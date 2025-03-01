# docker-revision
Quick revision for Docker and it's commands

# Understanding Docker Terminologies

### 🐳 Dockerfile
A script that contains instructions to build a Docker image.

### 📦 Docker Image
A blueprint for creating Docker containers.

### 🚀 Container
A running instance of an image that has its own lifecycle.

### 💾 Docker Volume
Storage on the host side, mapped to a folder in the container to persist data.

---

## 🔄 Container Lifecycle
- A container has a lifecycle (**Start, Stop, Restart, Delete**).
- If a container is killed **without a volume**, data is lost.
- **Persistent data** is managed using Docker Volumes.

---

## 🌐 Docker Networking
At first, containers are **isolated**. To enable communication, Docker provides various networking options.

### 🕸️ Types of Docker Networks

- **None** - No network assigned to the container.
- **Host** - Container and host share the same network namespace (same ports).
- **Bridge** - Default network mode where containers get a separate IP but can be accessed via port mapping (`-p` flag).
- **User-Defined Bridge** - Allows multiple containers to communicate over a custom bridge network.
  - **Command:** `docker network create my-net` _(Creates a user-defined bridge network)_
- **IP-LAN Network** - Network specific to LAN communication.
- **MAC-LAN Network** - Uses MAC addresses for container communication.
- **Overlay** - Used in Swarm mode for container-to-container communication across different hosts.
- **Clusters** (a group of nodes/machines) utilize overlay networking.

---
# Docker Networking & Multi-Stage Build Guide

## 🛠 Docker Commands for Networking & Multi-Stage Builds

### 🚀 Creating a Custom Bridge Network

```sh
docker network create my-net
```
Creates a user-defined bridge network named `my-net`.

### 🔍 Inspecting the Network

```sh
docker inspect my-net
```
Displays details of the `my-net` network.

### 🌍 Running an Nginx Container in a Custom Network

```sh
docker run -d --network my-net --name nginx -p 80:80 nginx:latest
```
Runs an Nginx container in the `my-net` network with port `80` exposed.

---

## 🏗 Building a Multi-Stage Image (Using Distroless for Production)

```sh
docker build -t online_app_short_distroless:latest -f ./Dockerfile-multistage-build .
```
Builds an optimized multi-stage image using **distroless** for production security.

### 🚢 Running a Container from Multi-Stage Image

```sh
docker run -d --name online_shop_app_distroless -p 5173:5173 online_app_short_distroless:latest
```
Runs the application container from the built image.

### 📂 Creating a Container with Volume Mounting for Logs

```sh
docker run -d -v /home/ubuntu/volumes/my_app/:/logs -p 5137:5137 my_app:latest
```
Maps `/logs` in the container to `/home/ubuntu/volumes/my_app/` on the host for **persistent logging**.

---

## 📝 Docker Compose Commands

### 🔄 Start & Stop Services

```sh
docker-compose up -d   # Start services in detached mode
docker-compose down    # Stop and remove containers, networks, volumes
```

### 📌 Building & Restarting Services

```sh
docker-compose build   # Build or rebuild services
docker-compose restart # Restart services
```

### 🔍 Viewing Logs & Container Status

```sh
docker-compose logs -f   # View logs of all services
docker-compose ps       # List running containers
```

---

## 📌 Key Takeaways

- ✅ **Multi-stage builds** reduce image size and improve security.
- ✅ **Using distroless images** eliminates unnecessary dependencies.
- ✅ **Custom bridge networks** enable better container-to-container communication.
- ✅ **Docker volumes** help persist important data like logs and database files.

This guide provides a structured approach to networking and production-ready Docker builds. 🚀

---
