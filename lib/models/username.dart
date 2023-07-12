class Username {
  const Username(
      {required this.value, required this.isDirty, required this.hasFocus});

  final String value;
  final bool isDirty;
  final bool hasFocus;

  bool isValid() => value.isNotEmpty;

  Username focusedEvent(bool isFocused) {
    return Username(value: value, isDirty: true, hasFocus: isFocused);
  }

  displayError() {
    if (!isValid() && isDirty && !hasFocus) {
      return "username cannot be empty";
    }
  }
}
