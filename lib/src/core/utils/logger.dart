// lib/core/utils/logger.dart

import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf, // What a Terrible Failure
  nothing,
}

class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();

  // Configuration
  LogLevel _logLevel = kDebugMode ? LogLevel.verbose : LogLevel.info;
  bool _includeTimestamp = true;
  bool _includeLogLevel = true;
  bool _includeLocation = kDebugMode;
  int _stackTraceLevel = 5;

  // ANSI color codes for console output
  static const String _resetColor = '\x1B[0m';
  static const String _redColor = '\x1B[31m';
  static const String _greenColor = '\x1B[32m';
  static const String _yellowColor = '\x1B[33m';
  static const String _blueColor = '\x1B[34m';
  static const String _magentaColor = '\x1B[35m';
  static const String _cyanColor = '\x1B[36m';
  static const String _whiteColor = '\x1B[37m';

  void configure({
    LogLevel? logLevel,
    bool? includeTimestamp,
    bool? includeLogLevel,
    bool? includeLocation,
    int? stackTraceLevel,
  }) {
    _logLevel = logLevel ?? _logLevel;
    _includeTimestamp = includeTimestamp ?? _includeTimestamp;
    _includeLogLevel = includeLogLevel ?? _includeLogLevel;
    _includeLocation = includeLocation ?? _includeLocation;
    _stackTraceLevel = stackTraceLevel ?? _stackTraceLevel;
  }

  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.verbose, message, error, stackTrace);
  }

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.debug, message, error, stackTrace);
  }

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.warning, message, error, stackTrace);
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.error, message, error, stackTrace);
  }

  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.wtf, message, error, stackTrace);
  }

  // Convenience methods for compatibility
  void log(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message, error, stackTrace);
  }

  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.debug, message, error, stackTrace);
  }

  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  void warning(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.warning, message, error, stackTrace);
  }

  void _log(
    LogLevel level,
    dynamic message,
    dynamic error,
    StackTrace? stackTrace,
  ) {
    if (level.index < _logLevel.index) return;

    final output = StringBuffer();

    // Add timestamp
    if (_includeTimestamp) {
      output.write('[${DateTime.now().toIso8601String()}] ');
    }

    // Add log level with color
    if (_includeLogLevel) {
      final levelStr = _getLevelString(level);
      final coloredLevel = _colorize(levelStr, _getLevelColor(level));
      output.write('$coloredLevel ');
    }

    // Add location info
    if (_includeLocation) {
      final location = _getLocation();
      if (location != null) {
        output.write('[$location] ');
      }
    }

    // Add message
    output.write(message.toString());

    // Add error if present
    if (error != null) {
      output.write('\nError: $error');
    }

    // Print to console
    if (kDebugMode) {
      developer.log(
        output.toString(),
        name: 'Logger',
        error: error,
        stackTrace: stackTrace,
        level: _getLevelValue(level),
      );
    }

    // Also print stack trace for errors
    if (level == LogLevel.error || level == LogLevel.wtf) {
      if (stackTrace != null) {
        if (kDebugMode) {
          print('Stack trace:\n$stackTrace');
        }
      } else if (_includeLocation) {
        if (kDebugMode) {
          print('Stack trace:\n${StackTrace.current}');
        }
      }
    }
  }

  String _getLevelString(LogLevel level) {
    switch (level) {
      case LogLevel.verbose:
        return 'VERBOSE';
      case LogLevel.debug:
        return 'DEBUG  ';
      case LogLevel.info:
        return 'INFO   ';
      case LogLevel.warning:
        return 'WARNING';
      case LogLevel.error:
        return 'ERROR  ';
      case LogLevel.wtf:
        return 'WTF    ';
      case LogLevel.nothing:
        return '';
    }
  }

  String _getLevelColor(LogLevel level) {
    switch (level) {
      case LogLevel.verbose:
        return _whiteColor;
      case LogLevel.debug:
        return _cyanColor;
      case LogLevel.info:
        return _greenColor;
      case LogLevel.warning:
        return _yellowColor;
      case LogLevel.error:
        return _redColor;
      case LogLevel.wtf:
        return _magentaColor;
      case LogLevel.nothing:
        return _resetColor;
    }
  }

  int _getLevelValue(LogLevel level) {
    switch (level) {
      case LogLevel.verbose:
        return 400;
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.error:
        return 1000;
      case LogLevel.wtf:
        return 1200;
      case LogLevel.nothing:
        return 0;
    }
  }

  String _colorize(String text, String color) {
    if (kDebugMode) {
      return '$color$text$_resetColor';
    }
    return text;
  }

  String? _getLocation() {
    try {
      final stackTrace = StackTrace.current.toString();
      final lines = stackTrace.split('\n');

      // Skip the first few lines which are internal to the logger
      for (int i = 3; i < lines.length && i < _stackTraceLevel + 3; i++) {
        final line = lines[i];

        // Skip internal Flutter/Dart frames
        if (line.contains('package:flutter/') ||
            line.contains('dart:') ||
            line.contains('logger.dart')) {
          continue;
        }

        // Extract file name and line number
        final match = RegExp(r'\((.+?):(\d+):\d+\)').firstMatch(line);
        if (match != null) {
          final file = match.group(1)!.split('/').last;
          final lineNumber = match.group(2);
          return '$file:$lineNumber';
        }
      }
    } catch (e) {
      // Ignore errors in getting location
    }
    return null;
  }

  // Network logging helpers
  void logRequest({
    required String method,
    required String url,
    Map<String, dynamic>? headers,
    dynamic body,
  }) {
    final log = StringBuffer();
    log.writeln('━━━━━━━━━━━━━━━ Request ━━━━━━━━━━━━━━━');
    log.writeln('${_colorize(method, _blueColor)} $url');

    if (headers != null && headers.isNotEmpty) {
      log.writeln('Headers:');
      headers.forEach((key, value) {
        log.writeln('  $key: $value');
      });
    }

    if (body != null) {
      log.writeln('Body:');
      log.writeln('  $body');
    }

    d(log.toString());
  }

  void logResponse({
    required int statusCode,
    required String url,
    Map<String, dynamic>? headers,
    dynamic body,
    Duration? duration,
  }) {
    final log = StringBuffer();
    log.writeln('━━━━━━━━━━━━━━━ Response ━━━━━━━━━━━━━━━');

    final statusColor =
        statusCode >= 200 && statusCode < 300
            ? _greenColor
            : statusCode >= 400
            ? _redColor
            : _yellowColor;

    log.writeln('${_colorize(statusCode.toString(), statusColor)} $url');

    if (duration != null) {
      log.writeln('Duration: ${duration.inMilliseconds}ms');
    }

    if (headers != null && headers.isNotEmpty) {
      log.writeln('Headers:');
      headers.forEach((key, value) {
        log.writeln('  $key: $value');
      });
    }

    if (body != null) {
      log.writeln('Body:');
      log.writeln('  $body');
    }

    if (statusCode >= 200 && statusCode < 300) {
      d(log.toString());
    } else {
      w(log.toString());
    }
  }

  // Performance logging
  void logPerformance(String operation, void Function() action) {
    final stopwatch = Stopwatch()..start();

    try {
      action();
      stopwatch.stop();
      d('⏱️ $operation completed in ${stopwatch.elapsedMilliseconds}ms');
    } catch (e) {
      stopwatch.stop();
      this.e(
        '⏱️ $operation failed after ${stopwatch.elapsedMilliseconds}ms',
        e,
      );
      rethrow;
    }
  }

  Future<T> logAsyncPerformance<T>(
    String operation,
    Future<T> Function() action,
  ) async {
    final stopwatch = Stopwatch()..start();

    try {
      final result = await action();
      stopwatch.stop();
      d('⏱️ $operation completed in ${stopwatch.elapsedMilliseconds}ms');
      return result;
    } catch (e) {
      stopwatch.stop();
      this.e(
        '⏱️ $operation failed after ${stopwatch.elapsedMilliseconds}ms',
        e,
      );
      rethrow;
    }
  }
}
