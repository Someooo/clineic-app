import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'E-Clinic'**
  String get appName;

  /// No description provided for @emptyUserNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get emptyUserNameHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @generalPractitioner.
  ///
  /// In en, this message translates to:
  /// **'General Practitioner'**
  String get generalPractitioner;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @votes.
  ///
  /// In en, this message translates to:
  /// **'Votes'**
  String get votes;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome {name}!'**
  String welcomeUser(Object name);

  /// No description provided for @welcomeUserDenis.
  ///
  /// In en, this message translates to:
  /// **'Welcome Denis H!'**
  String get welcomeUserDenis;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet,'**
  String get welcomeSubtitle;

  /// No description provided for @searchForCategories.
  ///
  /// In en, this message translates to:
  /// **'Search for categories'**
  String get searchForCategories;

  /// No description provided for @doctors.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctors;

  /// No description provided for @hospital.
  ///
  /// In en, this message translates to:
  /// **'Hospital'**
  String get hospital;

  /// No description provided for @hospitals.
  ///
  /// In en, this message translates to:
  /// **'Hospitals'**
  String get hospitals;

  /// No description provided for @listOfHospitals.
  ///
  /// In en, this message translates to:
  /// **'List of Hospitals'**
  String get listOfHospitals;

  /// No description provided for @specialities.
  ///
  /// In en, this message translates to:
  /// **'Specialities'**
  String get specialities;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'logout'**
  String get logout;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @allServices.
  ///
  /// In en, this message translates to:
  /// **'All Services'**
  String get allServices;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @badRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid connection request'**
  String get badRequest;

  /// No description provided for @unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get unauthorized;

  /// No description provided for @forbidden.
  ///
  /// In en, this message translates to:
  /// **'Forbidden'**
  String get forbidden;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get notFound;

  /// No description provided for @notFoundServer.
  ///
  /// In en, this message translates to:
  /// **'Server not found'**
  String get notFoundServer;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'An internal server error occurred'**
  String get internalServerError;

  /// No description provided for @badGateway.
  ///
  /// In en, this message translates to:
  /// **'Invalid gateway connection'**
  String get badGateway;

  /// No description provided for @formValidateError.
  ///
  /// In en, this message translates to:
  /// **'Please ensure all fields are filled'**
  String get formValidateError;

  /// No description provided for @cancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Server communication canceled'**
  String get cancelRequest;

  /// No description provided for @connectionTimeOut.
  ///
  /// In en, this message translates to:
  /// **'Connection to the server timed out'**
  String get connectionTimeOut;

  /// No description provided for @receiveTimeOut.
  ///
  /// In en, this message translates to:
  /// **'Timeout while receiving service from the server'**
  String get receiveTimeOut;

  /// No description provided for @sendTimeOut.
  ///
  /// In en, this message translates to:
  /// **'Timeout while sending service to the server'**
  String get sendTimeOut;

  /// No description provided for @socketException.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get socketException;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!'**
  String get unknownError;

  /// No description provided for @duplicateEmail.
  ///
  /// In en, this message translates to:
  /// **'Email is already in use'**
  String get duplicateEmail;

  /// No description provided for @selectImageError.
  ///
  /// In en, this message translates to:
  /// **'No images selected!'**
  String get selectImageError;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get minute;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get hour;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emptyMobileHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get emptyMobileHint;

  /// No description provided for @notValidMobileHint.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get notValidMobileHint;

  /// No description provided for @emptyEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get emptyEmailHint;

  /// No description provided for @notValidEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get notValidEmailHint;

  /// No description provided for @emptyPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the password'**
  String get emptyPasswordHint;

  /// No description provided for @passwordValidateLengthHint.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least {count} characters'**
  String passwordValidateLengthHint(Object count);

  /// No description provided for @minValidateHint.
  ///
  /// In en, this message translates to:
  /// **'This field must be at least {count} characters'**
  String minValidateHint(Object count);

  /// No description provided for @maxValidateHint.
  ///
  /// In en, this message translates to:
  /// **'This field must be at most {count} characters'**
  String maxValidateHint(Object count);

  /// No description provided for @emptyFieldHint.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty!'**
  String get emptyFieldHint;

  /// No description provided for @notValidNumberHint.
  ///
  /// In en, this message translates to:
  /// **'This field Invalid Number Format!'**
  String get notValidNumberHint;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @checkInternet.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get checkInternet;

  /// No description provided for @addSuccess.
  ///
  /// In en, this message translates to:
  /// **'The {name} added successfully!'**
  String addSuccess(Object name);

  /// No description provided for @editSuccess.
  ///
  /// In en, this message translates to:
  /// **'The {name} updated successfully!'**
  String editSuccess(Object name);

  /// No description provided for @deleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'The {name} deleted successfully!'**
  String deleteSuccess(Object name);

  /// No description provided for @addFailed.
  ///
  /// In en, this message translates to:
  /// **'There is an Error when adding {name} '**
  String addFailed(Object name);

  /// No description provided for @editFailed.
  ///
  /// In en, this message translates to:
  /// **'There is an Error when updating {name} '**
  String editFailed(Object name);

  /// No description provided for @deleteFailed.
  ///
  /// In en, this message translates to:
  /// **'There is an Error when deleting {name} '**
  String deleteFailed(Object name);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No Data Found!'**
  String get noDataFound;

  /// No description provided for @modelNotFound.
  ///
  /// In en, this message translates to:
  /// **'The {name} was not found'**
  String modelNotFound(Object name);

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'user'**
  String get user;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'users'**
  String get users;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'user Name'**
  String get userName;

  /// No description provided for @server.
  ///
  /// In en, this message translates to:
  /// **'server'**
  String get server;

  /// No description provided for @internetConnection.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection'**
  String get internetConnection;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'version'**
  String get version;

  /// No description provided for @loadingInitData.
  ///
  /// In en, this message translates to:
  /// **'Loading System Initialization'**
  String get loadingInitData;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection!'**
  String get noInternetConnection;

  /// No description provided for @cantProceed.
  ///
  /// In en, this message translates to:
  /// **'Can\'t Proceed'**
  String get cantProceed;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'retry'**
  String get retry;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'active'**
  String get active;

  /// No description provided for @inActive.
  ///
  /// In en, this message translates to:
  /// **'inActive'**
  String get inActive;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @expireIn.
  ///
  /// In en, this message translates to:
  /// **'Expire In'**
  String get expireIn;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get name;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save {name}'**
  String save(Object name);

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'language'**
  String get language;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// No description provided for @zipCode.
  ///
  /// In en, this message translates to:
  /// **'Zip Code'**
  String get zipCode;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @countryName.
  ///
  /// In en, this message translates to:
  /// **'Country Name'**
  String get countryName;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back To Home'**
  String get backToHome;

  /// No description provided for @exitHint.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get exitHint;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit {name}'**
  String edit(Object name);

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add {name}'**
  String add(Object name);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete {name}'**
  String delete(Object name);

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get currency;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required Field'**
  String get requiredField;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get search;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @ar.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get ar;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @enterEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterEmailHint;

  /// No description provided for @enterPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter the password'**
  String get enterPasswordHint;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @goToRegister.
  ///
  /// In en, this message translates to:
  /// **'Go to Register'**
  String get goToRegister;

  /// No description provided for @userNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get userNameHint;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'login failed, please try again.'**
  String get loginFailed;

  /// No description provided for @userExists.
  ///
  /// In en, this message translates to:
  /// **'User already exists'**
  String get userExists;

  /// No description provided for @registerFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed, please try again later'**
  String get registerFailed;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get registerSuccess;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'You have successfully logged in.'**
  String get loginSuccess;

  /// No description provided for @goToPay.
  ///
  /// In en, this message translates to:
  /// **'Go to pay'**
  String get goToPay;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'count Of {count}'**
  String count(Object count);

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get unlimited;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'{name} details'**
  String details(Object name);

  /// No description provided for @successPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment completed successfully'**
  String get successPayment;

  /// No description provided for @failedPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment processing failed'**
  String get failedPayment;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @specificCategories.
  ///
  /// In en, this message translates to:
  /// **'Specific Categories'**
  String get specificCategories;

  /// No description provided for @doYouHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do You Have an Account?'**
  String get doYouHaveAccount;

  /// No description provided for @ourClients.
  ///
  /// In en, this message translates to:
  /// **'Our Clients'**
  String get ourClients;

  /// No description provided for @advertisements.
  ///
  /// In en, this message translates to:
  /// **'Advertisements'**
  String get advertisements;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @showAll.
  ///
  /// In en, this message translates to:
  /// **'show all'**
  String get showAll;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'show less'**
  String get showLess;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @joinUs.
  ///
  /// In en, this message translates to:
  /// **'Join us'**
  String get joinUs;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello {name}'**
  String hello(Object name);

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @nameAr.
  ///
  /// In en, this message translates to:
  /// **'Name Arabic'**
  String get nameAr;

  /// No description provided for @nameEn.
  ///
  /// In en, this message translates to:
  /// **'Name English'**
  String get nameEn;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @youAreOffline.
  ///
  /// In en, this message translates to:
  /// **'You are offline'**
  String get youAreOffline;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet'**
  String get noInternet;

  /// No description provided for @internetConnectionRestored.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection Restored'**
  String get internetConnectionRestored;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
