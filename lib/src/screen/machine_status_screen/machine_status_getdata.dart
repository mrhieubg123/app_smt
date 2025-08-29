import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../../core/model/error_cause_solution_model.dart';
import '../../../core/model/machine_analysis_error_model.dart';
import '../../../core/model/machine_status_model.dart';
import '../../../core/model/machine_total_trend_model.dart';
import '../../../main.dart';
import '../../../src/data_mau/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/interceptor/dio_client.dart';
import '../../../core/model/error_detail_total_model.dart';
import '../../../core/model/error_not_confirm_model.dart';
import '../../../core/widget/dialog.dart';
import '../../data_mau/data_mau.dart';

class MachineStatusGetData {
  static String userId = "";
  static String myHost = "http://10.225.41.205:3030/";
  static String otherHost = "https://10.225.42.71:5000/";

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
    final dioPost = DioClient.instance;

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

  Future getMachineStatus() async {
    if (kDebugMode) {
      return ListMachineSMTStatusModel.fromJson({
        "data": apiMachineMachineStatus,
      });
    }
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.get(Constants.urlMachineStatus);
      // final response = await callApiThroughProxy(
      //   url: myHost + Constants.urlMachineStatus,
      // );
      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ListMachineSMTStatusModel.fromJson({"data": response.data});
      } else {
        throw Exception('Lỗi server: ${response.statusCode}');
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return false;
    } catch (e) {
      throw Exception('Lỗi khi gọi API: $e');
    }
  }

  getUniqueSortedLines(List<MachineStatusModel> machines) {
    final lines = machines.map((m) => m.line!).toSet().toList();
    lines.sort(); // sắp xếp theo alphabet
    return lines;
  }

  Future getListConfirm() async {
    if (kDebugMode) {
      return ListErrorNotConfirmModel.fromJson({
        "data": getListConfirm_example,
      });
    }
    final dioPost = DioClient.instance;

    try {
      // final response = await dioPost.get(Constants.urlGetErrorNotConfirm);
      final response = await callApiThroughProxy(
        url: myHost + Constants.urlGetErrorNotConfirm,
      );
      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ListErrorNotConfirmModel.fromJson({"data": response.data});
      } else {
        showDialogMessage(message: 'Lỗi server: ${response.statusCode}');
      }
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future getDataErrorCauseSolution() async {
    if (kDebugMode) {
      return DataErrorCauseSolutionModel.fromJson({
        "data": getDataErrorCauseSolution_example,
      });
    }
    final dioPost = DioClient.instance;

    try {
      // final response = await dioPost.get(Constants.urlGetDataErrorCauseSolution);
      final response = await callApiThroughProxy(
        url: myHost + Constants.urlGetDataErrorCauseSolution,
      );
      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return DataErrorCauseSolutionModel.fromJson({"data": response.data});
      } else {
        showDialogMessage(message: 'Lỗi server: ${response.statusCode}');
      }
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }


  Future getMachineAnalysisError({required body}) async {
    if (kDebugMode) {
      return MachineAnalysisErrorModel.fromJson({
        "data": api_MachineAnalysisError_example,
      });
    }

    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlMachineAnalysisError,
        data: body,
      );
      // final response = await callApiThroughProxy(
      //   url: myHost + Constants.urlMachineAnalysisError,
      //   method: "POST",
      //   data: body,
      // );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return MachineAnalysisErrorModel.fromJson({"data": response.data});
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return false;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future getErrorDetail({required body}) async {
    if (kDebugMode) {
      return ErrorDetailTotalModel.fromJson({"data": getErrorDetail_example});
    }

    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlGetErrorDetail,
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ErrorDetailTotalModel.fromJson({"data": response.data});
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future getAddMaintenance({required body}) async {
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlGetErrorDetail,
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future getMachineTotalTrend({required body}) async {
    if (kDebugMode) {
      return MachineTotalTrendModel.fromJson({"data": apiMachineTotalTrend});
    }
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlMachineTotalTrend,
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return MachineTotalTrendModel.fromJson({"data": response.data});
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future createConfirmError({required body}) async {
    final dioPost = DioClient.instance;

    try {
      // final response = await dioPost.post(
      //   Constants.urlConfirmErrorDetail,
      //   data: body,
      // );
      final response = await callApiThroughProxy(
        url: myHost + Constants.urlConfirmErrorDetail,
        method: "POST",
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        showDialogMessage(message: response.data["message"]);
        return true;
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future createCauseSolution({required body}) async {
    final dioPost = DioClient.instance;

    try {
      // final response = await dioPost.post(Constants.urlAddError, data: body);
      final response = await callApiThroughProxy(
        url: myHost + Constants.urlAddError,
        method: "POST",
        data: body,
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future<bool> registerUser({
    required String name,
    required String cardId,
    required String password,
  }) async {
    try {
      final dioPost = DioClient.instance;
      final response = await dioPost.post(
        Constants.urlRegister,
        data: {"name": name, "password": password, "card_code": cardId},
      );

      if (response != null) {
        showDialogMessage(
          message: '✅ Tạo tài khoản thành công',
          onOk: () {
            Navigator.pop(navigatorKey.currentContext!);
          },
        );
        return true;
      }
      return false;
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return false;
    } catch (e) {
      showDialogMessage(message: '❌ Dio Exception: $e');
      return false;
    }
  }

  Future<bool> loginUser(String cardId, String password) async {
    try {
      if (kDebugMode) return true;
      final dioPost = DioClient.instance;
      final response = await dioPost.post(
        Constants.urlLogin,
        data: {'username': cardId, 'password': password},
      );

      if (response != null) {
        userId = cardId;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['token']);
        print('✅ Đăng nhập thành công: $cardId');
        return true;
      }
      return false;
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return false;
    } catch (e) {
      showDialogMessage(message: '❌ Lỗi không xác định: $e');
      return false;
    }
  }
}
