import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/dialog.dart';

class DioFunction {
  Future testPushProxy({dataBody}) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode(
      dataBody ??
          {
            "method": "POST",
            "url": "http://10.225.42.70:5000/api/login",
            "headers": {
              "Accept-Encoding": "gzip, deflate, br",
              "Content-Type": "application/json",
            },
            "data": {"card_code": "V3241419", "password": "123456"},
          },
    );
    var dio = Dio();
    var response = await dio.request(
      'https://10.225.42.71:5000/api/proxy-api',
      options: Options(method: 'POST', headers: headers),
      data: data,
    );

    if (response.statusCode == 200) {
      return response;
      showDialogMessage(message: json.encode(response.data));
      print(json.encode(response.data));
    } else {
      showDialogMessage(message: response.statusMessage);
      print(response.statusMessage);
    }
  }

  Future callApiThroughProxy({url, method, header, data}) async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    Map<String, dynamic> headers = {
      "Accept-Encoding": "gzip, deflate, br",
      "Content-Type": "application/json",
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final proxyRequestBody = {
      // "url": dioPost.options.baseUrl + url, // URL thật bạn muốn gọi
      "url": url, // URL thật bạn muốn gọi
      "method": method ?? "GET",
      "data": data ?? {}, // Có thể là {} hoặc dữ liệu cho POST
      "headers": headers,
    };

    try {
      final Response response = await testPushProxy(dataBody: proxyRequestBody);
      return response;
    } on DioException catch (e) {
      showDialogMessage(message: '❌ Lỗi proxy: $e');
    } catch (e) {
      showDialogMessage(message: "❌ Lỗi khi gọi proxy: $e");
    }
    return;
  }
}