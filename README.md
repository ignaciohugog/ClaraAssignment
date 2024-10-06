# Clara Assignment App
# Features
- [x] Search Functionality
- [x] Artist Detail View
- [x] Artist’s Albums View


# Requirements
- [x] Xcode 16
- [x] iOS 16.0

# Installation
1. Clone the repository
[https://github.com/ignaciohugog/ClaraAssignment](https://github.com/ignaciohugog/ClaraAssignment)
2. Open ```ClaraAssignment.xcodeproj```
3. Build and run ```CTRL+R```

# Architecture Overview
The application is structured using a modular architecture, following the MVVM (Model-View-ViewModel) pattern combined with the Coordinator pattern. The architecture adheres to SOLID principles, enabling scalability, maintainability, and separation of concerns.

## Domain layer
### Data
- Repositories: Serve as the single source of truth for data access from various data sources.
- DTO: Used to transfer data between different layers.
### Domain
- Use cases (Business Logic): Serve as intermediaries between the data layer and presentation layer.
- Domain Models: Core entities used throughout the app.

## Presentation layer
- MVVM: The ViewModel contains presentation logic and interacts with Use Cases to retrieve and process data, providing it to the View for display.
- Coordinator: Used for navigation and flow control within the app, centralizing navigation.


## Project Structure

The project is divided into multiple modules, each with distinct responsibilities:

- Features: This folder contains feature specific modules, where each feature represents a distinct functionality of the app.
  - **Searcher Feature**: Contains modules related to searching functionality, albums and artists.
    - Album
    - Artist
    - Searcher
- **Core Module:**
The Core module provides shared utilities, services, and foundational elements used across different features, such as network handling, dependency injection, or common business rules.
- **UI Module:**
The UI module contains reusable UI components, styles, and design elements, which are shared across multiple features.

# Testing
The app uses the new [Swift Testing Framework](https://developer.apple.com/documentation/testing/). Each module has its own dedicated test suite.
- Module Specific Testing: Tests are organized to mirror the source folder structure.
- Mocking Server Requests: [Swifter](https://github.com/httpswift/swifter) is used to mock server responses, allowing for testing of network requests and repository logic.

# Dependecies
### [Kingfisher](https://github.com/onevcat/Kingfisher)
Swift library for downloading and caching images from the web.

### [Alamofire](https://github.com/Alamofire/Alamofire)
Used to perform network requests.

### [Swifter](https://github.com/httpswift/swifter)
Tiny http server engine used for mock server responses.

# Todo
- Create a Design System for reusable UI components, styles, and themes.
- Localization
- Integrate [Sourcery](https://github.com/krzysztofzablocki/Sourcery) for Mock Generation
- Implement UI Tests
- Add Snapshot Testing for UI Components





# Author
Ignacio Gómez, ignaciohugog@gmail.com
