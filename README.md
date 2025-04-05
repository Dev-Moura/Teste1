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

# Teste 3 — Análise de Despesas das Operadoras de Saúde

Este projeto tem como objetivo importar, tratar e analisar os dados financeiros das operadoras de saúde suplementar, utilizando PostgreSQL e dados disponibilizados pela ANS (Agência Nacional de Saúde Suplementar).

## 🗂️ Dados Utilizados

- **Demonstrativos Contábeis Trimestrais**
  - Arquivo: `1T2024.csv`, `4T2024.csv`, etc.
  - Campos: `data`, `cd_conta_contabil`, `cd_operadora`, `ds_conta_contabil`, `vl_saldo_final`, `vl_saldo_anterior`

- **Cadastro de Operadoras Ativas**
  - Arquivo: `Relatorio_cadop.csv`
  - Campos: `registro_ans`, `razao_social`, `nome_fantasia`, `cnpj`, `endereço`, `contato`, entre outros


## 🛠️ Estrutura do Banco de Dados



#  Teste 4  Busca de Operadoras de Saúde - Vue.js + Flask

Este projeto implementa uma interface web para realizar buscas textuais em uma base de operadoras de saúde usando **Vue 3 com TypeScript** no frontend e **Flask (Python)** no backend. A busca é feita em um arquivo CSV carregado previamente.

---

## 📦 Tecnologias Utilizadas

### Frontend
- [Vue 3](https://vuejs.org/)
- [TypeScript](https://www.typescriptlang.org/)
- [Axios](https://axios-http.com/)

### Backend
- [Flask](https://flask.palletsprojects.com/)
- [Pandas](https://pandas.pydata.org/)
- [Flask-CORS](https://flask-cors.readthedocs.io/)

---

## 📁 Estrutura do Projeto

```
projeto-busca-operadoras/
├── backend/
│   ├── app.py
│   └── operadoras.csv
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   └── Search.vue
│   │   └── App.vue
│   └── vite.config.ts
│
├── README.md
└── postman_collection.json
```

---

## ▶️ Como Executar o Projeto

### 🔧 Backend (Flask)

1. Navegue até a pasta `backend/`:

   ```bash
   cd backend
   ```

2. Instale as dependências:

   ```bash
   pip install flask pandas flask-cors
   ```

3. Inicie o servidor:

   ```bash
   python app.py
   ```

> ⚠️ O arquivo `operadoras.csv` deve estar na mesma pasta que `app.py`.

---

### 💻 Frontend (Vue 3 + TypeScript)

1. Navegue até a pasta `frontend/`:

   ```bash
   cd frontend
   ```

2. Instale as dependências:

   ```bash
   npm install
   ```

3. Inicie o servidor:

   ```bash
   npm run dev
   ```

---

## 🌐 Endpoint da API

| Método | Rota         | Descrição                         |
|--------|--------------|-----------------------------------|
| GET    | `/search`    | Busca textual por operadoras.     |

### Exemplo de Requisição:

```http
GET http://localhost:5000/search?query=amil
```

### Exemplo de Resposta:

```json
[
  {
    "registro_ans": 12345,
    "razao_social": "AMIL ASSISTÊNCIA MÉDICA INTERNACIONAL",
    "nome_fantasia": "AMIL"
  }
]
```

---

## 📬 Coleção Postman

Uma coleção pronta para testar a API está no arquivo:

```
postman_collection.json
```

Você pode importar no Postman diretamente para testar a busca.

---

## 🛠️ Melhorias Futuras

- Paginação dos resultados.
- Filtro por cidade, estado ou CNPJ.
- Upload do CSV via frontend.

---

### Autor
[<img loading="lazy" src="https://avatars.githubusercontent.com/u/113400472?v=4&size=320" width=115><br><sub>Michael Moura</sub>](https://github.com/Dev-Moura/Dev-Moura)



