// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'E-Clinic';

  @override
  String get emptyUserNameHint => 'Enter your username';

  @override
  String get password => 'Password';

  @override
  String get generalPractitioner => 'General Practitioner';

  @override
  String get rating => 'Rating';

  @override
  String get votes => 'Votes';

  @override
  String welcomeUser(Object name) {
    return 'Welcome $name!';
  }

  @override
  String get welcomeUserDenis => 'Welcome Denis H!';

  @override
  String get welcomeSubtitle => 'Lorem ipsum dolor sit amet,';

  @override
  String get searchForCategories => 'Search for categories';

  @override
  String get doctors => 'Doctors';

  @override
  String get hospital => 'Hospital';

  @override
  String get hospitals => 'Hospitals';

  @override
  String get listOfHospitals => 'List of Hospitals';

  @override
  String get specialities => 'Specialities';

  @override
  String get profile => 'Profile';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get logout => 'logout';

  @override
  String get categories => 'Categories';

  @override
  String get allServices => 'All Services';

  @override
  String get error => 'Error';

  @override
  String get now => 'Now';

  @override
  String get badRequest => 'Invalid connection request';

  @override
  String get unauthorized => 'Unauthorized';

  @override
  String get forbidden => 'Forbidden';

  @override
  String get notFound => 'Not found';

  @override
  String get notFoundServer => 'Server not found';

  @override
  String get internalServerError => 'An internal server error occurred';

  @override
  String get badGateway => 'Invalid gateway connection';

  @override
  String get formValidateError => 'Please ensure all fields are filled';

  @override
  String get cancelRequest => 'Server communication canceled';

  @override
  String get connectionTimeOut => 'Connection to the server timed out';

  @override
  String get receiveTimeOut =>
      'Timeout while receiving service from the server';

  @override
  String get sendTimeOut => 'Timeout while sending service to the server';

  @override
  String get socketException => 'Check your internet connection';

  @override
  String get unknownError => 'Something went wrong!';

  @override
  String get duplicateEmail => 'Email is already in use';

  @override
  String get selectImageError => 'No images selected!';

  @override
  String get success => 'Success';

  @override
  String get message => 'Message';

  @override
  String get status => 'Status';

  @override
  String get minute => 'Minute';

  @override
  String get hours => 'Hours';

  @override
  String get hour => 'Hour';

  @override
  String get day => 'Day';

  @override
  String get days => 'Days';

  @override
  String get year => 'Year';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get emptyMobileHint => 'Enter your phone number';

  @override
  String get notValidMobileHint => 'Invalid phone number';

  @override
  String get emptyEmailHint => 'Enter your email address';

  @override
  String get notValidEmailHint => 'Invalid email address';

  @override
  String get emptyPasswordHint => 'Enter the password';

  @override
  String passwordValidateLengthHint(Object count) {
    return 'Password must be at least $count characters';
  }

  @override
  String minValidateHint(Object count) {
    return 'This field must be at least $count characters';
  }

  @override
  String maxValidateHint(Object count) {
    return 'This field must be at most $count characters';
  }

  @override
  String get emptyFieldHint => 'This field cannot be empty!';

  @override
  String get notValidNumberHint => 'This field Invalid Number Format!';

  @override
  String get loading => 'Loading...';

  @override
  String get checkInternet => 'Please check your internet connection';

  @override
  String addSuccess(Object name) {
    return 'The $name added successfully!';
  }

  @override
  String editSuccess(Object name) {
    return 'The $name updated successfully!';
  }

  @override
  String deleteSuccess(Object name) {
    return 'The $name deleted successfully!';
  }

  @override
  String addFailed(Object name) {
    return 'There is an Error when adding $name ';
  }

  @override
  String editFailed(Object name) {
    return 'There is an Error when updating $name ';
  }

  @override
  String deleteFailed(Object name) {
    return 'There is an Error when deleting $name ';
  }

  @override
  String get settings => 'Settings';

  @override
  String get noDataFound => 'No Data Found!';

  @override
  String modelNotFound(Object name) {
    return 'The $name was not found';
  }

  @override
  String get user => 'user';

  @override
  String get users => 'users';

  @override
  String get network => 'Network';

  @override
  String get userName => 'user Name';

  @override
  String get server => 'server';

  @override
  String get internetConnection => 'Internet Connection';

  @override
  String get version => 'version';

  @override
  String get loadingInitData => 'Loading System Initialization';

  @override
  String get noInternetConnection => 'No Internet Connection!';

  @override
  String get cantProceed => 'Can\'t Proceed';

  @override
  String get retry => 'retry';

  @override
  String get active => 'active';

  @override
  String get inActive => 'inActive';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get expireIn => 'Expire In';

  @override
  String get or => 'or';

  @override
  String get name => 'name';

  @override
  String save(Object name) {
    return 'save $name';
  }

  @override
  String get language => 'language';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get otp => 'OTP';

  @override
  String get zipCode => 'Zip Code';

  @override
  String get city => 'City';

  @override
  String get countryName => 'Country Name';

  @override
  String get category => 'Category';

  @override
  String get quantity => 'Quantity';

  @override
  String get price => 'Price';

  @override
  String get total => 'Total';

  @override
  String get back => 'Back';

  @override
  String get backToHome => 'Back To Home';

  @override
  String get exitHint => 'Press back again to exit';

  @override
  String edit(Object name) {
    return 'Edit $name';
  }

  @override
  String add(Object name) {
    return 'Add $name';
  }

  @override
  String delete(Object name) {
    return 'Delete $name';
  }

  @override
  String get currency => 'SAR';

  @override
  String get requiredField => 'Required Field';

  @override
  String get search => 'search';

  @override
  String get print => 'Print';

  @override
  String get ar => 'العربية';

  @override
  String get en => 'English';

  @override
  String get register => 'Register';

  @override
  String get enterEmailHint => 'Please enter your email';

  @override
  String get enterPasswordHint => 'Please enter the password';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get goToRegister => 'Go to Register';

  @override
  String get userNameHint => 'Please enter your username';

  @override
  String get loginFailed => 'login failed, please try again.';

  @override
  String get userExists => 'User already exists';

  @override
  String get registerFailed => 'Registration failed, please try again later';

  @override
  String get registerSuccess => 'Account created successfully';

  @override
  String get loginSuccess => 'You have successfully logged in.';

  @override
  String get goToPay => 'Go to pay';

  @override
  String get free => 'Free';

  @override
  String count(Object count) {
    return 'count Of $count';
  }

  @override
  String get duration => 'Duration';

  @override
  String get month => 'Month';

  @override
  String get product => 'Product';

  @override
  String get unlimited => 'Unlimited';

  @override
  String get pay => 'Pay';

  @override
  String details(Object name) {
    return '$name details';
  }

  @override
  String get successPayment => 'Payment completed successfully';

  @override
  String get failedPayment => 'Payment processing failed';

  @override
  String get image => 'Image';

  @override
  String get allCategories => 'All Categories';

  @override
  String get specificCategories => 'Specific Categories';

  @override
  String get doYouHaveAccount => 'Do You Have an Account?';

  @override
  String get ourClients => 'Our Clients';

  @override
  String get advertisements => 'Advertisements';

  @override
  String get faq => 'FAQ';

  @override
  String get showAll => 'show all';

  @override
  String get showLess => 'show less';

  @override
  String get title => 'Title';

  @override
  String get send => 'Send';

  @override
  String get joinUs => 'Join us';

  @override
  String hello(Object name) {
    return 'Hello $name';
  }

  @override
  String get notifications => 'Notifications';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get yearly => 'Yearly';

  @override
  String get daily => 'Daily';

  @override
  String get confirm => 'Confirm';

  @override
  String get apply => 'Apply';

  @override
  String get nameAr => 'Name Arabic';

  @override
  String get nameEn => 'Name English';

  @override
  String get warning => 'Warning';

  @override
  String get youAreOffline => 'You are offline';

  @override
  String get noInternet => 'No Internet';

  @override
  String get internetConnectionRestored => 'Internet Connection Restored';

  @override
  String get connected => 'Connected';
}
