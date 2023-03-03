import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> productData = [
    ProductModel(productname: "Watermelon", price: 100, image: "🍉", qa: 1),
    ProductModel(productname: "Greps", price: 80, image: "🍇", qa: 1),
    ProductModel(productname: "Apple", price: 50, image: "🍎", qa: 1),
    ProductModel(productname: "Mango", price: 800, image: "🥭", qa: 1),
    ProductModel(productname: "kiwi", price: 200, image: "🥝", qa: 1),
    ProductModel(productname: "Banana", price: 20, image: "🍌", qa: 1),
  ];

  List<ProductModel> cartData = [];

  void addcart(ProductModel p1) {
    cartData.add(p1);
    notifyListeners();
  }

  void updateQa(int index, ProductModel p1) {
    productData[index] = p1;
    notifyListeners();
  }
}
