 import 'package:firebase_auth/firebase_auth.dart';

Future<bool> isEmailRegistered(String email) async {
  try {
    List<String> signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    print('Sign in methods: $signInMethods');
    // If signInMethods is not empty, it means the email is already registered
    return signInMethods.isNotEmpty;
  } catch (e) {
    // Handle error
    print('Error checking if email is registered: $e');
    return false; // Return false in case of error
  }
}
