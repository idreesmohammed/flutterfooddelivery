import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/constantVariables.dart';

class FirebaseLogin extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final googleSignOut = GoogleSignIn();

  String authStatus = "";
  String oTP = "";
  List<String> userCredentials = [];
  GoogleSignInAccount? user;
  GoogleSignInAccount get users => user!;
  bool otpCodeVisible = true;
  Future signInViaGoogle(context) async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  //
  Future logOut(context) async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();

    notifyListeners();
  }

  Future logOutMobile() async {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future loginViaPhone(phoneNumber, hideButton) async {
    final auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (AuthCredential authCredential) async {
          await FirebaseAuth.instance
              .signInWithCredential(authCredential)
              .then((value) {
            if (value.user != null) {
              print('logged in');
            }
          });
        },
        verificationFailed: (FirebaseAuthException authException) {
          authStatus = "Failed";
        },
        codeSent: (String verId, int? resendToken) {
          oTP = verId;
          hideButton = otpCodeVisible;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verId) {},
        timeout: const Duration(seconds: 60));
    notifyListeners();
  }

  verifyCOde(otpCode, context) async {
    final auth = FirebaseAuth.instance;
    //getOtp
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: oTP, smsCode: otpCode);
    await auth.signInWithCredential(credential).then((value) {
      if (value == null) {
        var snackBar = const SnackBar(
          content: Text(ConstantVariables.invalidOtp),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
