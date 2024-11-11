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

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get productPrice {
    return Intl.message(
      'Product Price',
      name: 'productPrice',
      desc: '',
      args: [],
    );
  }

  /// `Product Code`
  String get productCode {
    return Intl.message(
      'Product Code',
      name: 'productCode',
      desc: '',
      args: [],
    );
  }

  /// `Is Featured Item?`
  String get isFeaturedItem {
    return Intl.message(
      'Is Featured Item?',
      name: 'isFeaturedItem',
      desc: '',
      args: [],
    );
  }

  /// `Image is required`
  String get imageIsRequired {
    return Intl.message(
      'Image is required',
      name: 'imageIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Product added successfully`
  String get addProductSuccess {
    return Intl.message(
      'Product added successfully',
      name: 'addProductSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date in Months`
  String get expiryDateInMonths {
    return Intl.message(
      'Expiry Date in Months',
      name: 'expiryDateInMonths',
      desc: '',
      args: [],
    );
  }

  /// `Number of Calories`
  String get numberOfCalories {
    return Intl.message(
      'Number of Calories',
      name: 'numberOfCalories',
      desc: '',
      args: [],
    );
  }

  /// `Unit Amount`
  String get unitAmount {
    return Intl.message(
      'Unit Amount',
      name: 'unitAmount',
      desc: '',
      args: [],
    );
  }

  /// `per`
  String get per {
    return Intl.message(
      'per',
      name: 'per',
      desc: '',
      args: [],
    );
  }

  /// `Is Product Organic?`
  String get isProductOrganic {
    return Intl.message(
      'Is Product Organic?',
      name: 'isProductOrganic',
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
