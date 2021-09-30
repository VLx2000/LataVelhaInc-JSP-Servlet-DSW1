# LataVelhaInc. (Site de compra e venda de carros)

![Página Inicial](/CompraVendaCarros/src/main/webapp/imagens/TelaInicial.png "Página Inicial")

### Dependências ###
- mysql
- tomcat

### Antes de executar ###
Acesse o arquivo GenericDAO.java localizado em:
```
CompraVendaCarros/src/main/java/br/ufscar/dc/dsw/dao/GenericDAO.java
```
e na linha 20, coloque seu usuário e senha do MYSQL, nos segundo e terceiro parâmetros, respectivamente.

O site foi previamente povoado com alguns exemplos de clientes e lojas, sendo elas:
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
Para adicioná-los, dentro da pasta do projeto, acesse o mysql com o seguinte comando:

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
2. Clone ou baixe repositório https://github.com/VLx2000/compra-venda-veiculos-web.git
3. Acesse a pasta **CompraVendaCarros/**
4. Execute ```./mvnw tomcat7:redeploy```
5. Em um navegador acesse http://localhost:8080/CompraVendaCarros/
6. E, por fim, compre seu Corsa turbinado ou Uno com escada!
