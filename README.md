# 🏢 Flutter Clean Architecture

A production-ready Flutter application implementing Clean Architecture principles with BLoC state management, showcasing best practices for scalable and maintainable mobile app development.

[![Flutter Version](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Architecture](https://img.shields.io/badge/Architecture-Clean-blue.svg)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![State Management](https://img.shields.io/badge/State%20Management-BLoC-purple.svg)](https://bloclibrary.dev)

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Code Examples](#code-examples)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## 🎯 Overview

This Clean-Architecture-in-Flutter-MVVM-BloC-Dio.gitv is a comprehensive Flutter application that demonstrates enterprise-level architecture and development practices. Built with Clean Architecture and BLoC pattern, it provides a robust foundation for managing properties, transactions, and business operations.

### Why This Architecture?

- ✅ **Separation of Concerns**: Clear boundaries between layers
- ✅ **Testability**: Each layer can be tested independently
- ✅ **Maintainability**: Easy to modify and extend
- ✅ **Scalability**: Add features without breaking existing code
- ✅ **Team Collaboration**: Multiple developers can work simultaneously
- ✅ **Offline Support**: Built-in caching and offline capabilities

## ✨ Features

### 🏠 Property Management
- View and search properties
- Filter by status, type, and price range
- Add, edit, and delete properties
- Favorite properties
- Offline mode support with local caching
- Real-time data synchronization

### 🎨 UI/UX Features
- Custom reusable widgets
- Responsive design
- Theme customization
- Loading states
- Error handling with user-friendly messages
- Pull-to-refresh functionality
- Infinite scroll pagination

### 🔐 Core Features
- RESTful API integration
- Local data caching
- Network connectivity handling
- Error handling and recovery
- Form validation
- Image handling and caching

## 🏗️ Architecture

This project follows **Clean Architecture** principles proposed by Robert C. Martin (Uncle Bob), ensuring a clear separation of concerns and dependency rules.

### Architecture Layers

```
┌─────────────────────────────────────────────────┐
│                                                 │
│             PRESENTATION LAYER                  │
│         (UI, BLoC, Pages, Widgets)             │
│                                                 │
│  • Handles user interactions                    │
│  • Dispatches events to BLoC                    │
│  • Listens to state changes                     │
│  • Renders UI based on states                   │
│                                                 │
└────────────────────┬────────────────────────────┘
                     │
                     │ Uses
                     ↓
┌─────────────────────────────────────────────────┐
│                                                 │
│               DOMAIN LAYER                      │
│      (Entities, UseCases, Repositories)         │
│                                                 │
│  • Contains business logic                      │
│  • Pure Dart (no framework dependencies)        │
│  • Defines contracts (interfaces)               │
│  • Independent and testable                     │
│                                                 │
└────────────────────↑────────────────────────────┘
                     │
                     │ Implements
                     │
┌─────────────────────────────────────────────────┐
│                                                 │
│                DATA LAYER                       │
│  (Models, DataSources, Repository Impl)         │
│                                                 │
│  • Handles data operations                      │
│  • API calls and local storage                  │
│  • Implements domain contracts                  │
│  • Manages offline/online scenarios             │
│                                                 │
└─────────────────────────────────────────────────┘
```

### Data Flow

```
User Action → Widget → BLoC Event → UseCase → Repository Interface
                                                      ↓
                                           Repository Implementation
                                                      ↓
                                    ┌─────────────────┴─────────────────┐
                                    ↓                                   ↓
                            Remote DataSource                  Local DataSource
                            (API Calls)                        (Caching)
                                    ↓                                   ↓
                            PropertyModel ←──────────────→ PropertyModel
                                    ↓                                   ↓
                            PropertyEntity ←────────────────────────────┘
                                    ↓
                            Either<Failure, Entity>
                                    ↓
                            UseCase → BLoC → State → Widget Updates
```

## 📁 Project Structure

```
lib/
├── main.dart                          # Application entry point
├── app/                               # App-level configurations
│   ├── app_runner.dart
│   └── configs/
│       ├── injection_container.dart   # Dependency injection setup
│       └── service_locator.dart
│
└── src/
    ├── core/                          # Core utilities and shared code
    │   ├── api/
    │   │   └── api_url.dart
    │   ├── errors/
    │   │   ├── failures.dart         # Failure classes
    │   │   ├── exceptions.dart       # Exception classes
    │   │   └── error_handler.dart
    │   ├── network/
    │   │   ├── dio_factory.dart      # Dio configuration
    │   │   ├── api_client.dart       # API client wrapper
    │   │   └── network_info.dart     # Connectivity checker
    │   ├── extensions/
    │   │   ├── custom_spacer.dart
    │   │   └── string_validator_extension.dart
    │   ├── resources/                # App resources
    │   │   ├── app_colors.dart
    │   │   ├── app_fonts.dart
    │   │   └── app_images.dart
    │   ├── utils/
    │   │   ├── constants/
    │   │   │   ├── api_constants.dart
    │   │   │   ├── app_constants.dart
    │   │   │   └── storage_keys.dart
    │   │   ├── validator/
    │   │   │   └── validation.dart
    │   │   └── helper/
    │   ├── routers/
    │   │   ├── app_routers.dart
    │   │   └── app_routes.dart
    │   └── theme/
    │       └── app_theme.dart
    │
    ├── features/                      # Feature modules
    │   └── property/                  # Property feature
    │       ├── data/
    │       │   ├── datasources/
    │       │   │   ├── property_remote_datasource.dart
    │       │   │   └── property_local_datasource.dart
    │       │   ├── models/
    │       │   │   ├── property_model.dart
    │       │   │   └── property_response_model.dart
    │       │   └── repositories/
    │       │       └── property_repository_impl.dart
    │       │
    │       ├── domain/
    │       │   ├── entities/
    │       │   │   └── property_entity.dart
    │       │   ├── repositories/
    │       │   │   └── property_repository.dart
    │       │   └── usecases/
    │       │       ├── get_properties_usecase.dart
    │       │       ├── filter_properties_usecase.dart
    │       │       └── add_property_usecase.dart
    │       │
    │       └── presentation/
    │           ├── bloc/
    │           │   ├── property_bloc.dart
    │           │   ├── property_event.dart
    │           │   └── property_state.dart
    │           ├── pages/
    │           │   └── property_list_page.dart
    │           └── widgets/
    │               └── property_card.dart
    │
    └── shared/                        # Shared across features
        ├── bloc/
        │   └── app_bloc/              # Global app state
        ├── presentation/
        │   └── splash/
        └── widgets/
            ├── custom_button.dart
            ├── custom_textfield.dart
            ├── custom_appbar.dart
            ├── loading_widget.dart
            ├── error_widget.dart
            └── custom_snackbar.dart
```

## 🛠️ Tech Stack

### Core
- **Flutter SDK**: 3.0+
- **Dart**: 3.0+

### State Management
- **flutter_bloc**: ^8.1.3 - BLoC pattern implementation
- **equatable**: ^2.0.5 - Value equality

### Dependency Injection
- **get_it**: ^7.6.0 - Service locator

### Functional Programming
- **dartz**: ^0.10.1 - Functional programming (Either, Option)

### Networking
- **dio**: ^5.3.2 - HTTP client
- **internet_connection_checker**: ^1.0.0+1 - Connectivity check

### Local Storage
- **shared_preferences**: ^2.2.0 - Key-value storage
- **hive**: (optional) - NoSQL database

### UI/UX
- **cached_network_image**: Latest - Image caching
- **flutter_svg**: Latest - SVG support

### Utilities
- **intl**: Latest - Internationalization
- **logger**: Latest - Logging

### Development
- **flutter_lints**: Latest - Linting rules
- **build_runner**: Latest - Code generation

### Testing
- **mockito**: ^5.4.2 - Mocking
- **bloc_test**: ^9.1.4 - BLoC testing
- **flutter_test**: SDK

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/darbazrasul/Clean-Architecture-in-Flutter-MVVM-BloC-Dio.git
   cd Clean-Architecture-in-Flutter-MVVM-BloC-Dio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   
   Create a `.env` file in the root directory:
   ```env
   API_BASE_URL=https://your-api-url.com/api
   API_KEY=your_api_key_here
   ```

4. **Run code generation** (if using freezed/json_serializable)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   # Development
   flutter run
   
   # Production
   flutter run --release
   ```

### Configuration

1. **API Configuration**
   
   Update `lib/src/core/api/api_url.dart`:
   ```dart
   class ApiUrl {
     static const String baseUrl = 'https://your-api-url.com/api';
     static const String properties = '/properties';
     // Add more endpoints
   }
   ```

2. **Dependency Injection**
   
   All dependencies are registered in `injection_container.dart`:
   ```dart
   Future<void> init() async {
     // Features
     sl.registerFactory(() => PropertyBloc(...));
     sl.registerLazySingleton(() => GetPropertiesUseCase(sl()));
     // ... more registrations
   }
   ```

## 💻 Code Examples

### 1. Creating a New Feature

Follow these steps to add a new feature (e.g., "User Management"):

#### Step 1: Create Domain Layer

```dart
// lib/src/features/user/domain/entities/user_entity.dart
class UserEntity {
  final String id;
  final String name;
  final String email;
  
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
  });
}

