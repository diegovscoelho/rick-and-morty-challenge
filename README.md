# Catálogo de personagens de Rick and Morty 

Este projeto é um aplicativo Flutter para Android e iOS que consome a Rick and Morty API para exibir e filtrar uma lista de personagens da série. Ao clicar no card de um personagem, é possível acessar uma tela de detalhes com mais informações.

<br>

## Como rodar o aplicativo?
Para rodar o projeto, siga as instruções abaixo.


### Pré-requisitos
Certifique-se de que você tem o Flutter SDK e um editor de código (como VS Code ou Android Studio) instalados e configurados.

1. Clonar o repositório:
   
    Abra seu terminal ou prompt de comando e clone o repositório do projeto:
    ```sh
    git clone https://github.com/diegovscoelho/rick-and-morty-challenge
    ```
3. Acessar a pasta em que o repositório foi clonado:

    Navegue até a pasta do projeto:
    ```sh
    cd rick-and-morty-challenge
    ```
4. Instalar as dependências:
   
    Execute o comando a seguir para instalar todos os pacotes necessários:
    ```sh
    flutter pub get
    ```
6. Rodar o aplicativo:
   
    Conecte um dispositivo físico ou inicie um emulador/simulador e execute o app com o comando:
    ```sh
    flutter run
    ```

<br>

## Escolhas técnicas
Optei por utilizar o inglês para a linguagem da aplicação por conta da variedade de espécies, gêneros e localidades existentes na série. A API retorna todas elas em inglês.

Apesar desse projeto ser relativamente curto, ele foi desenvolvido com foco em boas práticas de programação, legibilidade e manutenibilidade. A seguir, cito algumas das escolhas técnicas do projeto.

### Clean Architecture
  - Apesar de ser exigida pelo desafio, a arquitetura limpa é sempre uma boa prática ao se desenvolver um projeto, dado o fato de que ela fornece uma divisão clara de camadas e organiza o projeto.

Segue a estrutura principal utilizada na aplicação:
- **`domain`**: Contém as regras de negócio puras, como entidades e casos de uso (usecases). Esta camada é independente e não conhece o framework.

- **`data`**: É responsável pela obtenção dos dados, implementando os repositórios definidos na camada de domínio e se comunicando com fontes externas, como a API.

- **`presentation`**: Lida com a interface do usuário, incluindo a exibição dos dados e a interação com o usuário. A lógica de estado é gerenciada por controladores que se comunicam com a camada de domínio.

#### Camadas Auxiliares
- **`core`**: Esta camada contém utilitários e extensões de código que não pertencem a nenhuma camada específica, como a extensão de string para capitalizar a primeira letra. Ela é independente e pode ser usada por todas as outras camadas.
- **`bindings`**: No contexto do GetX, a camada de `bindings` é responsável por injetar as dependências que a camada de `presentation` precisa, como os `controllers` e os `usecases`. Isso garante que os componentes sejam criados de forma eficiente e com todas as dependências necessárias, sem acoplar a lógica de negócio à interface.

<br>

### GetX
  - A escolha do GetX para este projeto se baseou em sua capacidade de oferecer uma solução completa e otimizada para a camada de apresentação, que é onde a maior parte do trabalho acontece em um desafio como este.
  
  - Considerando que o projeto é relativamente simples e o tempo de entrega é um fator importante, o GetX se destacou por estes motivos:
  
     - Simplicidade e produtividade: Ele minimiza a quantidade de código necessária para tarefas como gerenciamento de estado e injeção de dependência. Isso nos permite focar diretamente na lógica do negócio e no design do aplicativo, acelerando o desenvolvimento.
     
     - Solução integrada: Em vez de usar vários pacotes separados para gerenciamento de estado, injeção e navegação, o GetX oferece um ecossistema próprio que funciona como uma espécie da canivete suiço, de forma a facilitar a organização e o desenvolvimento do projeto.
     
     - Em resumo, o GetX foi a escolha ideal porque nos permitiu construir um aplicativo que atende aos requisitos do desafio de forma limpa, organizada e eficiente, sem a complexidade desnecessária que outros pacotes poderiam introduzir.

<br>
