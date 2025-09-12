# Catálogo de personagens de Rick and Morty 

Este projeto é um aplicativo Flutter para Android e iOS que consome a Rick and Morty API para exibir e filtrar uma lista de personagens da série.

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
Apesar desse projeto ser relativamente curto, ele foi desenvolvido com foco em boas práticas de programação, legibilidade e manutenibilidade. A seguir, cito algumas das escolhas técnicas do projeto.

### Clean Architecture
  - Apesar de ser exigida pelo desafio, a arquitetura limpa é sempre uma boa prática ao se desenvolver projeto, dado o fato de que ela fornece uma divisão clara de camadas e organiza o projeto.

Segue a estrutura principal utilizada na aplicação:
#### domain: 
  - Contém as regras de negócio puras, como entidades e casos de uso (usecases). Esta camada é independente e não conhece o framework.

#### data: 
  - É responsável pela obtenção dos dados, implementando os repositórios definidos na camada de domínio e se comunicando com fontes externas, como a API.

#### presentation: 
  - Lida com a interface do usuário, incluindo a exibição dos dados e a interação com o usuário. A lógica de estado é gerenciada por controladores que se comunicam com a camada de domínio.

<br>

### GetX
  - A escolha do GetX para este projeto se baseou em sua capacidade de oferecer uma solução completa e otimizada para a camada de apresentação, que é onde a maior parte do trabalho acontece em um desafio como este.
  
  - Considerando que o projeto é relativamente simples e o tempo de entrega é um fator importante, o GetX se destacou por estes motivos:
  
  - Simplicidade e produtividade: Ele minimiza a quantidade de código clichê (boilerplate code) necessária para tarefas como gerenciamento de estado e injeção de dependência. Isso nos permite focar diretamente na lógica do negócio e no design do aplicativo, acelerando o desenvolvimento.
  
  - Performance: O GetX foi construído com a performance em mente. Sua abordagem de reatividade granular garante que apenas os widgets que realmente precisam ser atualizados sejam reconstruídos, o que resulta em um aplicativo mais rápido e com menos consumo de recursos.
  
  - Solução integrada: Em vez de usar vários pacotes separados para gerenciamento de estado, injeção e navegação, o GetX oferece um ecossistema coeso. Essa integração simplifica a arquitetura e evita conflitos entre pacotes, facilitando a manutenção do código.
  
  - Em resumo, o GetX foi a escolha ideal porque nos permitiu construir um aplicativo que atende aos requisitos do desafio de forma limpa, organizada e eficiente, sem a complexidade desnecessária que outros pacotes poderiam introduzir.

<br>

## Paginação e Otimização de Performance
  - A Rick and Morty API retorna dados em páginas, com um limite de 20 personagens por requisição. Para buscar os 826 personagens, foi implementado um loop no serviço de dados que percorre todas as páginas da API.
  
  - Na interface, a exibição da lista foi otimizada com o GridView.builder para garantir o lazy loading. Isso significa que as imagens e os dados dos personagens só são carregados quando estão prestes a serem exibidos na tela, prevenindo problemas de performance e de conexão.

<br>

## Componentização
A interface foi dividida em componentes reutilizáveis, como o CharacterGrid e o CharacterCard. Esta abordagem se alinha com o princípio de "responsabilidade única" e torna a interface mais modular, legível e fácil de manter.
