import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddeliveryapp/constants/constantVariables.dart';
import 'package:collection/collection.dart';
import 'package:fooddeliveryapp/view/cart_page.dart';
import 'package:provider/provider.dart';
import '../constants/constantColors.dart';
import '../control/homePageProvider.dart';
import 'appDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final homeprovider = Provider.of<HomePageProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return homeprovider.tableMenuList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : DefaultTabController(
            length: homeprovider.tableMenuList.length,
            initialIndex: 0,
            child: WillPopScope(
              onWillPop: () {
                SystemNavigator.pop();
                return Future.value(false);
              },
              child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: height * 0.09,
                    backgroundColor: ConstantColors.white,
                    leading: Builder(builder: (BuildContext context) {
                      return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu,
                              color: ConstantColors.appDrawerColor));
                    }),
                    actions: [
                      Badge(
                        position: BadgePosition.topEnd(top: 0, end: 1),
                        showBadge:
                            homeprovider.totalCartList.length.toString() == 0
                                ? false
                                : true,
                        badgeColor: ConstantColors.white,
                        shape: BadgeShape.circle,
                        borderRadius: BorderRadius.circular(8),
                        badgeContent: Text(
                          homeprovider.totalCartList.length.toString(),
                          style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: ConstantColors.grey),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: ConstantColors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CartPageScreen()));
                          },
                        ),
                        //homeprovider.totalCartList.length.toString(),
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(10.0),
                      child: TabBar(
                          labelColor: ConstantColors.selectedLabelColor,
                          unselectedLabelColor:
                              ConstantColors.unselectedLabelColor,
                          isScrollable: true,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: ConstantColors.selectedLabelColor,
                          tabs: [
                            for (int i = 0;
                                i < homeprovider.tableMenuList.length;
                                i++)
                              SizedBox(
                                width: width * 0.4,
                                child: Tab(
                                  child: Text(homeprovider
                                      .tableMenuList[i].menuCategory
                                      .toString()),
                                ),
                              ),
                          ]),
                    ),
                  ),
                  drawer: const AppDrawer(),
                  body: TabBarView(children: [
                    for (int i = 0; i < homeprovider.tableMenuList.length; i++)
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        height: height * 0.2,
                        width: width,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            border: Border(
                          bottom: BorderSide(
                              width: width * 0.003, color: ConstantColors.grey),
                        )),
                        child: homeprovider.categoryDish.isEmpty
                            ? const Center(child: Text("Empty"))
                            : Consumer<HomePageProvider>(
                                builder: (context, value, child) {
                                return ListView.separated(
                                  itemCount: value
                                      .tableMenuList[i].categoryDishes!.length,
                                  itemBuilder: (context, index1) {
                                    return SizedBox(
                                      height: height * 0.26,
                                      width: width,
                                      //color: Colors.red,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.8,
                                            //color: Colors.blue,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: height * 0.05,
                                                  // color: Colors.green,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: height * 0.03,
                                                        width: width * 0.06,
                                                        child: Image.asset(
                                                          'assets/veg.png',
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          value
                                                              .tableMenuList[i]
                                                              .categoryDishes![
                                                                  index1]
                                                              .dishName
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.05,
                                                  width: width * 0.7,
                                                  //color: Colors.white,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        "INR",
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        value
                                                            .tableMenuList[i]
                                                            .categoryDishes![
                                                                index1]
                                                            .dishPrice
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: width * (0.3),
                                                      ),
                                                      Text(
                                                        "${value.tableMenuList[i].categoryDishes![index1].dishCalories.toString()} Calories",
                                                        style: const TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: height * 0.07,
                                                    width: width * 0.7,
                                                    //color: Colors.grey,
                                                    child: Text(
                                                      value
                                                          .tableMenuList[i]
                                                          .categoryDishes![
                                                              index1]
                                                          .dishDescription
                                                          .toString(),
                                                    )),
                                                SizedBox(
                                                    height: height * 0.06,
                                                    width: width * 0.7,
                                                    //color: Colors.blue,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: width * 0.32,
                                                          height: height * 0.05,
                                                          decoration: const BoxDecoration(
                                                              color: ConstantColors
                                                                  .gradientColorRight,
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
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            10.0),
                                                                height: height *
                                                                    0.13,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (value
                                                                              .cartList
                                                                              .isEmpty) {
                                                                            return;
                                                                          }

                                                                          if (value.tableMenuList[i].categoryDishes![index1].incrementOrDecrement !=
                                                                              0) {
                                                                            value.decrementItem(value.tableMenuList[i].categoryDishes![index1]);
                                                                            value.totalCartList.remove(value.tableMenuList[i].categoryDishes![index1]);

                                                                            value.totalAmount =
                                                                                value.totalCartList.map((e) => e.dishPrice!).toList().sum;
                                                                            if (value.tableMenuList[i].categoryDishes![index1].incrementOrDecrement ==
                                                                                0) {
                                                                              value.cartList.remove(value.tableMenuList[i].categoryDishes![index1]);
                                                                            }
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        },
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .remove_outlined,
                                                                          color:
                                                                              ConstantColors.white,
                                                                        )),
                                                              ),
                                                              Text(
                                                                value
                                                                    .tableMenuList[
                                                                        i]
                                                                    .categoryDishes![
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
                                                                      value
                                                                          .tableMenuList[
                                                                              i]
                                                                          .categoryDishes![index1],
                                                                    );
                                                                    value.totalCartList.add(value
                                                                        .tableMenuList[
                                                                            i]
                                                                        .categoryDishes![index1]);
                                                                    value.totalAmount = value
                                                                        .totalCartList
                                                                        .map((e) =>
                                                                            e.dishPrice!)
                                                                        .toList()
                                                                        .sum;
                                                                    if (value
                                                                        .cartList
                                                                        .contains(value
                                                                            .tableMenuList[i]
                                                                            .categoryDishes![index1])) {
                                                                      return;
                                                                    } else {
                                                                      value.cartList.add(value
                                                                          .tableMenuList[
                                                                              i]
                                                                          .categoryDishes![index1]);
                                                                    }
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons.add,
                                                                      color: ConstantColors
                                                                          .white))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2.0),
                                                  width: width * 0.7,
                                                  child: value
                                                          .tableMenuList[i]
                                                          .categoryDishes![
                                                              index1]
                                                          .addonCat!
                                                          .isNotEmpty
                                                      ? const Text(
                                                          ConstantVariables
                                                              .customization)
                                                      : const Text(""),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.22,
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: SizedBox(
                                                width: width * 0.18,
                                                //color: Colors.red,
                                                height: height * 0.1,
                                                child: Image.asset(
                                                    "assets/firebaselogo.png"),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index2) {
                                    return Container(
                                      height: height * 0.001,
                                      color: ConstantColors.appDrawerColor,
                                    );
                                  },
                                );
                              }),
                      ),
                  ])),
            ),
          );
  }
}
