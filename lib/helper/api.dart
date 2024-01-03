//دي الصفحه الخاصه بال requests بتاع ال api زي ال get and post and put

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
  final dio = Dio();
//............... get request ....................
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    try {
      if (token != null) {
        headers.addAll({
          'Authorization': 'Bearer $token',
        });
      }
      print('url =$url token=$token ');

      Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception('there is a problem');
    }
  }

//............... post request ....................
  Future<dynamic> post(
      {required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> headers = {};
    try {
      if (token != null) {
        headers.addAll({
          'Authorization': 'Bearer $token',
        });
      }
      print('url =$url data =$data token=$token ');

      Response response = await dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

//............... put request ....................
  Future<dynamic> put(
      {required String url,
      @required dynamic data,
      @required String? token}) async {
    Map<String, String> headers = {};
    try {
      if (token != null) {
        headers.addAll({
          'Authorization': 'Bearer $token',
        });
      }
      print('url =$url data =$data token=$token ');
      Response response = await dio.put(
        url,
        data: data,
        options: Options(headers: headers),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

// حيث دي ال class المسئوله عن ال requests الخاصه بال api كلها سواء get or post or put or update or delete
// الميزه انك لما تشتغل في تطبيق جديد هتاخد ال class ده كوبي بيست لان يوجد بها كل ال requests الموجوده
//   ويمكن استخدام الmethod دي في اي مكان في ال services بعمل فيه get request ولسه هعمل post request and put request
