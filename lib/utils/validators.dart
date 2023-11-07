abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  MinLengthStringValidator(this.minLength);
  final int minLength;

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}

class MaxLengthStringValidator extends StringValidator {
  MaxLengthStringValidator(this.maxLength);
  final int maxLength;

  @override
  bool isValid(String value) {
    return value.length <= maxLength;
  }
}

class StringYearValidator extends StringValidator {
  StringYearValidator();
  @override
  bool isValid(String value) {
    int? year = int.tryParse(value);
    if (year == null) return false;
    if (year.toString().length != 4) return false;
    return true;
  }
}
