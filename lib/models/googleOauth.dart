import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Sign in with Google account.
  ///
  /// Returns [User] if successful, else returns null.
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger Google sign-in flow
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        print('Google sign-in cancelled by user');
        return null;
      }

      // Get Google authentication credentials
      final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with Google credentials
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      // Save user data to Firestore
      if (user != null) {
        await _saveUserDataToFirestore(user);
      }

      return user;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  /// Save user data to Firestore after successful sign-in.
  Future<void> _saveUserDataToFirestore(User user) async {
    try {
      final DocumentReference userRef = _firestore.collection('users').doc(user.uid);

      final userData = {
        'uid': user.uid,
        'displayName': user.displayName ?? '',
        'email': user.email ?? '',
        'phoneNumber': user.phoneNumber ?? '',
        'photoURL': user.photoURL ?? '',
        'lastSignInTime': user.metadata.lastSignInTime,
        'creationTime': user.metadata.creationTime,
      };

      await userRef.set(userData, SetOptions(merge: true));
    } catch (e) {
      print('Error saving user data to Firestore: $e');
      throw e; // Rethrow the error to handle it higher up the call stack
    }
  }

  /// Sign out the current Google user.
  ///
  /// This method signs out the user from both FirebaseAuth and GoogleSignIn.
  void signOutGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print("User Signed Out");
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
