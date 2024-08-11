import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<UserCredential?> signInWithGitHub() async {
  try {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(githubProvider);
  } catch (e) {
    debugPrint('GitHub Sign-In Error: $e');
    return null;
  }
}
