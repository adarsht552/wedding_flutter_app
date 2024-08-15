import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> sendOtp(String number) async {
    Completer<String> completer = Completer();

    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
        completer.completeError(e); // Complete with error
      },
      codeSent: (String verificationIdFromCallback, int? resendToken) {
        print('Code sent to $number');
        completer.complete(verificationIdFromCallback);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Auto retrieval timeout');
      },
    );

    return completer.future;
  }

  Future<bool> signInWithOtp(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      return true; // Return true if sign-in succeeds
    } catch (e) {
      print('Error signing in with OTP: $e');
      return false; // Return false if sign-in fails
    }
  }
}
