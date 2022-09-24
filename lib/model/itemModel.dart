// To parse this JSON data, do
//
//     final sample = sampleFromJson(jsonString);

import 'dart:convert';

class Sample {
  Sample({
    this.restaurantId,
    this.restaurantName,
    this.restaurantImage,
    this.tableId,
    this.tableName,
    this.branchName,
    this.nexturl,
    this.tableMenuList,
  });

  dynamic restaurantId;
  dynamic restaurantName;
  dynamic restaurantImage;
  dynamic tableId;
  dynamic tableName;
  dynamic branchName;
  dynamic nexturl;
  List<TableMenuList>? tableMenuList;

  factory Sample.fromRawJson(String str) => Sample.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        restaurantImage: json["restaurant_image"],
        tableId: json["table_id"],
        tableName: json["table_name"],
        branchName: json["branch_name"],
        nexturl: json["nexturl"],
        tableMenuList: json["table_menu_list"] == null
            ? null
            : List<TableMenuList>.from(
                json["table_menu_list"].map((x) => TableMenuList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "restaurant_image": restaurantImage,
        "table_id": tableId,
        "table_name": tableName,
        "branch_name": branchName,
        "nexturl": nexturl,
        "table_menu_list": tableMenuList == null
            ? null
            : List<dynamic>.from(tableMenuList!.map((x) => x.toJson())),
      };
}

class TableMenuList {
  TableMenuList({
    this.menuCategory,
    this.menuCategoryId,
    this.menuCategoryImage,
    this.nexturl,
    this.categoryDishes,
  });

  String? menuCategory;
  String? menuCategoryId;
  String? menuCategoryImage;
  String? nexturl;
  List<CategoryDish>? categoryDishes;

  factory TableMenuList.fromRawJson(String str) =>
      TableMenuList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TableMenuList.fromJson(Map<String, dynamic> json) => TableMenuList(
        menuCategory: json["menu_category"],
        menuCategoryId: json["menu_category_id"],
        menuCategoryImage: json["menu_category_image"],
        nexturl: json["nexturl"],
        categoryDishes: json["category_dishes"] == null
            ? null
            : List<CategoryDish>.from(
                json["category_dishes"].map((x) => CategoryDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu_category": menuCategory,
        "menu_category_id": menuCategoryId,
        "menu_category_image": menuCategoryImage,
        "nexturl": nexturl,
        "category_dishes": categoryDishes == null
            ? null
            : List<dynamic>.from(categoryDishes!.map((x) => x.toJson())),
      };
}

class AddonCat {
  AddonCat({
    this.addonCategory,
    this.addonCategoryId,
    this.addonSelection,
    this.nexturl,
    this.addons,
  });

  String? addonCategory;
  String? addonCategoryId;
  int? addonSelection;
  String? nexturl;
  List<CategoryDish>? addons;

  factory AddonCat.fromRawJson(String str) =>
      AddonCat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddonCat.fromJson(Map<String, dynamic> json) => AddonCat(
        addonCategory: json["addon_category"],
        addonCategoryId: json["addon_category_id"],
        addonSelection: json["addon_selection"],
        nexturl: json["nexturl"],
        addons: json["addons"] == null
            ? null
            : List<CategoryDish>.from(
                json["addons"].map((x) => CategoryDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "addon_category": addonCategory,
        "addon_category_id": addonCategoryId,
        "addon_selection": addonSelection,
        "nexturl": nexturl,
        "addons": addons == null
            ? null
            : List<dynamic>.from(addons!.map((x) => x.toJson())),
      };
}

class CategoryDish {
  CategoryDish(
      {this.dishId,
      this.dishName,
      this.dishPrice,
      this.dishImage,
      this.dishCurrency,
      this.dishCalories,
      this.dishDescription,
      this.dishAvailability,
      this.dishType,
      this.nexturl,
      this.addonCat,
      this.isSelected = false,
      this.incrementOrDecrement = 0});

  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  dynamic dishCurrency;
  dynamic dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  dynamic dishType;
  String? nexturl;
  List<AddonCat>? addonCat;
  bool isSelected;
  int? incrementOrDecrement;

  factory CategoryDish.fromRawJson(String str) =>
      CategoryDish.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryDish.fromJson(Map<String, dynamic> json) => CategoryDish(
        dishId: json["dish_id"],
        dishName: json["dish_name"],
        dishPrice: json["dish_price"],
        dishImage: json["dish_image"],
        dishCurrency: json["dish_currency"],
        dishCalories: json["dish_calories"],
        dishDescription: json["dish_description"],
        dishAvailability: json["dish_Availability"],
        isSelected: json["isSelected"],
        dishType: json["dish_Type"],
        nexturl: json["nexturl"],
        incrementOrDecrement: json["incrementOrDecrement"] ?? 0,
        addonCat: json["addonCat"] == null
            ? null
            : List<AddonCat>.from(
                json["addonCat"].map((x) => AddonCat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dish_id": dishId,
        "dish_name": dishName,
        "dish_price": dishPrice,
        "dish_image": dishImage,
        "dish_currency": dishCurrency,
        "dish_calories": dishCalories,
        "dish_description": dishDescription,
        "dish_Availability": dishAvailability,
        "isSelected": isSelected,
        "dish_Type": dishType,
        "incrementOrDecrement": incrementOrDecrement,
        "nexturl": nexturl,
        "addonCat": addonCat == null
            ? null
            : List<dynamic>.from(addonCat!.map((x) => x.toJson())),
      };
}
