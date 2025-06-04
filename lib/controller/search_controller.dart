// import 'dart:convert';

// import 'package:animation_widgets/model/product_name.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class ProductSearchController extends GetxController {
//   var allProducts = <ProductName>[].obs;
//   var filteredProducts = <ProductName>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadData();
//   }

//   void loadData() async {
//     final String response = await rootBundle.loadString('assets/from.json');
//     final data = json.decode(response) as List;
//     allProducts.value = data.map((e) => ProductName.fromJson(e)).toList();
//     filteredProducts.value = allProducts;
//   }

//   void filterSearch(String query) {
//     if (query.isEmpty) {
//       filteredProducts.value = allProducts;
//     } else {
//       final lowerQuery = query.toLowerCase();
//       filteredProducts.value = allProducts.where((item) {
//         return item.name.toLowerCase().contains(lowerQuery) ||
//             item.email.toLowerCase().contains(lowerQuery) ||
//             item.product.toLowerCase().contains(lowerQuery);
//       }).toList();
//     }
//   }
// }

import 'dart:convert';

import 'package:animation_widgets/model/product_name.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductSearchController extends GetxController {
  final allProducts = <ProductName>[].obs;
  final filteredProducts = <ProductName>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() async {
    final String response = await rootBundle.loadString('assets/from.json');
    final data = json.decode(response) as List;
    allProducts.value = data.map((e) {
      return ProductName.fromJson(e);
    }).toList();

    filteredProducts.value = allProducts;
  }

  void filterSearch(String search) {
    if (search.isEmpty) {
      filteredProducts.value = allProducts;
    } else {
      final toLowerCase = search.toLowerCase();
      filteredProducts.value = allProducts.where((item) {
        return item.email.toLowerCase().contains(toLowerCase) ||
            item.name.toLowerCase().contains(toLowerCase) ||
            item.product.toLowerCase().contains(toLowerCase);
      }).toList();
    }
  }
}
