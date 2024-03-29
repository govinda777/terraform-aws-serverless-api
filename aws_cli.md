# Configuração da AWS CLI em Mac

Este guia passo a passo ajudará você a configurar a AWS CLI em sua máquina Mac.

## Pré-requisitos

- Acesso a uma máquina Mac com acesso a internet.
- [Homebrew](https://brew.sh) instalado em seu Mac (para instalar AWS CLI).
- Credenciais de acesso à AWS (AWS Access Key ID e AWS Secret Access Key).

## Passo 1: Instalação do AWS CLI

1. Abra o Terminal em seu Mac.

2. Instale o AWS CLI usando Homebrew com o comando:

   ```bash
   brew install awscli
   ```

3. Verifique a instalação executando:

   ```bash
   aws --version
   ```

   A saída mostrará a versão do AWS CLI instalada.

## Passo 2: Configuração de Credenciais AWS

1. Abra o Terminal.

2. Execute o comando `aws configure`. Ele iniciará o processo de configuração:

   ```bash
   aws configure
   ```

3. Quando solicitado, insira as seguintes informações:
   - `AWS Access Key ID`: Sua chave de acesso.
   - `AWS Secret Access Key`: Sua chave secreta de acesso.
   - `Default region name`: Sua região padrão (por exemplo, `us-east-1`).
   - `Default output format`: Formato de saída (por exemplo, `json`).

   Exemplo:

   ```
   AWS Access Key ID [None]: SUACHAVEDEACESSO
   AWS Secret Access Key [None]: SUACHAVESECRETA
   Default region name [None]: us-east-2
   Default output format [None]: json
   ```

Após completar esses passos, sua AWS CLI estará configurada e pronta para ser usada em sua máquina Mac.
