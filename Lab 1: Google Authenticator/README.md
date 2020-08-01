# Laboratório 1: Autenticação do sistema utilizando o Google Authenticator

## Motivação

Configurar o _login_ do sistema para fazer a utilização de autenticação de dois fatores (2FA), utilizando o aplicativo do _Google Authenticator_ (para dispositivos móveis) para salvar e gerenciar o _token_ baseado no tempo e utilizado como segunda etapa de autenticação.

## Equipamentos e Softwares utilizados

Este laboratório foi realizado em um sistema operacional _Ubuntu 20.04_ e o aplicativo do _Google Authenticator_ foi instalado em um celular com sistema operacional _Android 8.1_.


## Execução

### Instalar o módulo do Google Authenticator

Inicialmente deve-se instalar o pacote para o sistema operacional que irá fornecer as bibliotecas dinâmicas que serão carregadas utilizadas pelo PAM ("plugadas" ao PAM) para utilizar o autenticador do _Google_ bem como a aplicação em modo texto que será utilizada para guiar o usuário durante o processo de configuração de um novo _token_. Para tanto deve-se executar o comando:

```
sudo apt-get install libpam-google-authenticator
```

### Configurar o PAM para utilizar o módulo do Google Authenticator

Em seguida, deve-se configurar os arquivos do PAM para que durante o login do sistema seja utilizado o módulo do _Google Authenticator_ instalado na etapa anterior. Os arquivos de configuração do Linux PAM residem no diretório `/etc/pam.d/`, sendo cada arquivo referente à uma determinado aplicação. Ademais, o arquivo `/etc/pam.d/other` contém configurações genéricas que também podem ser utilizadas por aplicações.

A configuração do login do sistema é realizada editando-se o arquivo `/etc/pam.d/common-auth`. Ao final deste arquivo deve-se adicionar uma linha referente à utilizado do módulo do 2FA. O arquivo ficará com o seguinte formato:

```
...
# and here are more per-package modules (the "Additional" block)
session required    pam_unix.so
session optional    pam_systemd.so
# end of pam-auth-update config
auth required pam_google_authenticator.so nullok
```

Importante: Antes de reiniciar a máquina é necessário instalar e configurar o aplicativo do _Google Authenticator_. Se for realizado o _logoff_ agora, não será possível realizar o _login_ na máquina pois a autenticação em duas etapas não foi propriamente configurada.

### Instalar o aplicativo do Google Authenticator

No dispositivo móvel instalar o aplicativo do _Google Authenticator_. Ele pode ser facilmente encontrado nas lojas nativas de aplicativo (_Apple Store_ ou _Google Play Store_).

### Configurar o aplicativo do Google Authenticator

Para configurar o aplicativo, abrir um terminal e executar:

```
google-authenticator
```

Após seguir os passos instruídos pelo programa, a autenticação em dois fatores estará configurada para o usuário em questão. Basta reiniciar a máquina e a autenticação em duas etapas já entrará em ação no próximo _login_.

![Fim](https://media.giphy.com/media/XreQmk7ETCak0/giphy.gif)
