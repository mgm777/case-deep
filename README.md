# Subindo a infraestrutura de uma aplicação no GCP com Terraform

Este repositório contém o código de um pequeno app de lista de tarefas. As instruções para rodar essa aplicação utilizando Docker seguem abaixo. O teste em si está no último item desse README, mas recomendamos que tente rodar a aplicação localmente antes seguindo os passos abaixo.

<!--ts-->
  * [Pré-requisitos](#prerequisites)
  * [Introdução](#introduction)
  * [Passo-a-passo Terraform](#step-by-step)
  * [Passo a passo Workflow](#Workflow)
<!--te-->

### Pré-requisitos<a name="prerequisites"></a>

- Git
- Linux (de preferência, mas não obrigatório)
- Terraform
- Acesso ao GCP
- Cloud CLI - https://cloud.google.com/sdk/docs/install?hl=pt-br

### Introdução<a name="introduction"></a>

A construção da infraestrutura foi estruturada de forma mais automatizada possível utilizando o Terraform, cloud CLI e o Workflow do Github Actions.

## Passo a passo para subir a infraestrutura utilizando o Terraform <a name="step-by-step"></a>

### 1º Baixe o repositório

```
https://github.com/mgm777/case-deep.git

```
---

### 2º Execute o comando para criar o bucket:
 - O bucket será criado na região us-east1.
 - Será habilitado o versionamento no bucket afim de melhor gerenciar o state do terraform.

O objetivo de criar o bucket via gsutil e não utilizando o código do Terraform, é para que quando você execute o Terraform consiga já provisionar o state dentro do bucket sem que aja conflito e não seja necessário nenhuma ação manual para criar pelo console do Google Cloud.
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
---
### 3º Execução do terraform

- Acesse a pasta do terraform 
 ```
 case-deep>terraform
 ```
 - Execute primeiramente o comando <b> ```terraform init``` </b> para iniciar o terraform e baixar as dependências do projeto.
 - Em seguida o execute o comando <b> ```terraform plan``` </b> para verificar a consistência dos arquivos e exibir o que será contruído.
 - O último passo será a execução do comando <b> ```terraform apply``` </b>para aplicar o código e começar a ser orquestrado a construção da infraestrutura.

---

## Estrutura de pastas e arquivos do terraform

```
terraform/
├── main.tf - Arquivo principal onde se encontra o provider e o armazenamento do state.
├── artifact.tf - Arquivo terraform referente ao Artifact Registry para onde são enviadas as imagens após o build.
├── variables.tf - Arquivo terraform para armazenamento das variáveis de todos os demais arquivos.
└── cloudrun.tf - Arquivo terraform referente ao serviço de Cloud Run que são os containers onde são hospedados as aplicações.
```

 ## Diagrama de execução do Terraform 

```mermaid
graph TD;
    A[terraform init] -->|iniciando o terraform e dependências | B[terraform plan]
    B -->|Verificando a consistência dos arquivos
    Exibindo o planejamento da criação da infraestrutura| C[terraform apply]
    C -->|Aplicando a criação da infraestrutura| D[Infraestrutura Construída]


```

### Para utilização do Workflow<a name="Workflow"></a>

Criar uma conta de serviço no GCP com as seguintes permissões:
  - Administrador de objeto do Storage
  - Administrador do Artifact Registry
  - Administrador do Cloud Run
  - Administrador do Storage
  - Editor

2º Iremos exportar a chave em formato JSON da conta de serviço pois iremos utilizá-la posteriormente.

3º Para configurar as suas secrets dentro do Github acesse:




```
https://github.com/<seu-user>/<seu-repo>/settings/actions

```


