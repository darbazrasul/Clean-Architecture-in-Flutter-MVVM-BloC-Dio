import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static final UrlLauncherService _instance = UrlLauncherService._internal();
  factory UrlLauncherService() => _instance;
  UrlLauncherService._internal();

  //======================= WEB URL =========================
  Future<bool> launchWebUrl(String url, {BuildContext? context}) async {
    try {
      final Uri uri = Uri.parse(url);
      final bool canLaunch = await canLaunchUrl(uri);
      if (!canLaunch) {
        if (context != null && context.mounted) {
          _showErrorSnackBar(context, 'No browser available to open URL');
        }
        return false;
      }
      bool launched = await launchUrl(uri);
      if (!launched && context != null && context.mounted) {
        _showErrorSnackBar(context, 'Could not launch $url');
      }
      return launched;
    } catch (e) {
      if (context != null && context.mounted) {
        _showErrorSnackBar(context, 'Error: ${e.toString()}');
      }
      return false;
    }
  }

  //======================= EMAIL =========================
  Future<bool> launchEmail(
    String email, {
    String? subject,
    String? body,
    BuildContext? context,
  }) async {
    try {
      final Map<String, String> queryParams = {};
      if (subject != null) queryParams['subject'] = subject;
      if (body != null) queryParams['body'] = body;

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        query: queryParams.isNotEmpty
            ? queryParams.entries
                  .map(
                    (e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                  )
                  .join('&')
            : null,
      );

      final bool canLaunch = await canLaunchUrl(emailUri);

      if (!canLaunch) {
        if (context != null && context.mounted) {
          _showErrorSnackBar(context, 'No email app available');
        }
        return false;
      }

      bool launched = await launchUrl(emailUri);

      if (!launched && context != null && context.mounted) {
        _showErrorSnackBar(context, 'Could not open email app');
      }

      return launched;
    } catch (e) {
      if (context != null && context.mounted) {
        _showErrorSnackBar(context, 'Error: ${e.toString()}');
      }
      return false;
    }
  }
  //======================= PHONE =========================

  Future<bool> launchPhone(String phone, {BuildContext? context}) async {
    try {
      final Uri phoneUri = Uri(scheme: 'tel', path: phone);

      final bool canLaunch = await canLaunchUrl(phoneUri);

      if (!canLaunch) {
        if (context != null && context.mounted) {
          _showErrorSnackBar(context, 'No phone app available');
        }
        return false;
      }

      bool launched = await launchUrl(phoneUri);

      if (!launched && context != null && context.mounted) {
        _showErrorSnackBar(context, 'Could not open phone dialer');
      }

      return launched;
    } catch (e) {
      if (context != null && context.mounted) {
        _showErrorSnackBar(context, 'Error: ${e.toString()}');
      }
      return false;
    }
  }
  //======================= SMS =========================

  Future<bool> launchSMS(
    String phone, {
    String? body,
    BuildContext? context,
  }) async {
    try {
      final Uri smsUri = Uri(
        scheme: 'sms',
        path: phone,
        queryParameters: body != null ? {'body': body} : null,
      );

      final bool canLaunch = await canLaunchUrl(smsUri);

      if (!canLaunch) {
        if (context != null && context.mounted) {
          _showErrorSnackBar(context, 'No SMS app available');
        }
        return false;
      }

      bool launched = await launchUrl(smsUri);

      if (!launched && context != null && context.mounted) {
        _showErrorSnackBar(context, 'Could not open SMS app');
      }

      return launched;
    } catch (e) {
      if (context != null && context.mounted) {
        _showErrorSnackBar(context, 'Error: ${e.toString()}');
      }
      return false;
    }
  }
  //======================= MAPS =========================

  Future<bool> launchMaps(String query, {BuildContext? context}) async {
    try {
      final String encodedQuery = Uri.encodeComponent(query);
      final Uri mapsUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$encodedQuery',
      );

      final bool canLaunch = await canLaunchUrl(mapsUri);

      if (!canLaunch) {
        if (context != null && context.mounted) {
          _showErrorSnackBar(context, 'Cannot open maps');
        }
        return false;
      }

      bool launched = await launchUrl(mapsUri);

      if (!launched && context != null && context.mounted) {
        _showErrorSnackBar(context, 'Could not open maps');
      }

      return launched;
    } catch (e) {
      if (context != null && context.mounted) {
        _showErrorSnackBar(context, 'Error: ${e.toString()}');
      }
      return false;
    }
  }
  //======================= WHATS UP =========================

  Future<bool> launchWhatsApp(
    String phone, {
    String? message,
    BuildContext? context,
  }) async {
    try {
      final String cleanPhone = phone.replaceAll(RegExp(r'[^\d+]'), '');

      final String encodedMessage = message != null
          ? Uri.encodeComponent(message)
          : '';

      final Uri whatsappUri = Uri.parse(
        'https://wa.me/$cleanPhone${message != null ? '?text=$encodedMessage' : ''}',
      );

      final bool canLaunch = await canLaunchUrl(whatsappUri);

      if (!canLaunch) {
        if (context != null && context.mounted) {
          _showErrorSnackBar(context, 'WhatsApp is not installed');
        }
        return false;
      }

      bool launched = await launchUrl(whatsappUri);

      if (!launched && context != null && context.mounted) {
        _showErrorSnackBar(context, 'Could not open WhatsApp');
      }

      return launched;
    } catch (e) {
      if (context != null && context.mounted) {
        _showErrorSnackBar(context, 'Error: ${e.toString()}');
      }
      return false;
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
