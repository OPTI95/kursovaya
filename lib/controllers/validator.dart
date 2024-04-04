import 'package:wallet/controllers/wallet_bd.dart';

class Validator {
  static bool isValidString(String value, int minLength, int maxLength) {
    return value != null &&
        value.isNotEmpty &&
        value.length >= minLength &&
        value.length <= maxLength &&
        (RegExp(r'^[a-zA-Z]+$').hasMatch(value) ||
            RegExp(r'^[0-9]+$').hasMatch(value));
  }

  static bool isValidDate(DateTime value) {
    return value != null;
  }
}

class DataValidator {
  static bool validate(PersonData data) {
    return Validator.isValidString(data.secondName, 1, 64) &&
        Validator.isValidString(data.firstName, 1, 64) &&
        Validator.isValidString(data.thirdName, 1, 64) &&
        Validator.isValidString(data.snils, 1, 64) &&
        Validator.isValidString(data.inn, 1, 64) &&
        Validator.isValidString(data.polisOMS, 1, 64) &&
        Validator.isValidString(data.numberPassport, 1, 64) &&
        Validator.isValidString(data.seriaPassport, 1, 64) &&
        Validator.isValidString(data.fromIssues, 1, 64) &&
        Validator.isValidString(data.codePassport, 1, 64) &&
        Validator.isValidString(data.placeBorn, 1, 64) &&
        Validator.isValidString(data.gender, 1, 64) &&
        Validator.isValidDate(data.dateBorn) &&
        Validator.isValidDate(data.dateExit);
  }
}
