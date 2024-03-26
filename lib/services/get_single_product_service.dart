// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class SingleProduct {
  Future<ProductModel> getSingleProduct({required dynamic id}) async {
    // print(id);
    dynamic product =
        await Api().getItem(url: "https://fakestoreapi.com/products/", id: id);
    print("=====product service: ${product}===========");
    return ProductModel.fromJson(product);
    // return product;
  }
}
