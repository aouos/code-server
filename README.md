# Docker

Front-end development environment setup

---

## Images infomaiton

- git version `2.25.1`

- nodejs version `14.15.1`

- npm version `6.14.8`

- nrm use `taobao`

---

## Dockerhub

```bash
docker pull aouos/aofe
```
---

## Build yourself images

- In Dockerfile, uncomment necessary or add instructions that you need to install

- In the shell folder, You can configure Git information in gitic nad write your own script to add to the command

- In the Dockerfile sibling directory, `docker built -t < name > .`