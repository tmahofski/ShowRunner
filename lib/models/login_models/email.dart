RegExp kEmailExpression = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

class Email {
  const Email({required this.value});

  final String value;

  bool isValid() => kEmailExpression.hasMatch(value);
}
