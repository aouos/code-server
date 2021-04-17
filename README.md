# CodeServer_VScode

## Demo Link

😜Experience [VScode](http://vscode.aouos.com) 

---

## Dockerhub

pull image from dockerhub

```bash
docker pull aouos/code-server
```

---

## Docker command

Build image

```bash
docker build --tag <name> .
```

Create and start the container 

```bash
docker run -it -p 8080:8080 --name codesr <name> bash
```

Start code-server

```bash
code-server
```

Start in the background 

```bash
nohup code-server --host 0.0.0.0 --port 8080 --auth none &
```

---

## Build yourself images

In the Dockerfile sibling directory :

```bash
docker-compose up -d
```

---

## Nginx proxy
proxy port 8080

```shell
server {
    listen       80;
    listen  [::]:80;
    server_name  vscode.aouos.com;

    location / {
        proxy_pass   http://127.0.0.1:8080/;
        proxy_set_header Host $host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection upgrade;
        proxy_set_header Accept-Encoding gzip;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```

---
