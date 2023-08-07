// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Let's Travel`
  String get lets_Travel {
    return Intl.message(
      'Let\'s Travel',
      name: 'lets_Travel',
      desc: '',
      args: [],
    );
  }

  /// `Embark on exciting adventures and explore new horizons,Discover breathtaking landscapes,vibrant cultures,and unforgettable experiences as you wander the world`
  String get lets_Travel_desc {
    return Intl.message(
      'Embark on exciting adventures and explore new horizons,Discover breathtaking landscapes,vibrant cultures,and unforgettable experiences as you wander the world',
      name: 'lets_Travel_desc',
      desc: '',
      args: [],
    );
  }

  /// `Plan a Trip`
  String get plan_a_trip {
    return Intl.message(
      'Plan a Trip',
      name: 'plan_a_trip',
      desc: '',
      args: [],
    );
  }

  /// `Get ready to plan your dream getaway,'Whether it's a serene beach retreat,a thrilling mountain hike,or an urban escapade,we've got you covered with expert travel tips and recommendations`
  String get plan_a_trip_desc {
    return Intl.message(
      'Get ready to plan your dream getaway,\'Whether it\'s a serene beach retreat,a thrilling mountain hike,or an urban escapade,we\'ve got you covered with expert travel tips and recommendations',
      name: 'plan_a_trip_desc',
      desc: '',
      args: [],
    );
  }

  /// `Book a Flight`
  String get book_a_flight {
    return Intl.message(
      'Book a Flight',
      name: 'book_a_flight',
      desc: '',
      args: [],
    );
  }

  /// `Fly to your desired destinations with ease.Find the best deals on flights,compare prices, and book your tickets hassle-free,Your journey starts with a simple click`
  String get book_a_flight_desc {
    return Intl.message(
      'Fly to your desired destinations with ease.Find the best deals on flights,compare prices, and book your tickets hassle-free,Your journey starts with a simple click',
      name: 'book_a_flight_desc',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_button {
    return Intl.message(
      'Continue',
      name: 'continue_button',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!  Glad to see you, Again!`
  String get login_desc {
    return Intl.message(
      'Welcome back!  Glad to see you, Again!',
      name: 'login_desc',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_button {
    return Intl.message(
      'Login',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_register {
    return Intl.message(
      'Email',
      name: 'email_register',
      desc: '',
      args: [],
    );
  }

  /// ` Password`
  String get password_register {
    return Intl.message(
      ' Password',
      name: 'password_register',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forget_password {
    return Intl.message(
      'Forget Password ?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry! It occurs. Please enter the email address linked with your account.`
  String get forget_password_desc {
    return Intl.message(
      'Don\'t worry! It occurs. Please enter the email address linked with your account.',
      name: 'forget_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Remember Password ?`
  String get remember_password {
    return Intl.message(
      'Remember Password ?',
      name: 'remember_password',
      desc: '',
      args: [],
    );
  }

  /// `or Login with`
  String get another_login {
    return Intl.message(
      'or Login with',
      name: 'another_login',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get not_have_account {
    return Intl.message(
      'Don’t have an account?',
      name: 'not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_account {
    return Intl.message(
      'Already have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get register_way {
    return Intl.message(
      'Register Now',
      name: 'register_way',
      desc: '',
      args: [],
    );
  }

  /// `Hello! Register to get started `
  String get register_desc {
    return Intl.message(
      'Hello! Register to get started ',
      name: 'register_desc',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_button {
    return Intl.message(
      'Register',
      name: 'register_button',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get user_name {
    return Intl.message(
      'Username',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_account {
    return Intl.message(
      'Phone number',
      name: 'phone_account',
      desc: '',
      args: [],
    );
  }

  /// `or Register with`
  String get another_register {
    return Intl.message(
      'or Register with',
      name: 'another_register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
