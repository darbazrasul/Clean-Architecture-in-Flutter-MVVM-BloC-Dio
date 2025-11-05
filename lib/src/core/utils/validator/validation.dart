import 'package:flutter/widgets.dart';

abstract class Validation<T> {
  const Validation();
  String? validate(BuildContext context, T? value);
}

class RequiredValidation<T> extends Validation<T> {
  const RequiredValidation({this.isExist});

  final bool Function(T value)? isExist;

  @override
  String? validate(BuildContext context, T? value) {
    if (value == null) {
      return 'This field is required';
    }

    if (isExist != null && !isExist!(value)) {
      return 'This field is required';
    }

    if (value is String && (value as String).isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}

class EmailValidation extends Validation<String> {
  const EmailValidation();
  @override
  String? validate(BuildContext context, String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null) return null;
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}

class PasswordValidation extends Validation<String> {
  const PasswordValidation({
    this.minLength = 8,
    this.number = false,
    this.upperCase = false,
    this.specialChar = false,
  });

  final int minLength;
  final bool number;
  final bool upperCase;
  final bool specialChar;

  static final _numberRegex = RegExp(r'[0-9]');
  static final _upperCaseRegex = RegExp(r'[A-Z]');
  static final _specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  @override
  String? validate(BuildContext context, String? value) {
    if (value?.isEmpty == true) return null;

    if (value!.length < minLength) {
      return 'Password must be at least 8 characters';
    }

    if (number && !_numberRegex.hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    if (upperCase && !_upperCaseRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (specialChar && !_specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }
}

class PhoneNumberValidation extends Validation<String> {
  const PhoneNumberValidation({
    this.minLength = 10,
    this.maxLength = 11,
    this.isInternational = false,
  });
  final int minLength;
  final int maxLength;
  final bool isInternational;

  @override
  String? validate(BuildContext context, String? value) {
    if (value?.isEmpty == true) return null;
    if (value!.length < minLength) {
      return 'Phone number must be at least 8 characters';
    }
    if (value.length > maxLength) {
      return 'Invalid phone number';
    }
    return null;
  }
}

class NameValidation extends Validation<String> {
  const NameValidation({this.minLength = 2, this.maxLength = 50});

  final int minLength;
  final int maxLength;

  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.length < minLength) {
      return 'Name must be at least $minLength characters';
    }
    if (value.length > maxLength) {
      return 'Name must be less than $maxLength characters';
    }
    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    if (!nameRegex.hasMatch(value)) {
      return 'Name contains invalid characters';
    }
    return null;
  }
}