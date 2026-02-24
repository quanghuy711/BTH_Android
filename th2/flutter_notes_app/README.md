# Flutter Notes App

A simple note-taking application built with Flutter that implements CRUD functionality, utilizes SharedPreferences for offline data storage, and employs JSON for data serialization. The app features real-time search, swipe-to-delete with confirmation, and auto-save functionality when navigating back, ensuring data persistence even when the app is closed.

## Features

- Create, Read, Update, and Delete notes
- Offline data storage using SharedPreferences
- JSON serialization for note data
- Real-time search functionality
- Swipe-to-delete with confirmation
- Auto-save when navigating back

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd flutter_notes_app
   ```
3. Install the dependencies:
   ```
   flutter pub get
   ```

### Running the App

To run the app, use the following command:
```
flutter run
```

### Folder Structure

- `lib/`: Contains the main application code.
  - `models/`: Data models for the application.
  - `services/`: Services for data storage and retrieval.
  - `repositories/`: Repositories for managing data operations.
  - `providers/`: State management using ChangeNotifier.
  - `screens/`: UI screens for the application.
  - `widgets/`: Reusable widgets.
  - `utils/`: Utility functions for JSON serialization.

### Testing

To run the widget tests, use the following command:
```
flutter test
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.