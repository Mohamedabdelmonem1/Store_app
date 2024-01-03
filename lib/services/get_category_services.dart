import 'package:store_app/helper/api.dart';
import '../models/all_product_model.dart';

class CategoryServices {
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}

// الطريقه التليقديه بدون استخدام ال class بتاع ال api اللي في ال helper ..............

// class CategoryServices {
//   final dio = Dio();
//
//   Future<List<ProductModel>> getCategoryProducts(
//       {required String categoryName}) async {
//     try {
//       Response response = await dio
//           .get('https://fakestoreapi.com/products/category/$categoryName');
//       List<dynamic> data = response.data;
//       List<ProductModel> productsList = [];
//       for (int i = 0; i < data.length; i++) {
//         productsList.add(ProductModel.fromJson(data[i]));
//       }
//       return productsList;
//     } catch (e) {
//       throw Exception("there is a problem");
//     }
//   }
// }
