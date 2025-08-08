🗂️ File Structure

docker-sync-demo/
│
├── writer/
│   └── Dockerfile
│   └── writer.sh
│
├── reader/
│   └── Dockerfile
│   └── reader.sh
│
└── docker-compose.yml

📝 1. writer/Dockerfile

FROM alpine
WORKDIR /data
COPY writer.sh /writer.sh
RUN chmod +x /writer.sh
CMD ["/writer.sh"]


📝 2. writer/writer.sh

#!/bin/sh
echo "Hello from the writer container at $(date)" >> /data/shared.txt
echo "Writer wrote to /data/shared.txt"
sleep infinity

📝 3. reader/Dockerfile

FROM alpine
WORKDIR /data
COPY reader.sh /reader.sh
RUN chmod +x /reader.sh
CMD ["/reader.sh"]

📝 4. reader/reader.sh

#!/bin/sh
echo "Reader checking /data/shared.txt..."
cat /data/shared.txt || echo "File not found yet."
sleep infinity

⚙️ 5. docker-compose.yml

version: '3'
services:
  writer:
    build: ./writer
    container_name: writer
    volumes:
      - shared-data:/data

  reader:
    build: ./reader
    container_name: reader
    volumes:
      - shared-data:/data

volumes:
  shared-data:
🚀 Build & Test Locally
From inside docker-sync-demo, run:

docker compose up --build

You should see:

writer writes to /data/shared.txt

reader reads from the same file

To test:

docker exec reader cat /data/shared.txt
📦 Push to Docker Hub
docker build -t yourdockerhubusername/writer:latest ./writer
docker build -t yourdockerhubusername/reader:latest ./reader
docker push yourdockerhubusername/writer:latest
docker push yourdockerhubusername/reader:latest
