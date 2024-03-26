import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class DeleteProduct {
  Future<ProductModel> deleteProduct({required int id}) async {
    Map<String, dynamic> data =
        await Api().delete(url: 'https://fakestoreapi.com/products/$id');

    return ProductModel.fromJson(data);
  }
}
