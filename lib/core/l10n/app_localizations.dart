import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('es', 'AR'),
    Locale('es', 'ES'),
    Locale('es', 'MX'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT')
  ];

  /// App Title
  ///
  /// In en, this message translates to:
  /// **'Travel Money'**
  String get appTitle;

  /// button to back to home page
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get buttonHome;

  /// There is no data to return to the user on the screen. There should be no recorded content.
  ///
  /// In en, this message translates to:
  /// **'No trips recorded.'**
  String get emptyList;

  /// Field to enter the destination title/travel control
  ///
  /// In en, this message translates to:
  /// **'Enter your destination'**
  String get inputDestination;

  /// Field to show hint text
  ///
  /// In en, this message translates to:
  /// **'Ex: Italy'**
  String get hintDestination;

  /// Field to remember to enter the destination
  ///
  /// In en, this message translates to:
  /// **'Please indicate a destination'**
  String get inputDestinationWarning;

  /// Field to enter the Budget value
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budgetFieldTitle;

  /// Field show example of hint Budget value
  ///
  /// In en, this message translates to:
  /// **'Ex: \$1000.99'**
  String get hintBudgetFieldTitle;

  /// Field to remember to enter the Budget value
  ///
  /// In en, this message translates to:
  /// **'Please Indicate a Value'**
  String get inputBudgetWarning;

  /// Leading on screen gasto_list
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get leadingGastoList;

  /// Text Field expense
  ///
  /// In en, this message translates to:
  /// **'Expense Title'**
  String get labelTextTitleGasto;

  /// hint Text Field expense
  ///
  /// In en, this message translates to:
  /// **'Ex: Pizza'**
  String get hintTextTitleGasto;

  /// warning Text to add expense
  ///
  /// In en, this message translates to:
  /// **'Please Add the Expense Title'**
  String get warningTextTitleGasto;

  /// Text Field Price
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get labelTextPrecoGasto;

  /// hint Text Field Price
  ///
  /// In en, this message translates to:
  /// **'Ex: \$10.99'**
  String get hintTextPrecoGasto;

  /// Expense Category text widget
  ///
  /// In en, this message translates to:
  /// **'Expense Category:'**
  String get textCategory;

  /// Expense Category text widget
  ///
  /// In en, this message translates to:
  /// **'Payment Method:'**
  String get textPaymentMethod;

  /// warning Text to add expense amount
  ///
  /// In en, this message translates to:
  /// **'Please Add the Expense Amount'**
  String get warningTextPrecoGasto;

  /// Save registration or update
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get buttonSave;

  /// Delete registration
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get buttonDelete;

  /// Organizing a travel budget
  ///
  /// In en, this message translates to:
  /// **'Add trip'**
  String get addTrip;

  /// Welcome !
  ///
  /// In en, this message translates to:
  /// **''**
  String get welcome;

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'Hello {userName}'**
  String hello(String userName);

  /// A message with a formatted double parameter
  ///
  /// In en, this message translates to:
  /// **'{value}'**
  String numberOfDataPoints(double value);

  /// Short date with abbreviated month name and 2-digit year
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String shortDate(DateTime date);

  /// Short time including hour and minute (e.g., 8:37 PM or 20:37)
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String shortTime(DateTime date);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'ja',
        'pt'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'es':
      {
        switch (locale.countryCode) {
          case 'AR':
            return AppLocalizationsEsAr();
          case 'ES':
            return AppLocalizationsEsEs();
          case 'MX':
            return AppLocalizationsEsMx();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
