## Teste Técnico Cloud Engineer

Este repositório contém o código de um pequeno app de lista de tarefas. As instruções para rodar essa aplicação utilizando Docker seguem abaixo. O teste em si está no último item desse README, mas recomendamos que tente rodar a aplicação localmente antes seguindo os passos abaixo.

<!--ts-->
  * [Pré-requisitos](#prerequisites)
  * [Build local](#build)
  * [Deploy local](#deploy)
  * [Teste técnico](#test)
<!--te-->

### Pré-requisitos<a name="prerequisites"></a>

- Docker
- Linux (de preferência, mas não obrigatório)

### Build local<a name="build"></a>

Para você se familiarizar com a aplicação, utilizamos Docker para simplificar o build e deploy do frontend e backend na sua máquina. A partir do seu terminal, execute os seguintes comandos:

```bash
cd cloud-engineer-test-app
```

```bash
docker build -t teste-backend -f Dockerfile.backend ./backend
```

```bash
docker build -t teste-frontend -f Dockerfile.frontend ./frontend
``` 

### Deploy local<a name="deploy"></a>

```bash
docker run -d -p5500:5500 teste-backend
```

```bash
docker run -d -p3000:3000 teste-frontend
``` 

Para verificar se deu certo, rode o comando `docker ps`. Resultado deve ser parecido com esse:

```bash
❯ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS          PORTS                                       NAMES
6ac59bbf1ffb   teste-backend    "docker-entrypoint.s…"   20 minutes ago   Up 20 minutes   0.0.0.0:5500->5500/tcp, :::5500->5500/tcp   hardcore_mccarthy
730c6eabc5cd   teste-frontend   "docker-entrypoint.s…"   23 minutes ago   Up 23 minutes   0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   wizardly_pasteur
```

No seu navegador, acesse `http://localhost:3000`, você deverá visualizar a seguinte tela:

<p align="center">
  <a href="http://deepesg.com/" target="blank"><img src="https://snipboard.io/tnBXDd.jpg" /></a>
</p>

### Teste Técnico<a name="test"></a>

Feito o deploy da aplicação, siga as instruções do PDF enviado para execução do teste técnico. Lembrando que apenas a primeira atividade é obrigatória.
