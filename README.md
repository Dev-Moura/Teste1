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


# Teste 2 - Extração de Dados do PDF

## Descrição
Este projeto realiza a extração de dados da tabela "Rol de Procedimentos e Eventos em Saúde" do PDF "Anexo I" e converte os dados para um arquivo CSV. O arquivo gerado é então compactado em um ZIP para facilitar o armazenamento e compartilhamento.

## Funcionalidades
- Extrai os dados do PDF Anexo I.
- Processa os dados e salva em um arquivo CSV.
- Substitui as abreviações OD e AMB por seus significados completos.
- Compacta o CSV em um arquivo ZIP.

## Tecnologias Utilizadas
- **Java 21**
- **Apache PDFBox** (para extração de texto do PDF)
- **Java NIO e Streams** (para manipulação de arquivos)
- **ZIPOutputStream** (para compactação do CSV)

## Como Executar
1. Clone o repositório ou copie o código para um projeto local.
2. Adicione a dependência do Apache PDFBox ao seu projeto (caso use Maven, veja abaixo).
3. Execute a classe `ExtracaoPDF.java`.
4. O CSV gerado estará dentro do diretório `downloads` na pasta `Teste_Michael.zip`.

### Dependência Maven
Adiciona a dependencia no `pom.xml`:

```
<dependency>
    <groupId>org.apache.pdfbox</groupId>
    <artifactId>pdfbox</artifactId>
    <version>2.0.30</version>
</dependency>
```

## Estrutura do Projeto
```
projeto/
├── src/
│   ├── com/
│   │   ├── teste/
│   │   │   ├── nivelamento/
│   │   │   │   ├── Extracao/
|   |   |   |   |  ├── Extrair.java
├── downloads/
│   ├── anexos
|   |   ├── Anexo_I..pdf
│   ├── Teste_Michael.zip
|   |   ├── Rol_Procedimentos.csv
└── README.md
```
