# Job Centre

Job Centre is a Flutter application that fetches and displays job postings from an RSS feed. The application consists of several Dart files that handle various aspects of the app, including fetching job data, displaying job listings, and managing the UI.

## Table of Contents

- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To get started with the VacancyBox Jobs app, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/bruceiczw/job-centre.git
   cd job-centre
   ```

2. **Install the dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

## Project Structure

The project is organized as follows:

```
vacancybox-jobs/
│
├── lib/
│   ├── main.dart
│   ├── job_screen.dart
│   ├── job_feed_service.dart
│   ├── models/
│   │   └── job_post.dart
│   └── widgets/
│
├── pubspec.yaml
└── README.md
```

- `main.dart`: Entry point of the application.
- `job_screen.dart`: Contains the UI for displaying the list of job postings.
- `job_feed_service.dart`: Handles fetching job data from the RSS feed.
- `models/job_post.dart`: Defines the `JobPost` model.

## Dependencies

The project relies on the following dependencies:

- `flutter`: The Flutter SDK.
- `http`: A package for making HTTP requests.
- `webfeed`: A package for parsing RSS feeds.

These dependencies are specified in the `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
  webfeed: ^0.7.0
```

## Usage

### Main Application

The main application is defined in `main.dart`. It sets up the `MaterialApp` and the home screen:

```dart
import 'package:flutter/material.dart';
import 'package:job_centre/job_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobListScreen(),
    );
  }
}
```

### Job Screen

The `JobListScreen` in `job_screen.dart` displays the list of job postings:

```dart
import 'package:flutter/material.dart';
import 'package:job_centre/job_feed_service.dart';
import 'package:job_centre/models/job_post.dart';

// Rest of the code...
```

### Job Feed Service

The `JobFeedService` in `job_feed_service.dart` handles fetching job data from the RSS feed:

```dart
import "package:http/http.dart" as http;
import "package:job_centre/models/job_post.dart";
import "package:webfeed/webfeed.dart";

// Rest of the code...
```

### Job Post Model

The `JobPost` model in `models/job_post.dart` defines the structure of a job posting:

```dart
class JobPost {
  final String title;
  final String link;
  final String description;
  final String? company;
  final String? location;
  final String? postedDate;

  JobPost({
    required this.title,
    required this.link,
    required this.description,
    this.company,
    this.location,
    this.postedDate,
  });
}
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
