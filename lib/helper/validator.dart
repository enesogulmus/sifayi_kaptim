class Validator {
  static isNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field cannot be left blank.';
    }
    return null;
  }
}
