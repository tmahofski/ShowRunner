RegExp kEmailExpression = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

class Email {
  const Email(
      {required this.value, required this.isDirty, required this.hasFocus});

  final String value;
  final bool isDirty;
  final bool hasFocus;

  String? displayError() {
    if (isDirty && !hasFocus) {
      if (value.isEmpty) {
        return 'email is required';
      } else if (!isValid()) {
        return 'email is not in valid format';
      }
    }

    return null;
  }

  bool isValid() => kEmailExpression.hasMatch(value);
}
