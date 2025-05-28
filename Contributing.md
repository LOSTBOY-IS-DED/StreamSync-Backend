## 🐳 Docker Installation Guide

1. ⚙️ **Install Docker**  
   Make sure Docker is installed and running on your system. [Get Docker →](https://docs.docker.com/engine/install/)

2. 🌐 **Create a custom Docker network**
````
   docker network create streamsync_backend
````

3. 🔌 **Start Redis Stack**
   Launch Redis (with RedisInsight UI on port 8001):

   ```bash
   docker run -d \
     --name redis-stack \
     -p 6379:6379 \
     -p 8001:8001 \
     redis/redis-stack:latest
   ```

4. 🏗 **Build the backend image**

   ```bash
   docker build -t streamsync_backend .
   ```

5. 🚀 **Run the backend container**

   ```bash
   docker run -d \
     --name streamsync-server \
     --network streamsync_backend \
     -p 4000:4000 \
     -e WS_PORT=4000 \
     -e SERVER_ID=streamsync-docker \
     -e REDIS_URL=redis://redis-stack:6379 \
     streamsync_backend
   ```

---

## 🐋 Docker Compose Installation

If you want a simpler, one-command setup using Docker Compose:

1. 🧰 **Install Docker & Docker Compose**
2. 📦 **Run all services at once**

   ```bash
   docker-compose up --build
   ```

This will build and start all services (Redis and backend) as defined in your `docker-compose.yml`.

---

## 🧪 Environment Variables

| Variable    | Description                        | Default / Example          |
| ----------- | ---------------------------------- | -------------------------- |
| `WS_PORT`   | Port your WebSocket server runs on | `4000`                     |
| `SERVER_ID` | Unique server identifier           | `streamsync-docker`        |
| `REDIS_URL` | Redis connection string            | `redis://redis-stack:6379` |

---

## 🧩 Tech Stack

* Node.js + TypeScript
* WebSocket
* Redis + Redis Stack
* Docker / Docker Compose

---