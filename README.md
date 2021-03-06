# LataVelhaInc. (Site de compra e venda de carros)

### Dependências ###
- mysql
- tomcat http://tomcat.apache.org

### Antes de executar ###
Acesse o arquivo GenericDAO.java localizado em:
```
CompraVendaCarros/src/main/java/br/ufscar/dc/dsw/dao/GenericDAO.java
```
e na linha 20, coloque seu usuário e senha do MYSQL, nos segundo e terceiro parâmetros, respectivamente.

O site foi previamente povoado com alguns exemplos de clientes e lojas, sendo eles:
- cliente1
  - Senha: cliente1
  - Login: cliente1@gmail.com
- cliente2        
  - Senha: cliente2        
  - Login: cliente2@gmail.com
- loja1           
  - Senha: loja1           
  - Login: loja1@gmail.com
- loja2           
  - Senha: loja2           
  - Login: loja2@gmail.com
- loja3           
  - Senha: loja3           
  - Login: loja3@gmail.com
- admin           
  - Senha: admin           
  - Login: admin

além também de alguns carros e propostas.
Para adicioná-los, dentro da raiz do projeto, acesse o mysql com o seguinte comando:

```
mysql -uroot -p
```

E então execute:

```
source CompraVendaCarros/db/MySQL/create.sql;
```
```
quit
```

### Para executar ###
1. Inicie o tomcat ```./catalina.sh``` que se encontra dentro da pasta bin no diretório de instalação do tomcat
2. Clone ou baixe o repositório https://github.com/VLx2000/compra-venda-veiculos-web.git
3. Acesse a pasta **CompraVendaCarros/**
4. Execute ```./mvnw tomcat7:redeploy```
5. Em um navegador acesse http://localhost:8080/CompraVendaCarros/
6. E, por fim, compre seu Corsa turbinado ou Uno com escada!

#### Envio de email ####
Para testar o envio de email acesse o arquivo EmailService.java localizado em
```
CompraVendaCarros/src/main/java/br/ufscar/dc/dsw/util/EmailService.java
```
e adicione sua senha e usuário do https://mailtrap.io/ nos parâmetros da linha 42.
Então, se logue como loja e envie uma mensagem para alguma proposta em aberto.

### Integrantes ###

- Lucas Vinícius Domingues 769699
- Rafael Yoshio Yamawaki Murata 769681
- Victor Luís Aguilar Antunes 769734

Arquivo com a separação dos requisitos:
[Checklist](checklist.md)

Documento de requisitos:
[Requisitos](Requisitos-A1.pdf)
