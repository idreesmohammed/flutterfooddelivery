import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/constants/constantVariables.dart';
import 'package:fooddeliveryapp/view/homePage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../control/homePageProvider.dart';
import 'cart_page.dart';

class SuccessfulPage extends StatefulWidget {
  const SuccessfulPage({Key? key}) : super(key: key);

  @override
  State<SuccessfulPage> createState() => _SuccessfulPageState();
}

class _SuccessfulPageState extends State<SuccessfulPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Provider.of<HomePageProvider>(context, listen: false).clearData();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: height * 0.9,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Lottie.network(
                      'https://assets6.lottiefiles.com/packages/lf20_vuliyhde.json',
                      repeat: false)),
              const Text(
                ConstantVariables.orderPlaced,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
