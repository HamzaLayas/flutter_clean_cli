import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../localization/generated/l10n.dart';

extension Validations on String {
  emptyFieldValidation(BuildContext context) {
    if (isEmpty) return S.of(context).requiredField;
    return null;
  }

  userNameValidator(BuildContext context) {
    if (isEmpty) return S.of(context).requiredField;
    if (length < 3) return S.of(context).invalidUsername;
    return null;
  }

  emailValidation(BuildContext context) {
    final pattern = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (isEmpty) return S.of(context).requiredField;
    if (!contains('@') || !pattern.hasMatch(this)) {
      return S.of(context).invalidEmail;
    }

    return null;
  }

  phoneValidation(BuildContext context) {
    final pattern = RegExp(
      r'^(?=\p{Nd}{10}$)09[1-4]\p{Nd}{7}$',
      unicode: true,
    );
    if (isEmpty) return S.of(context).requiredField;
    if (!pattern.hasMatch(this)) {
      return S.of(context).invalidPhone;
    }
    return null;
  }

  passwordValidation(BuildContext context) {
    if (isEmpty) return S.of(context).requiredField;
    if (length < 8) return S.of(context).invalidPassword;

    return null;
  }

  confirmPasswordValidation(BuildContext context,
      {required String newPassController}) {
    if (isEmpty) return S.of(context).requiredField;
    if (length < 8) return S.of(context).invalidPassword;

    if (this != newPassController) {
      return S.of(context).invalidConfirmPassword;
    }

    return null;
  }

  phoneNumberWithCode(BuildContext context) {
    if (startsWith('0')) {
      return '218${substring(1)}';
    }
    return this;
  }

  otpFieldValidation(BuildContext context) {
    if (length < 4) return S.of(context).requiredField;
    return null;
  }
}

class WesternDigitInputFormatter extends TextInputFormatter {
  static const _arabicIndic = 0x0660;
  static const _easternArabic = 0x06F0;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final buffer = StringBuffer();
    for (final codeUnit in newValue.text.codeUnits) {
      if (codeUnit >= _arabicIndic && codeUnit <= _arabicIndic + 9) {
        buffer.writeCharCode((codeUnit - _arabicIndic) + 48);
      } else if (codeUnit >= _easternArabic && codeUnit <= _easternArabic + 9) {
        buffer.writeCharCode((codeUnit - _easternArabic) + 48);
      } else {
        buffer.writeCharCode(codeUnit);
      }
    }

    final normalized = buffer.toString();
    final offsetDiff = newValue.text.length - normalized.length;
    final newOffset =
        (newValue.selection.end - offsetDiff).clamp(0, normalized.length);

    return TextEditingValue(
      text: normalized,
      selection: TextSelection.collapsed(offset: newOffset),
    );
  }
}
