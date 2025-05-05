
# 📈 Assistente de Negócios

**Autor:** Victor Hugo das Neves de Jesus

Aplicativo Flutter que fornece **análises de mercado inteligentes e sugestões de estratégias de negócios**.  
Utiliza um LLM (Google Gemini 1.5 Pro) para interpretar dados fornecidos pelo usuário e oferecer insights personalizados.  
O app permite conversas contínuas, ou seja, você pode ir complementando informações e o assistente irá adaptar suas sugestões.

---

## 📱 Imagens do aplicativo


![Home](screenshots/home_screen.png)
![Análise](screenshots/analysis_screen.png)

---

## 🚀 Tecnologias utilizadas

- **Flutter (Dart)** → Aplicativo mobile
- **Gemini API (Google AI)** → LLM para análise e geração de estratégias
- **HTTP package** → Comunicação com a API
- **Material Design + Dark Theme** → Interface moderna e confortável para o usuário

---

## 📦 Instruções de instalação e execução

1. Clone o projeto:

```bash
git clone https://github.com/victorhnj/app_assit_negocio.git
cd app_assit_negocio
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Insira sua API Key do Gemini no arquivo:

```
lib/services/gemini_service.dart
```

4. Rode no emulador ou celular:

```bash
flutter run
```

---

## 🧠 Como o LLM (Gemini) foi utilizado

O aplicativo faz integração com a API do **Google Gemini (1.5 Pro)** para gerar sugestões e estratégias de negócios baseadas no que o usuário descreve.

Funcionalidades do LLM:

- Geração de sugestões personalizadas com base nos dados da empresa, localização e público-alvo.
- Suporte a **conversas contínuas**: o usuário pode ir completando a análise e o assistente ajusta as respostas.
- Linguagem natural e adaptativa para negócios.

---

## 📌 Sobre o projeto

Este aplicativo foi desenvolvido para fins acadêmicos, com foco em:

✅ Interfaces móveis organizadas e acessíveis  
✅ Integração de IA para geração de conteúdo  
✅ Experiência do usuário fluida com análise contínua

---
