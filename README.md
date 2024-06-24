# News App

A Flutter application for browsing news articles from various sources and categories.

![App Demo](https://github.com/adarshpandey18/News-App/blob/main/assets/images/splah_screen_image.png) <!-- Replace with a screenshot or GIF of your app -->

---

## Table of Contents

- [Overview](#overview)
- [Folder Structure](#folder-structure)
- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

The **News App** is a mobile application developed using Flutter and Dart programming languages. It leverages the News API to fetch news articles categorized by topics and sources. Users can explore different categories, search for specific articles, and view detailed information about each article.

---

## Folder Structure

The project follows a standard Flutter directory structure:
```bash
project_root/
│
├── lib/
│   ├── models/
│   │   ├── category_news_model.dart
│   │   ├── everything_news_model.dart
│   │   ├── news_channel_headline.dart
│   │   ├── news_model.dart
│   │   └── search_news_model.dart
│   ├── pages/
│   │   ├── category_screen.dart
│   │   ├── home_screen.dart
│   │   ├── more_information.dart
│   │   ├── search_screen.dart
│   │   └── splash_screen.dart
│   ├── repository/
│   │   ├── categories_repository.dart
│   │   ├── everything_repository.dart
│   │   ├── news_repository.dart
│   │   └── search_repository.dart
│   ├── view_model/
│   │   ├── category_news_view_model.dart
│   │   ├── everything_news_view_model.dart
│   │   ├── news_view_model.dart
│   │   └── search_news_view_model.dart
│   └── widgets/
│       ├── category_tile.dart
│       ├── drawer_tile.dart
│       ├── every_news_tile.dart
│       ├── heading.dart
│       └── loading.dart
│
├── assets/
│   └── images/
│       └── splash_screen_image.png
│
├── pubspec.yaml
└── main.dart
```

### Description of Folders:

- **lib/models/**: Contains data models used throughout the app.
- **lib/pages/**: Screens or pages of the app.
- **lib/repository/**: Repository classes responsible for fetching data from APIs.
- **lib/view_model/**: View models that manage the state and business logic of the app.
- **lib/widgets/**: Reusable UI components or widgets used across different screens.

---

## Features

- **Category Screen**: Browse news articles by different categories such as business, technology, sports, etc.
- **Search Screen**: Search for specific news articles using keywords.
- **Article Details**: View detailed information about each article including images, source, date, description, and content.
- **Navigation Drawer**: Easy navigation through different sections of the app.
- **URL Launcher Integration**: Utilizes url_launcher to open article URLs in the default browser.

---

## Screenshots

<div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
    <img src="https://github.com/adarshpandey18/News-App/blob/main/screenshot/screenshot_1.jpg" alt="Screenshot 1" style="width: 30%; margin-bottom: 10px;">
    <img src="https://github.com/adarshpandey18/News-App/blob/main/screenshot/screenshot_2.jpg" alt="Screenshot 2" style="width: 30%; margin-bottom: 10px;">
    <img src="https://github.com/adarshpandey18/News-App/blob/main/screenshot/screenshot_6.jpg" alt="Screenshot 6" style="width: 30%; margin-bottom: 10px;">
    <img src="https://github.com/adarshpandey18/News-App/blob/main/screenshot/screenshot_3.jpg" alt="Screenshot 3" style="width: 30%; margin-bottom: 10px;">
    <img src="https://github.com/adarshpandey18/News-App/blob/main/screenshot/screenshot_4.jpg" alt="Screenshot 4" style="width: 30%; margin-bottom: 10px;">
    <img src="https://github.com/adarshpandey18/News-App/blob/main/screenshot/screenshot_5.jpg" alt="Screenshot 5" style="width: 30%; margin-bottom: 10px;">
</div>

<!-- Add more screenshots if necessary -->

---

## Installation

To get started with the News App, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/adarshpandey18/news_app.git
   ```
   
2. **Navigate to the project directory:**

   ```bash
   cd news_app
   ```
3. **Install dependencies:**

   ```bash
   flutter pub get
   ```
4. **Run the app:**

   ```bash
   flutter run
   ```
## Usage

1. **Launching the App:**
   - Upon launching the app, the splash screen appears briefly.
   - Afterward, the home screen displays top headlines from various news sources.

2. **Navigating Categories:**
   - Open the drawer menu to navigate through different categories such as Business, Sports, Technology, etc.
   - Selecting a category updates the news feed with headlines relevant to that category.

3. **Searching for News:**
   - Navigate to the search screen by selecting the search option from the drawer menu.
   - Enter keywords to search for specific news articles related to your interests.

4. **Reading Articles:**
   - Tap on any article from the list to view more details.
   - Details include the article's source, publication date, a brief description, and a preview of the content.
   - Tap "Read More" to open the full article in a web browser for detailed reading.



## Technologies Used

- **Flutter**
- **Dart**
- **HTTP package for API calls**
- **Cached Network Image package for image looking**
- **Url Launcher package**

## Contributing

- **Fork the repository**
- **Create a new branch**
    ```bash
    git checkout -b feature-branch
    ```
- **Make the changes**
- **Commit the changes**

  ```bash
    git push commit -m "Add new feature"
    ```
- **Push to the branch**

  ```bash
      git push origin feature-branch
    ```
 - **Create a new Pull Request**
    ## License

This project is licensed under the MIT License. See the [LICENSE]() file for details.

  

  
