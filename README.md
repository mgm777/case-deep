## Subindo a infraestrutura de uma aplicação no GCP

Este repositório contém o código de um pequeno app de lista de tarefas. As instruções para rodar essa aplicação utilizando Docker seguem abaixo. O teste em si está no último item desse README, mas recomendamos que tente rodar a aplicação localmente antes seguindo os passos abaixo.

<!--ts-->
  * [Pré-requisitos](#prerequisites)
  * [Introdução](#introduction)
  * [Passo-a-passo](#step-by-step)
  * [Workflow](#Workflow)
<!--te-->

### Pré-requisitos<a name="prerequisites"></a>

- Git
- Linux (de preferência, mas não obrigatório)
- Terraform
- Acesso ao GCP
- Cloud CLI - https://cloud.google.com/sdk/docs/install?hl=pt-br

### Introdução<a name="introduction"></a>

A construção da infraestrutura foi estruturada de forma mais automatizada possível utilizando o Terraform e o Workflow do Github Actions.

### Passo a passo<a name="step-by-step"></a>

1º Baixe o repositório

2º Execute o comando para criar o bucket:
 - O bucket será criado na região us-east1
 - será habilitado o versionamento no mesmo

```
if ! gsutil ls -b gs://deep-infra; then
  gsutil mb -l us-east1 gs://deep-infra
  gsutil versioning set on gs://deep-infra
  echo "Bucket created and versioning enabled."
else
  echo "Bucket already exists. Enabling versioning."
  gsutil versioning set on gs://deep-infra
fi
```

 criar uma conta de serviço no GCP com as seguintes permissões:
  - Administrador de objeto do Storage
  - Administrador do Artifact Registry
  - Administrador do Cloud Run
  - Administrador do Storage
  - Editor

  *Não utilizei tanto o princípio de granularidade para aplicação das roles

2º Iremos exportar a chave em formato JSON da conta de serviço pois iremos utilizá-la posteriormente.


### Para utilização do Workflow<a name="Workflow"></a>

Feito o deploy da aplicação, siga as instruções do PDF enviado para execução do teste técnico. Lembrando que apenas a primeira atividade é obrigatória.
