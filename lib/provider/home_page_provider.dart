// import 'package:flutter/cupertino.dart';
// import 'package:fooddeliveryapp/control/getItemModel.dart';
// import 'package:fooddeliveryapp/model/itemModel.dart';
//
// class HomePageProvider extends ChangeNotifier {
//   HomePageProvider() {
//     getCartList();
//   }
//
//   List<CategoryDish> categoryDish = <CategoryDish>[];
//   List<TableMenuList> tableMenuList = <TableMenuList>[];
//   List<CategoryDish> cartList = <CategoryDish>[];
//   List<CategoryDish> totalCartList = <CategoryDish>[];
//
//   getCartList() async {
//     Sample result = await GetDataFromModel().getAllItems();
//     if (result.tableMenuList!.isNotEmpty) {
//       tableMenuList.addAll(result.tableMenuList!);
//       for (TableMenuList tableMenuList in result.tableMenuList!) {
//         categoryDish.addAll(tableMenuList.categoryDishes!);
//       }
//     } else {
//       tableMenuList = [];
//     }
//     notifyListeners();
//   }
//
//   incrementItem(CategoryDish categoryDish) {
//     categoryDish.incrementOrDecrement = categoryDish.incrementOrDecrement! + 1;
//     notifyListeners();
//   }
//
//   decrementItem(CategoryDish categoryDish) {
//     categoryDish.incrementOrDecrement = categoryDish.incrementOrDecrement! - 1;
//     notifyListeners();
//   }
// }
