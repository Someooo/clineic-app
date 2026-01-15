import '../localization/l10n.dart';

mixin FormValidationMixin {
  final _passwordRegEx = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  final _upperCaseRegEx = RegExp(r'[A-Z]');

  final _lowerCaseRegEx = RegExp(r'[a-z]');

  final _numberRegEx = RegExp(r'[0-9]');

  final _emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  final _mobileRegEx = RegExp(r'^[0-9]{10}$');

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.t.emptyUserNameHint;
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.t.emptyMobileHint;
    }
    if (!_mobileRegEx.hasMatch(value)) {
      return L10n.t.notValidMobileHint;
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.t.emptyFieldHint;
    }
    if (!_numberRegEx.hasMatch(value)) {
      return L10n.t.notValidNumberHint;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.t.emptyEmailHint;
    }
    if (!_emailRegEx.hasMatch(value)) {
      return L10n.t.notValidEmailHint;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.t.emptyPasswordHint;
    }

    if (value.length < 5) {
      return L10n.t.passwordValidateLengthHint('5');
    }

    if (!value.contains(_upperCaseRegEx)) {
      // return 'Password must contain at least 1 uppercase letter';
      return null;
    }

    if (!value.contains(_lowerCaseRegEx)) {
      // return 'Password must contain at least 1 lowercase letter';
      return null;
    }

    if (!value.contains(_numberRegEx)) {
      // return 'Password must contain at least 1 number';
      return null;
    }

    if (!_passwordRegEx.hasMatch(value)) {
      // return 'Password must contain at least 1 uppercase letter, 1 lowercase letter and 1 number';
      return null;
    }
    return null;
  }

  String? validateLength({
    required String? value,
    required int minLength,
    required int maxLength,
  }) {
    if (value == null || value.isEmpty) {
      return L10n.t.emptyFieldHint;
    }
    if (value.length < minLength) {
      return L10n.t.minValidateHint(minLength.toString());
    }
    if (value.length > maxLength) {
      return L10n.t.maxValidateHint(maxLength.toString());
    }
    return null;
  }

  String? validateEmailOrPhone(String? value) {
    final emailError = validateEmail(value);
    final mobileError = validateMobile(value);
    if (emailError != null && mobileError != null) {
      return "${L10n.t.notValidEmailHint} ${L10n.t.or} ${L10n.t.notValidMobileHint}";
    }
    return null;
  }
}
