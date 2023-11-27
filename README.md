# Flutter User Registration Flow

This repository contains a Flutter project that consists of a list of registered user which are received from database. The registration form includes sections for basic information, professional information, and address details. this project uses clean code architecture and bloc for state management. Also attached screenshots for the same.

## Packages Used

- **sizer:** ^2.0.15
- **flutter_bloc:** ^8.1.3
- **equatable:** ^2.0.3
- **image_picker:** ^0.8.7+5
- **google_fonts:** ^4.0.4
- **uuid:** ^3.0.7
- **dartz:** ^0.10.1
- **get_it:** ^7.6.0
- **cupertino_icons:** ^1.0.2
- **json_annotation:** ^4.8.1
- **sqflite:** ^2.3.0
- **io:** ^1.0.4
- **path_provider:** ^2.1.1

## Getting Started

1. **Clone the repository:**

    ```bash
    git clone http://mobilegit.neosofttech.in/Flutter/Assessment_11630.git
    cd your-repo
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Project Structure

- **lib/**
  - **presentation/:** Contains the UI layer using Flutter widgets.
  - **domain/:** Holds the business logic and use cases.
  - **data/:** Implements data sources, repositories, and external dependencies.
  - **injection/:** Sets up dependency injection using `get_it`.
  - **main.dart:** Entry point of the application.

## Features

- User registration
- User authentication
- Profile management
- Responsive UI with `sizer` package

## Dependencies

- `flutter_bloc` for state management
- `image_picker` for picking images
- `google_fonts` for custom fonts
- `uuid` for generating unique IDs
- `dartz` for functional programming
- `get_it` for dependency injection
- `sqflite` for local database
- `path_provider` for handling file paths

