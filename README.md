# 🎵 Music Store App

## 🧠 Brief Description

**Music Store App** is a Flutter-based mobile application that showcases a modern and interactive interface for exploring musical instruments and gear.  
Users can browse categories such as synthesizers, DJ mixers, turntables, vinyl albums, and studio equipment — and add their favorite items to the cart.

---

## 🧩 Main Widgets Description

- **`HomePage`** 🏠 – Displays the main screen with categories like albums, instruments, and accessories.
- **`DonutTab`** 🎹 – Displays a product tab (in this version used to show music-related items such as synthesizers or albums).
- **`DonutTile`** 🧱 – A reusable widget that displays each item’s image, name, price, and “add to cart” button.
- **`CartPage`** 🛒 – Displays selected items, their quantities, and the total price.
- **`MyTab`** 🗂️ – A custom tab controller used to navigate between different product categories.

---

## 💻 Technologies Used

- **Flutter** (Dart SDK)
- **Material Design**
- **Google Fonts**
- **Provider** for state management (optional)

---

## 🗂️ Project Structure

```
lib/
├── icons/ # App icons and vector assets
├── images/ # Product and UI images
├── screens/
│ └── home_page.dart # Main home screen with category navigation
├── tab/
│ ├── burguer_tab.dart # Category tab (e.g., dj controller)
│ ├── donut_tab.dart # Category tab (e.g., albums)
│ ├── pancake_tab.dart # Category tab (e.g., turntable)
│ ├── pizza_tab.dart # Category tab (e.g., keyboard)
│ └── smoothie_tab.dart # Category tab (e.g., synthesizers)
├── utils/
│ ├── donut_tile.dart # Widget displaying item info
│ └── my_tab.dart # Widget for tab design
├── video/
│ └── demo.gif # Demo GIF of the app
├── cart_page.dart # Shopping cart page
├── login_page.dart # Login screen
└── main.dart # App entry point

```

---

## 🎥 Demo

![Demo GIF](lib/video/demo.gif)

---

## 📚 Course Information

**Subject:** Mobile Applications Development
**Teacher:** [RODRIGO FIDEL GAXIOLA SOSA]

---

## 🎨 Design Credits

Original design inspired by [App UI on Dribbble](https://dribbble.com/shots/19649140-App-UI) by [Dstudio](https://dribbble.com/Dstudio)

---

## ✨ Author

**Oscar Tadeo Pérez Bocos**
