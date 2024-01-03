import '../helper/api.dart';

class AllCategoryServices {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}

//.............. الطريقه التليقديه بدون استخدام ال class بتاع ال api اللي في ال helper

// class AllCategoryServices {
//   final dio = Dio();
//
//   Future<List<dynamic>> getAllCategory() async {
//     try {
//       Response response =
//       await dio.get('https://fakestoreapi.com/products/categories');
//       List<dynamic> data = response.data;
//       return data;
//     } catch (e) {
//       throw Exception("there is a problem");
//     }
//   }
// }
