import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constantColors.dart';
import '../constants/constantVariables.dart';
import '../control/LoginController.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      width: width * 0.95,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: height * 0.35,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ConstantColors.gradientColorRight,
                      ConstantColors.gradientColorLeft,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: const BoxDecoration(
                        color: ConstantColors.gradientColorLeft,
                        shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/firebaselogo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      user.displayName == null
                          ? user.phoneNumber!
                          : user.displayName!,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "userID: ${user.uid.substring(0, 4)}",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text(
              ConstantVariables.logOut,
              style: TextStyle(
                  fontSize: 18.0, color: ConstantColors.logOutTextColor),
            ),
            onTap: () async {
              final provider =
                  Provider.of<FirebaseLogin>(context, listen: false);
              provider.logOut(context);
            },
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget confirmButton = TextButton(
      child: const Text(ConstantVariables.confirm),
      onPressed: () {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
    );
    Widget cancelButton = TextButton(
      child: const Text(ConstantVariables.cancel),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(ConstantVariables.alert),
      content: const Text(
        ConstantVariables.confirmationText,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      actions: [confirmButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
