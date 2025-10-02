# 📱 Islami Application

An Islamic mobile application built with **Flutter** that provides Muslims with essential daily tools and resources, designed with a modern and simple UI.

## 🚀 Features

* 📖 **Quran Tab** – Read Surahs from the Holy Quran.
* 📜 **Hadith Tab** – Browse and learn from Hadith collections.
* 🔵 **Sebha Tab** – Digital Tasbeeh counter for daily dhikr.
* 📻 **Radio Tab** – Stream Islamic radio stations.
* 🕌 **Prayer Time Tab** – Show daily prayer timings based on user’s location.
* 🎬 **Onboarding Screens** – Smooth introduction for first-time users.

---

## 🛠️ Tech Stack

* **Flutter** – Cross-platform development framework
* **Dart** – Programming language
* **Material Design** – Modern and responsive UI

---

## 📂 Project Structure

```
lib/
│-- main.dart                # App entry point
│
├── common/                  # Constants & shared designs
│   ├── app_consts.dart
│   ├── common_designs.dart
│
├── models/                  # Data models
│   ├── hadeeth_model.dart
│   ├── sebha_model.dart
│   ├── sura_model.dart
│
├── onboarding/              # Onboarding flow
│   ├── onboarding_screen.dart
│   ├── onboarding_tab_widget.dart
│   ├── onboarding_data.dart
│
├── screens/                 
│   ├── main_layer.dart      # Main app layer with navigation
│
├── tabs/                    # Main app features
│   ├── hadith/              
│   ├── prayers_time/
│   ├── quran/
│   ├── radio/
│   ├── sebha/
│
├── theme/                   # Theme & styles
│   ├── app_colors.dart
│   ├── app_theme.dart
│
└── widgets/                 # Reusable UI components
    ├── main_bg_widget.dart
    ├── main_header.dart
```

---

## 📸 Screen record

[https://drive.google.com/file/d/1m1Z-4Q3P8f-7LQaprg1rv_SxPdSHM-aA/view?usp=sharing]
---

## ⚙️ Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/omarhassandev1/Islamy_application.git
   ```
2. Navigate to the project folder:

   ```bash
   cd islami_app
   ```
3. Install dependencies:

   ```bash
   flutter pub get
   ```
4. Run the app:

   ```bash
   flutter run
   ```
