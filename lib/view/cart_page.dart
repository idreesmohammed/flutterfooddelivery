import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/constants/constantColors.dart';
import 'package:fooddeliveryapp/view/homePage.dart';
import 'package:collection/collection.dart';
import 'package:fooddeliveryapp/view/orderPlacedSuccessfulPage.dart';
import 'package:provider/provider.dart';

import '../constants/constantVariables.dart';
import '../control/homePageProvider.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({Key? key}) : super(key: key);

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cartcontrol = Provider.of<HomePageProvider>(context);
    final homeprovider = Provider.of<HomePageProvider>(context);
    setState(() {});
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // Provider.of<HomePageProvider>(context, listen: false)
                //     .removingFromHomePage();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ConstantColors.grey,
              )),
          title: const Text(
            ConstantVariables.orderSummary,
            style: TextStyle(color: ConstantColors.grey),
          ),
          backgroundColor: ConstantColors.white,
        ),
        body: cartcontrol.cartList.isEmpty
            ? SizedBox(
                height: height,
                width: width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(ConstantVariables.noItem),
                      TextButton(
                          onPressed: () {
                            // Provider.of<HomePageProvider>(context,
                            //         listen: false)
                            //     .removingFromHomePage();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text(ConstantVariables.continueShopping))
                    ]),
              )
            : Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Card(
                          elevation: 10.0,
                          child: SizedBox(
                            height: height * 0.7,
                            width: width * 0.95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                      width: width * 0.95,
                                      height: height * 0.08,
                                      decoration: const BoxDecoration(
                                        color: ConstantColors
                                            .orderSummaryTextColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${homeprovider.totalCartList.length.toString()} Dishes - ${cartcontrol.cartList.length} Items",
                                          style: const TextStyle(
                                              color: ConstantColors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0, top: 5.0),
                                    child: SizedBox(
                                      height: height * 0.55,
                                      child: Consumer<HomePageProvider>(
                                        builder: (context, value, chile) {
                                          return ListView.builder(
                                              itemCount:
                                                  cartcontrol.cartList.length,
                                              itemBuilder: (context, index1) {
                                                return Container(
                                                  height: height * 0.23,
                                                  width: width * 0.95,
                                                  decoration: BoxDecoration(
                                                      //color: Colors.red,
                                                      border: Border(
                                                    bottom: BorderSide(
                                                        width: width * 0.003,
                                                        color: ConstantColors
                                                            .grey),
                                                  )),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20.0),
                                                        child: SizedBox(
                                                          height: height * 0.03,
                                                          width: width * 0.06,
                                                          child: Image.asset(
                                                            'assets/veg.png',
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 5.0,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15.0),
                                                          child: SizedBox(
                                                            width: width * 0.3,
                                                            //color: Colors.grey,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  value
                                                                      .cartList[
                                                                          index1]
                                                                      .dishName
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          20.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.03,
                                                                ),
                                                                Text(
                                                                  "INR ${value.cartList[index1].dishPrice.toString()}",
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.01,
                                                                ),
                                                                Text(
                                                                  "${value.cartList[index1].dishCalories.toString()} Calories",
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Container(
                                                            width: width * 0.32,
                                                            height:
                                                                height * 0.05,
                                                            decoration: const BoxDecoration(
                                                                color: ConstantColors
                                                                    .orderSummaryTextColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            40))),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          10.0),
                                                                  height:
                                                                      height *
                                                                          0.13,
                                                                  child:
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            if (value.cartList.isEmpty) {
                                                                              return;
                                                                            }
                                                                            if (value.cartList[index1].incrementOrDecrement !=
                                                                                0) {
                                                                              value.decrementItem(value.cartList[index1]);
                                                                              value.totalCartList.remove(value.cartList[index1]);
                                                                              value.totalAmount = value.totalCartList.map((e) => e.dishPrice!).toList().sum;
                                                                              if (value.cartList[index1].incrementOrDecrement == 0) {
                                                                                value.cartList.remove(value.cartList[index1]);
                                                                              }
                                                                            } else {
                                                                              return;
                                                                            }
                                                                          },
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.remove_outlined,
                                                                            color:
                                                                                ConstantColors.white,
                                                                          )),
                                                                ),
                                                                Text(
                                                                  value
                                                                      .cartList[
                                                                          index1]
                                                                      .incrementOrDecrement
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          15.0,
                                                                      color: ConstantColors
                                                                          .white),
                                                                ),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      value
                                                                          .incrementItem(
                                                                        value.cartList[
                                                                            index1],
                                                                      );
                                                                      value
                                                                          .totalCartList
                                                                          .add(value
                                                                              .cartList[index1]);
                                                                      value.totalAmount = value
                                                                          .totalCartList
                                                                          .map((e) =>
                                                                              e.dishPrice!)
                                                                          .toList()
                                                                          .sum;
                                                                      if (value
                                                                          .cartList
                                                                          .contains(
                                                                              value.cartList[index1])) {
                                                                        return;
                                                                      } else {
                                                                        value
                                                                            .cartList
                                                                            .add(value.cartList[index1]);
                                                                      }
                                                                    },
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: ConstantColors
                                                                            .white))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 15.0,
                                                                left: 5.0),
                                                        child: SizedBox(
                                                          height: height * 0.23,
                                                          child: Text(
                                                            "INR ${value.cartList[index1].dishPrice.toString()}",
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cartcontrol.cartList
                              .map((e) => e.incrementOrDecrement = 0)
                              .toList();

                          cartcontrol.cartList = [];
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SuccessfulPage()))
                              .then((value) => refresh());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                              height: height * 0.07,
                              width: width * 0.9,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: ConstantColors.orderSummaryTextColor,
                              ),
                              child: const Center(
                                child: Text(
                                  ConstantVariables.placeOrder,
                                  style: TextStyle(
                                      color: ConstantColors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 23.0),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: height * 0.65,
                      left: width * 0.05,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: SizedBox(
                          height: height * 0.08,
                          width: width * 0.83,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                ConstantVariables.totalAmount,
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Consumer<HomePageProvider>(
                                  builder: (context, value, child) {
                                return Text(
                                  "INR  ${value.totalAmount.round()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      color: ConstantColors.gradientColorLeft),
                                );
                              })
                            ],
                          ),
                        ),
                      ))
                ],
              ),
      ),
    );
  }

  // fun() {
  //   final homeprovider = Provider.of<HomePageProvider>(context);
  //   for (categoryDish in homeprovider.cartList) {}
  // }
}
