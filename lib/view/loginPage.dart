import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fooddeliveryapp/constants/constantColors.dart';
import 'package:fooddeliveryapp/constants/constantVariables.dart';
import 'package:fooddeliveryapp/control/LoginController.dart';
import 'package:fooddeliveryapp/view/otpLoginPage.dart';

import 'package:provider/provider.dart';

import 'homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              SystemNavigator.pop();
              return Future.value(false);
            },
            child: Scaffold(
              body: SizedBox(
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    SizedBox(
                      height: height * 0.55,
                      width: width,
                      child: Center(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: height * 0.3,
                          width: width * 0.4,
                          child: Image.asset("assets/firebaselogo.png"),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        final provider =
                            Provider.of<FirebaseLogin>(context, listen: false);
                        provider.signInViaGoogle(context);
                      },
                      child: customButton(
                          height,
                          width,
                          const BoxDecoration(
                              color: ConstantColors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          Image.asset(
                            "assets/googleLogoRound.png",
                            fit: BoxFit.contain,
                          ),
                          ConstantVariables.google),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EnterOtp()));
                        // BaseModel baseModel =
                        //     Provider.of<GetDataFromModel>(context, listen: false)
                        //         .getAllItems() as BaseModel;
                        // print('baseModel: ${baseModel}');
                      },
                      child: customButton(
                        height,
                        width,
                        const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ConstantColors.gradientColorLeft,
                                ConstantColors.gradientColorRight,
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        const Icon(
                          Icons.phone,
                          color: ConstantColors.white,
                        ),
                        ConstantVariables.phone,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Padding customButton(
    double height,
    double width,
    decoration,
    child,
    text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
      child: Container(
        height: height * 0.08,
        width: width * 0.8,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.05,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              height: height * 0.1,
              width: width * 0.08,

              //color: Colors.blue,
              child: child,
            ),
            SizedBox(
              width: width * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: ConstantColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
