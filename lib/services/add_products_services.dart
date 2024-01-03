import 'package:store_app/models/all_product_model.dart';
import '../helper/api.dart';

class AddProductsServices {
  Future<ProductModel> addProducts({
    required String? title,
    required String? price,
    required String? description,
    required String? image,
    required String? category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
