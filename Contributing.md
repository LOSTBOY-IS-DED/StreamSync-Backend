 ## Docker installation
 - Install docker
 - Create a network - docker network create streamsync_backend
 - start Redis - `docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest`
 - Build the image - `docker build -t streamsync_backend .`
 - Start the image - `docker run -d \
  --name streamsync-server \
  --network streamsync_backend \
  -p 4000:4000 \
  -e WS_PORT=4000 \
  -e SERVER_ID=streamsync-docker \
  -e REDIS_URL=redis://streamsync_redis:6379 \
  streamsync_backend
`
