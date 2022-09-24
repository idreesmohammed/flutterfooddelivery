import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../constants/constantColors.dart';
import '../constants/constantVariables.dart';
import '../control/LoginController.dart';
import 'homePage.dart';
import 'loginPage.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({Key? key}) : super(key: key);

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  var phoneController = TextEditingController();
  var otpController = TextEditingController();
  bool isLoading = false;
  bool getOtp = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          return WillPopScope(
            onWillPop: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              return Future.value(false);
            },
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: ConstantVariables.enterYourNumber,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                              filled: true,
                              fillColor: ConstantColors.gradientColorLeft),
                        )),
                    Visibility(
                      visible: getOtp,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: otpController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: ConstantVariables.getOTP,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                                filled: true,
                                fillColor: ConstantColors.gradientColorLeft),
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            if (phoneController.text.length != 10 ||
                                phoneController.text.isEmpty) {
                              const snackBar = SnackBar(
                                content: Text(ConstantVariables.invalidNumber),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {
                                isLoading = false;
                              });
                            } else if (getOtp == false) {
                              setState(() {
                                getOtp = !getOtp;
                              });
                              setState(() {
                                isLoading = false;
                              });
                              final provider = Provider.of<FirebaseLogin>(
                                  context,
                                  listen: false);
                              provider.loginViaPhone(
                                '+91${phoneController.text}',
                                getOtp,
                              );
                            } else if (getOtp == true) {
                              setState(() {
                                isLoading = false;
                              });
                              final provider = Provider.of<FirebaseLogin>(
                                  context,
                                  listen: false);
                              provider.verifyCOde(otpController.text, context);
                            }
                          } catch (_) {
                            const snackBar = SnackBar(
                              content: Text(ConstantVariables.invalidNumber),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text(getOtp == false
                            ? ConstantVariables.getOtpButton
                            : ConstantVariables.submit)),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
