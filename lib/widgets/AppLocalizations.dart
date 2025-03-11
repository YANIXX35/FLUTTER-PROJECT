// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static AppLocalizationsDelegate delegate =
      AppLocalizationsDelegate();

  static Future<AppLocalizations> load(Locale locale) async {
    final String name = locale.languageCode;
    final localeName = Intl.canonicalizedLocale(name);
    await initializeMessages(localeName);
    return AppLocalizations();
  }

  String get welcome {
    return Intl.message('Welcome to YANISSE FOOTBALL', name: 'welcome');
  }

  String get login {
    return Intl.message('Login', name: 'login');
  }

  String get forgotPassword {
    return Intl.message('Forgot password?', name: 'forgot_password');
  }

  String get emailOrPhone {
    return Intl.message('Email or Phone Number', name: 'email_or_phone');
  }

  String get createAccount {
    return Intl.message('Create an account', name: 'create_account');
  }
  
  static initializeMessages(String localeName) {}

  static of(BuildContext context) {}
}

class AppLocalizationsDelegate {
}
