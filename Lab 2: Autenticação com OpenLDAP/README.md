# Desenvolvimento e autenticação utilizando servidor OpenLDAP

## Motivação

Escrever uma aplicação em linguagem C que realiza a autenticação de um usuário utilizando-se a biblioteca dinâmica do PAM. Configurar os módulos do PAM ("plugar" os módulos) para que seja possível autenticar na aplicação utilizando tanto usuários do sistema quanto usuários salvos em um servidor _OpenLDAP_. Como tarefa complementar deste laboratório, instalar e configurar um diretório de usuários simples utilizando o _OpenLDAP_.

## Equipamentos e Softwares utilizados

O orquestrador de contêineres _Docker_ foi utilizado neste laboratório. Um contêiner foi criado pela equipe utilizando sistema operacional _Arch Linux_ e utilizado como servidor para o _OpenLDAP_. Outro contêiner pronto foi utilizado para prover o _phpLDAPadmin_, uma interface gráfica para o servidor _OpenLDAP_. A aplicação principal foi executada no sistema operacional nativo e foi utilizado para essa prática o sistema _Arch Linux_.

## Implementações da equipe

Seguindo o _template_ fornecido com a documentação do Linux PAM, foi implementada uma aplicação em linguagem C que realiza a autenticação do usuário do sistema utilizando o PAM. Para tanto, a aplicação importa a biblioteca do PAM e chama os módulos referentes ao processo de `"system-auth"`. **LINKAR ARQUIVO AQUI**

Além disso, foi configurado um contêiner pela equipe (também seguindo documentação de referência) para atuar como servidor de diretórios. **LINKAR ARQUIVO AQUI**.

## Execução

### Preparar o contêiner com o servidor OpenLDAP

Entrar na pasta do contêiner configurado pela equipe e utilizar o _Docker_ para "montar" o contêiner.

```
cd OpenLDAP-Container/
sudo docker build --tag archlinux_ldap:1.0
```

### Preparar o contêiner com o front-end phpLDAPadmin para o OpenLDAP

Inicialmente, deve-se procurar o IP da máquina que estará acessando o _front-end_ e salvar este dado. Uma posível forma de consultar é através do comando:

```
ip route get 1 | cut -d' ' -f7
```

Em seguida, deve-se executar o seguinte comando para baixar o contêiner pronto da interface _phpLDAPadmin_, substituindo-se `MACHINEIP` pelo IP observado anteriormente:

```
sudo docker run -p 6443:443 \
        --env PHPLDAPADMIN_LDAP_HOSTS=MACHINEIP \
        --detach osixia/phpldapadmin:0.9.0
```

### Executar os contêineres preparados

Buscar o ID dos contêineres preparados para o laboratório com o comando:

```
sudo docker ps -a
```

Em seguida, colocar os contêineres em execução (substituir `ID1` e `ID2` pelos IDs dos respectivos contêineres):

```
sudo docker run ID1
sudo docker run ID2
```


### Entrar na interface phpLDAPadmin e criar um usuário

...

### Configurar o cliente OpenLDAP na máquina para encontrar os usuários do servidor

...

### "Plugar" os módulos do LDAP no Linux PAM

...

### Compilar a aplicação em C

Utilizando o compilador `gcc` é possível compilar a aplicação de autenticação utilizando-se o comando:

```
gcc -o pamtest pamtest.c -lpam -lpam_misc
```

### Executar e verificar o funcionamento

Para executar a aplicação basta:

```
./pamtest
```

Teste a aplicação e perceba como é possível realizar a autenticação tanto com usuários da máquina quando com usuários criados no servidor OpenLDAP.

![Fim](https://media.giphy.com/media/XreQmk7ETCak0/giphy.gif)
