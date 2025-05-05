# 🎬 Flutter Netflix Clone

A Flutter application that emulates the Netflix user interface, showcasing clean architecture principles and responsive design. This project serves as a foundation for building scalable and maintainable Flutter applications.

---

## 📱 Features

- Home screen displaying a list of movies
- Responsive UI compatible with Android, iOS, and web platforms
- Clean architecture implementation with separation of concerns
- Mocked movie data for demonstration purposes

---

## 🧰 Technologies Used
- [Riverpod](https://riverpod.dev/docs/introduction/getting_started) – State management
- [Flutter Hooks](https://pub.dev/packages/flutter_hooks) – Widget lifecycle management
- [GoRouter](https://pub.dev/packages/go_router) – Routing
- [Freezed](https://pub.dev/packages/freezed) – Data classes
- [Json Serializable](https://pub.dev/packages/json_serializable) – JSON parsing
- [Build Runner](https://pub.dev/packages/build_runner) – Code generation
- [Lottie](https://pub.dev/packages/lottie) –  Adobe After Effects animation

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Dart SDK installed

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/tungvt-it-92/flutter-netflix-clone.git
   cd flutter-netflix-clone
   ```
2. **Install dependencies:**

   ```bash
   flutter pub get
   ```
3. **Generate necessary files:**

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. **Run the application:**

   ```bash
   flutter run
   ```

## 🚀 DEMO
![App demo](demo.gif)

## 🔧 To be continued...
- Improve Home screen
- Implement detail screen  
- Implement watchlist & favorites features
- Improve animations and transitions
- Add video player functionality
- ...