// lib/src/features/user/domain/repositories/user_repository.dart
abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();
  Future<Either<Failure, UserEntity>> getUserById(String id);
}

// lib/src/features/user/domain/usecases/get_users_usecase.dart
class GetUsersUseCase implements UseCase<List<UserEntity>, NoParams> {
  final UserRepository repository;
  
  GetUsersUseCase(this.repository);
  
  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) {
    return repository.getUsers();
  }
}
```

#### Step 2: Create Data Layer

```dart
// lib/src/features/user/data/models/user_model.dart
class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String name,
    required String email,
  }) : super(id: id, name: name, email: email);
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
  };
}

// lib/src/features/user/data/datasources/user_remote_datasource.dart
abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio client;
  
  UserRemoteDataSourceImpl({required this.client});
  
  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get('/users');
    return (response.data as List)
        .map((json) => UserModel.fromJson(json))
        .toList();
  }
}

// lib/src/features/user/data/repositories/user_repository_impl.dart
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  
  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  
  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final users = await remoteDataSource.getUsers();
        return Right(users);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
```

#### Step 3: Create Presentation Layer

```dart
// lib/src/features/user/presentation/bloc/user_event.dart
abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUsersEvent extends UserEvent {}

// lib/src/features/user/presentation/bloc/user_state.dart
abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserLoaded extends UserState {
  final List<UserEntity> users;
  UserLoaded(this.users);
  @override
  List<Object?> get props => [users];
}
class UserError extends UserState {
  final String message;
  UserError(this.message);
  @override
  List<Object?> get props => [message];
}

