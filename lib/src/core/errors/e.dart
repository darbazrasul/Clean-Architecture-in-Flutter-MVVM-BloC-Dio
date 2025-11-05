import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  
  factory ServerFailure.fromDiorError(DioException e, {required BuildContext context}) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timed out. Please check your internet connection.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Request timed out. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Server is taking too long to respond. Please try again later.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Security certificate issue. Please contact support.');
      case DioExceptionType.badResponse:
        if (e.response != null) {
          return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
        }
        return ServerFailure('Server returned an invalid response.');
      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection. Please check your network settings.');
      case DioExceptionType.unknown:
        if (e.error != null) {
          return ServerFailure(e.error.toString());
        }
        return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }
  
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 405) {
      return ServerFailure(response['message'] ?? 'Method not allowed');
    } else if (statusCode == 500) {
      return ServerFailure(response['message'] ?? 'Server error, please try again later');
    } else if (statusCode == 400) {
      return ServerFailure(response['message'] ?? 'Bad request');
    } else if (statusCode == 401) {
      return ServerFailure(response['message'] ?? 'Unauthorized, please log in again');
    } else if (statusCode == 403) {
      if (response['message'] == 'Phone number not verified') {
        return ServerFailure('Your phone number is not verified. Please verify your number to continue.');
      }
      return ServerFailure(response['message'] ?? 'Access denied');
    } else {
      return ServerFailure(response['message'] ?? 'There was an error, please try again');
    }
  }
}