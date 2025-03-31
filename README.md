# Teste 1 - Web Scraping

## Descrição
Este projeto realiza Web Scraping no site da ANS para baixar os arquivos PDF "Anexo I" e "Anexo II". Os arquivos são armazenados localmente e compactados em um arquivo ZIP para facilitar o download e armazenamento.

## Funcionalidades
- Acessa a página da ANS e localiza os links dos PDFs desejados.
- Faz o download dos arquivos "Anexo I" e "Anexo II".
- Compacta os arquivos baixados em um único ZIP.

## Tecnologias Utilizadas
- **Java 21**
- **JSoup** (para Web Scraping)
- **Java NIO e Streams** (para manipulação de arquivos)
- **ZIPOutputStream** (para compactação dos arquivos)

## Como Executar
1. Clone o repositório ou copie o código para um projeto local.
2. Execute a classe `Main.java`.
3. Os arquivos serão salvos na pasta `downloads/`, dentro do arquivo `anexos.zip`.
4. Não esqueça de excluir a pasta downloads para rodar o código

## Estrutura do Projeto
```
projeto/
├── src/
│   ├── com/
│   │   ├── teste/
│   │   │   ├── nivelamento/
│   │   │   │   ├── WebScraping/
|   |   |   |   |  ├── Main.java
├── downloads/
│   ├── anexos.zip
└── README.md
```

## Autor
Michael 
