class Password {
  const Password({required this.value});

  final String value;

  bool isValid() => value.length >= 6;
}
