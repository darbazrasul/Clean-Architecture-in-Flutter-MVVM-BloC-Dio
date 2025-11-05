# Contributing to HR Management System

First off, thank you for considering contributing to this project! It's people like you that make this project such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to [darbazrasul721@gmail.com].

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title**
* **Describe the exact steps which reproduce the problem**
* **Provide specific examples to demonstrate the steps**
* **Describe the behavior you observed after following the steps**
* **Explain which behavior you expected to see instead and why**
* **Include screenshots or animated GIFs** if possible
* **Include Flutter/Dart version** you're using
* **Include device/emulator information**

#### Bug Report Template

```markdown
**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Environment:**
 - Device: [e.g. iPhone 12, Pixel 5]
 - OS: [e.g. iOS 15, Android 12]
 - Flutter Version: [e.g. 3.10.0]
 - Dart Version: [e.g. 3.0.0]

**Additional context**
Add any other context about the problem here.
```

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

* **Use a clear and descriptive title**
* **Provide a step-by-step description of the suggested enhancement**
* **Provide specific examples to demonstrate the steps**
* **Describe the current behavior** and **explain which behavior you expected to see instead**
* **Explain why this enhancement would be useful**

### Pull Requests

* Fill in the required template
* Follow the Dart/Flutter style guide
* Include appropriate test coverage
* Update the documentation accordingly
* End all files with a newline

## Development Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/darbazrasul/Clean-Architecture-in-Flutter-MVVM-BloC-Dio.git
   ```
3. Create a branch:
   ```bash
   git checkout -b feature/my-new-feature
   ```
4. Install dependencies:
   ```bash
   flutter pub get
   ```
5. Make your changes
6. Run tests:
   ```bash
   flutter test
   ```
7. Run analyzer:
   ```bash
   flutter analyze
   ```
8. Format code:
   ```bash
   flutter format .
   ```

## Coding Style

### Dart/Flutter Style Guide

Follow the official [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines:

#### Naming Conventions

```dart
// Classes, enums, typedefs, and type parameters: UpperCamelCase
class PropertyEntity { }
enum PropertyStatus { }

// Libraries, packages, directories, and source files: lowercase_with_underscores
library firebase_helper;
import 'property_model.dart';

// Variables, constants, parameters, and named parameters: lowerCamelCase
var propertyCount = 10;
const defaultTimeout = 1000;

// Private members: prefix with underscore
String _privateField;
void _privateMethod() { }
```

#### Code Organization

```dart
// 1. Imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 2. Class definition
class MyWidget extends StatelessWidget {
  // 3. Static members
  static const String routeName = '/my-widget';
  
  // 4. Instance fields
  final String title;
  final VoidCallback onTap;
  
  // 5. Constructor
  const MyWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  
  // 6. Overrides
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  // 7. Private methods
  void _handleTap() {
    onTap();
  }
}
```

### Architecture Guidelines

#### Feature Structure

Each feature must follow Clean Architecture:

```
feature_name/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/
```

#### Layer Dependencies

- **Presentation** depends on **Domain**
- **Data** depends on **Domain**
- **Domain** depends on **nothing** (pure Dart)

```dart
// ✅ Good - Presentation depends on Domain
import 'package:app/features/property/domain/entities/property_entity.dart';

// ❌ Bad - Domain depends on Data
import 'package:app/features/property/data/models/property_model.dart';
```

#### Naming Conventions for Architecture

```dart
// Entities (domain layer)
class PropertyEntity { }

// Models (data layer)
class PropertyModel extends PropertyEntity { }

// Use Cases
class GetPropertiesUseCase { }
class AddPropertyUseCase { }

// Repositories (interfaces in domain)
abstract class PropertyRepository { }

// Repository implementations (in data)
class PropertyRepositoryImpl implements PropertyRepository { }

// BLoC
class PropertyBloc extends Bloc<PropertyEvent, PropertyState> { }

// Events
abstract class PropertyEvent { }
class LoadPropertiesEvent extends PropertyEvent { }

// States
abstract class PropertyState { }
class PropertyLoaded extends PropertyState { }
```

## Testing Guidelines

### Test Structure

Mirror the lib/ structure in test/:

```
test/
├── features/
│   └── property/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── core/
```

### Test Coverage

- Aim for at least 70% code coverage
- Focus on business logic (domain layer)
- Test edge cases and error scenarios

### Test Naming

```dart
void main() {
  group('GetPropertiesUseCase', () {
    test('should get properties from repository', () async {
      // arrange
      
      // act
      
      // assert
    });
    
    test('should return failure when repository fails', () async {
      // arrange
      
      // act
      
      // assert
    });
  });
}
```

## Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that don't affect the code meaning (formatting, etc)
- **refactor**: Code change that neither fixes a bug nor adds a feature
- **perf**: Performance improvement
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools

### Examples

```bash
feat(property): add filter by price range

fix(auth): resolve login token expiration issue

docs(readme): update installation instructions

test(property): add unit tests for GetPropertiesUseCase

refactor(core): simplify error handling logic
```

## Pull Request Process

1. **Update the README.md** with details of changes if needed
2. **Update the CHANGELOG.md** with your changes
3. **Ensure all tests pass** (`flutter test`)
4. **Ensure code is properly formatted** (`flutter format .`)
5. **Ensure no analyzer warnings** (`flutter analyze`)
6. **Request review** from maintainers
7. **Address review comments** if any
8. **Squash commits** if requested before merging

### Pull Request Template

```markdown
## Description
Brief description of what this PR does.

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## How Has This Been Tested?
Describe the tests that you ran to verify your changes.

## Checklist
- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] Any dependent changes have been merged and published

## Screenshots (if appropriate)
```

## Code Review Guidelines

When reviewing code, consider:

- **Architecture**: Does it follow Clean Architecture principles?
- **Readability**: Is the code easy to understand?
- **Testing**: Are there adequate tests?
- **Performance**: Are there any performance concerns?
- **Security**: Are there any security issues?
- **Documentation**: Is the code well documented?

## Community

- Join our discussions on GitHub
- Ask questions in issues
- Share your ideas for improvements

## Recognition

Contributors will be recognized in our README.md file and release notes.

## Questions?

Feel free to contact the maintainers if you have any questions:
- Email: your.email@example.com
- GitHub Issues: [Create an issue](https://github.com/yourusername/hr-management-system/issues)

---

Thank you for contributing! 🎉
