# ECOmapa

O ECOmapa é um aplicativo desenvolvido para facilitar a localização de pontos sustentáveis, como locais de reciclagem, coleta seletiva e iniciativas ecológicas.

O objetivo do projeto é incentivar práticas sustentáveis, conectando usuários a serviços ambientais próximos.

---

## 📱 Funcionalidades

- Visualização de locais sustentáveis
- Busca de pontos no mapa
- Interface simples e intuitiva

---

## 🛠️ Tecnologias Utilizadas

- Flutter
- Dart

---

## 📁 Estrutura do Projeto

A estrutura do projeto segue o padrão de aplicações Flutter:

ECOmapa/
├── android/        → Configurações para Android  
├── ios/            → Configurações para iOS  
├── web/            → Versão web do app  
├── windows/        → Versão desktop  
├── lib/            → Código principal da aplicação  
│   └── main.dart   → Ponto de entrada do app  
├── test/           → Testes automatizados  
├── pubspec.yaml    → Dependências e configurações  
└── README.md       → Documentação do projeto  

---

## 🧩 Organização do Código

O diretório `lib/` contém toda a lógica da aplicação.  
Ele pode ser organizado da seguinte forma:

lib/
├── screens/   → Telas do aplicativo  
├── widgets/   → Componentes reutilizáveis  
├── models/    → Estruturas de dados  
├── services/  → Regras de negócio e APIs  
└── main.dart  → Inicialização do app  

---

## ▶️ Como executar o projeto

```bash
git clone https://github.com/karloslemes34-max/ECOmapa.git
cd ECOmapa
flutter pub get
flutter run
