class CartModel {
  dynamic name;
  dynamic calories;
  dynamic price;
  dynamic productId;
  var quantity;
  CartModel(
      this.name, this.calories, this.price, this.productId, this.quantity);
}

class CartData {
  static List<CartModel> myCartList = [];
}
