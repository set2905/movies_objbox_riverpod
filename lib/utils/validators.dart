
abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({required this.regexSource});

  final String regexSource;

  @override
  bool isValid(String value) {
    try {
      final RegExp regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);

      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }

      return false;
    } catch (e) {
      assert(false, e.toString());
      return true;
    }
  }
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
    if (value.length != 4) return false;
    int? year = int.tryParse(value);
    if (year == null) return false;
    return true;
  }
}
