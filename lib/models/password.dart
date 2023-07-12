class Password {
  const Password(
      {required this.value, required this.isDirty, required this.hasFocus});

  final String value;
  final bool isDirty;
  final bool hasFocus;

  bool isValid() => value.length >= 6;

  displayError() {
    if (!isValid() && isDirty && !hasFocus) {
      return "password must be at least 6 characters";
    }
  }
}
