
 
/// Simple form validators used across the app.
String? validateEmail(String? email) {
  if (email == null || email.isEmpty) return 'Enter the email';
  if (!email.contains('@') || !email.contains('.')) return 'Enter a valid email';
  return null;
}

String? validatePassword(String? password) {
	if (password == null || password.isEmpty) return 'Enter the password';
	if (password.length < 6) return 'Password must be at least 6 characters';
	return null;
}


