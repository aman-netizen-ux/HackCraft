import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithGitHub() async {
  // Create a new provider
  GithubAuthProvider githubProvider = GithubAuthProvider();

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithPopup(githubProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(githubProvider);
}
