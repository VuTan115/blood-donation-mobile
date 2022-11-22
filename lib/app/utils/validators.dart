String? emailValidator(String value) {
  if (value.isEmpty) {
    return 'Please enter your email address';
  }
  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
      .hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}