// lib/src/features/user/presentation/bloc/user_bloc.dart
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  
  UserBloc({required this.getUsersUseCase}) : super(UserInitial()) {
    on<LoadUsersEvent>(_onLoadUsers);
  }
  
  Future<void> _onLoadUsers(
    LoadUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    
    final result = await getUsersUseCase(NoParams());
    
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (users) => emit(UserLoaded(users)),
    );
  }
}
```

#### Step 4: Register in DI

```dart
// lib/app/configs/injection_container.dart
Future<void> init() async {
  // User Feature
  sl.registerFactory(() => UserBloc(getUsersUseCase: sl()));
  sl.registerLazySingleton(() => GetUsersUseCase(sl()));
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );
  
  // ... other registrations
}
```

### 2. Using BLoC in UI

```dart
class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>()..add(LoadUsersEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Users')),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return LoadingWidget();
            } else if (state is UserError) {
              return ErrorWidget(message: state.message);
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Test Structure

```
test/
├── features/
│   └── property/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── property_remote_datasource_test.dart
│       │   ├── models/
│       │   │   └── property_model_test.dart
│       │   └── repositories/
│       │       └── property_repository_impl_test.dart
│       ├── domain/
│       │   └── usecases/
│       │       └── get_properties_usecase_test.dart
│       └── presentation/
│           └── bloc/
│               └── property_bloc_test.dart
└── core/
    └── network/
        └── network_info_test.dart
```

### Example Test

```dart
// test/features/property/domain/usecases/get_properties_usecase_test.dart
void main() {
  late GetPropertiesUseCase useCase;
  late MockPropertyRepository mockRepository;
  
  setUp(() {
    mockRepository = MockPropertyRepository();
    useCase = GetPropertiesUseCase(mockRepository);
  });
  
  test('should get properties from repository', () async {
    // Arrange
    final tProperties = [
      PropertyEntity(id: '1', name: 'Test Property'),
    ];
    when(mockRepository.getProperties())
        .thenAnswer((_) async => Right(tProperties));
    
    // Act
    final result = await useCase(NoParams());
    
    // Assert
    expect(result, Right(tProperties));
    verify(mockRepository.getProperties());
    verifyNoMoreInteractions(mockRepository);
  });
}
```

## 📱 Screenshots

*Add your app screenshots here*

```markdown
### Home Screen
<img src="screenshots/home.png" width="250">

### Property List
<img src="screenshots/property_list.png" width="250">

### Property Details
<img src="screenshots/property_details.png" width="250">
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful variable and function names
- Write unit tests for new features
- Keep functions small and focused
- Document complex logic with comments
- Run `flutter analyze` before committing
- Format code with `flutter format .`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Darbaz** - Flutter Developer

- GitHub: [@darbazrasul](https://github.com/darbazrasul)
- LinkedIn: [@darbaz-rasull](https://www.linkedin.com/in/darbaz-rasull-19375a252/)
- Email: darbazrasul721@gmail.com

## 🙏 Acknowledgments

- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) by Robert C. Martin
- [BLoC Library](https://bloclibrary.dev/) by Felix Angelov
- [Reso Coder](https://resocoder.com/) for Flutter Clean Architecture tutorials
- Flutter community for amazing packages and support

## 📚 Resources

### Architecture & Patterns
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture-tdd/)
- [BLoC Pattern Documentation](https://bloclibrary.dev)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

### Books
- Clean Architecture by Robert C. Martin
- Domain-Driven Design by Eric Evans

### Articles
- [Flutter App Architecture: The Repository Pattern](https://medium.com/ayt-technologies/flutter-clean-architecture-repository-pattern-df418968c731)
- [Riverpod vs BLoC: A Comparison](https://ms3byoussef.medium.com/state-management-in-flutter-provider-vs-riverpod-vs-bloc-333795f0df22)

---

⭐ **If you find this project helpful, please give it a star!** ⭐

Made with ❤️ using Flutter
