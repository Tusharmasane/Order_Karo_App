<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12,14,18&height=220&section=header&text=OrderKaro&fontSize=72&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=Food%20ordering%20app%20built%20with%20Flutter&descSize=20&descAlignY=60" alt="OrderKaro banner"/>

<a href="https://github.com/Tusharmasane/Order_Karo_App">
  <img src="https://readme-typing-svg.demolab.com?font=Poppins&weight=600&size=22&duration=3000&pause=1000&color=FF5252&center=true&vCenter=true&width=620&lines=Order+food+in+just+a+few+taps+%F0%9F%8D%94;Browse+restaurants+%7C+Fill+cart+%7C+Checkout+%F0%9F%9B%92;Built+with+Flutter+%26+Dart+%F0%9F%92%99" alt="Typing animation"/>
</a>

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)](https://www.android.com)
[![Material 3](https://img.shields.io/badge/UI-Material%203-FF5252)](https://m3.material.io)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

[![Stars](https://img.shields.io/github/stars/Tusharmasane/Order_Karo_App?style=social)](https://github.com/Tusharmasane/Order_Karo_App/stargazers)
[![Forks](https://img.shields.io/github/forks/Tusharmasane/Order_Karo_App?style=social)](https://github.com/Tusharmasane/Order_Karo_App/network/members)
[![Issues](https://img.shields.io/github/issues/Tusharmasane/Order_Karo_App)](https://github.com/Tusharmasane/Order_Karo_App/issues)

*Discover restaurants, browse categories, fill your cart and check out — all in a few taps.*

</div>

---

## 📖 Table of Contents

- [About the Project](#-about-the-project)
- [Screenshots](#-screenshots)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Build the APK](#-build-the-apk)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [Author](#-author)
- [License](#-license)

---

## 🚀 About the Project

**OrderKaro** ("Order Karo" – *place your order*) is an Android food ordering app developed with **Flutter** and **Dart**. It offers a clean, soft-themed Material 3 interface where users can sign up with just a phone number, explore restaurants in their city, add dishes to the cart and proceed to checkout.

---

## 📸 Screenshots

| Register | Login |
|:---:|:---:|
| <img src="screenshots/register.png" width="260" alt="Register screen"/> | <img src="screenshots/login.png" width="260" alt="Login screen"/> |
| **Create your account** with name, phone & optional email | **Quick login** using your phone number |

| Home | Cart |
|:---:|:---:|
| <img src="screenshots/home.png" width="260" alt="Home screen"/> | <img src="screenshots/cart.png" width="260" alt="Cart screen"/> |
| **Browse categories** and nearby restaurants | **Review your order** and checkout |

---

## 🎬 App Demo

<div align="center">

<img src="screenshots/demo.gif" width="270" alt="OrderKaro app demo"/>

*Register → Login → Browse restaurants → Add to cart → Checkout*

</div>

---

## ✨ Features

- 🔐 **Phone-based authentication** – Register and log in with your phone number
- 👤 **Simple sign-up** – Full name, phone number and optional email
- 📍 **Delivery location** – Shows the current delivery area at the top of the home screen
- 🥗 **Food categories** – Veg, Non-Veg, Breakfast, Desserts and more (horizontally scrollable)
- 🏪 **Restaurant listing** – Cards with image, name, rating ⭐, area and estimated delivery time
- 🛒 **Cart** – Item-wise quantity, price and automatic total calculation
- 💳 **Checkout** – One-tap checkout button
- 🔔 **Snackbar feedback** – "Item added to cart" with a *View Cart* shortcut
- 🧭 **Bottom navigation** – Home, Orders, Profile and Settings
- 🎨 **Material 3 design** – Soft pastel theme with rounded cards and a smooth UI

---

## 🛠️ Tech Stack

<p align="center">
  <img src="https://skillicons.dev/icons?i=flutter,dart,androidstudio,vscode,git,github" alt="Tech stack icons"/>
</p>

| Layer | Technology |
|---|---|
| Framework | [Flutter](https://flutter.dev) |
| Language | [Dart](https://dart.dev) |
| UI | Material 3, custom theme, Poppins-style typography |
| Platform | Android |
| IDE | VS Code / Android Studio |
| Version Control | Git & GitHub |

---

## 📂 Project Structure

```
Order_Karo_App/
├── android/              # Android native project
├── ios/                  # iOS native project (Flutter default)
├── linux/                # Linux desktop runner (Flutter default)
├── macos/                # macOS desktop runner (Flutter default)
├── windows/              # Windows desktop runner (Flutter default)
├── web/                  # Web runner (Flutter default)
├── assets/               # Images, fonts and other static files
├── lib/                  # Main Dart source code
│   └── main.dart         # App entry point
├── test/                 # Unit & widget tests
├── screenshots/          # README screenshots
├── analysis_options.yaml # Dart linter rules
├── pubspec.yaml          # Dependencies & asset configuration
├── pubspec.lock          # Locked dependency versions
├── .gitignore
└── README.md
```

---

## ⚙️ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- Android Studio or VS Code with the Flutter & Dart extensions
- An Android emulator or a physical device with USB debugging enabled

Check your setup:

```bash
flutter doctor
```

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/Tusharmasane/Order_Karo_App.git
   cd Order_Karo_App
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

---

## 📦 Build the APK

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release
```

The APK will be generated at:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 🗺️ Roadmap

- [x] Register & Login screens
- [x] Home with categories and restaurant list
- [x] Cart with total calculation
- [ ] Restaurant detail & menu page
- [ ] Order history (Orders tab)
- [ ] Profile & Settings
- [ ] OTP verification
- [ ] Online payment integration
- [ ] Live order tracking
- [ ] Dark mode

---

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/AmazingFeature`
3. Commit your changes: `git commit -m "Add some AmazingFeature"`
4. Push to the branch: `git push origin feature/AmazingFeature`
5. Open a Pull Request

You can also check the [issues page](https://github.com/Tusharmasane/Order_Karo_App/issues).

---

## 👨‍💻 Author

**Tushar Masane**

- GitHub: [@Tusharmasane](https://github.com/Tusharmasane)
- Email: [tushar.masane2001@gmail.com](mailto:tushar.masane2001@gmail.com)
- Repository: [Order_Karo_App](https://github.com/Tusharmasane/Order_Karo_App)

---

## 📄 License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.

---

<div align="center">

⭐ If you like this project, please give it a star! ⭐

Made with ❤️ using Flutter

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12,14,18&height=120&section=footer" alt="footer wave"/>

</div>
