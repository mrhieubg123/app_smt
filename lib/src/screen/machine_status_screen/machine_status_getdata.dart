import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../../core/function/dio_function.dart';
import '../../../core/model/error_cause_solution_model.dart';
import '../../../core/model/machine_analysis_error_model.dart';
import '../../../core/model/machine_status_model.dart';
import '../../../core/model/pickup_rate_status_model.dart';
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
      showDialogMessage(message: e.response?.data['msg']);
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

  getUniqueSortedLinesPickupRate(List<PickupRateStatusModel> machines) {
    final lines = machines.map((m) => m.lINENAME.toString()).toList();
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
      final response = await DioFunction().callApiThroughProxy(
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
      final response = await DioFunction().callApiThroughProxy(
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
      // final response = await dioPost.post(
      //   Constants.urlMachineAnalysisError,
      //   data: body,
      // );
      // var dio = Dio();
      // var headers = {'Content-Type': 'application/json'};
      // var response = await dio.request(
      //   'https://10.225.42.71:5000/${Constants.urlMachineAnalysisError}',
      //   options: Options(method: 'POST', headers: headers),
      //   data: body,
      // );
      final response = await DioFunction().callApiThroughProxy(
        url: otherHost + Constants.urlMachineAnalysisError,
        method: "POST",
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return MachineAnalysisErrorModel.fromJson({"data": response.data});
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['msg']);
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
      // final response = await dioPost.post(
      //   Constants.urlGetErrorDetail,
      //   data: body,
      // );
      // var dio = Dio();
      // var headers = {'Content-Type': 'application/json'};
      // var response = await dio.request(
      //   'https://10.225.42.71:5000/${Constants.urlGetErrorDetail}',
      //   options: Options(method: 'POST', headers: headers),
      //   data: body,
      // );
      final response = await DioFunction().callApiThroughProxy(
        url: otherHost + Constants.urlErrorsByCode,
        method: "POST",
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ErrorDetailTotalModel.fromJson({"data": response.data});
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['msg']);
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

  Future createConfirmError({required body}) async {
    if (kDebugMode) return true;

    try {
      // final response = await dioPost.post(
      //   Constants.urlConfirmErrorDetail,
      //   data: body,
      // );
      final response = await DioFunction().callApiThroughProxy(
        url: myHost + Constants.urlConfirmErrorDetail,
        method: "POST",
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        showDialogMessage(message: "Xác nhận thành công");
        return true;
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['msg']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future createCauseSolution({required body}) async {
    if (kDebugMode) return true;

    try {
      // final response = await dioPost.post(Constants.urlAddError, data: body);
      final response = await DioFunction().callApiThroughProxy(
        url: myHost + Constants.urlAddError,
        method: "POST",
        data: body,
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['msg']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future registerUser({
    required String name,
    required String cardId,
    required String password,
  }) async {}

  Future<bool> loginUser(String cardId, String password) async {
    try {
      if (kDebugMode) return true;
      // final dioPost = DioClient.instance;
      // final response = await dioPost.post(
      //   Constants.urlLogin,
      //   data: {'username': cardId, 'password': password},
      // );

      var dio = Dio();
      var headers = {'Content-Type': 'application/json'};
      var response = await dio.request(
        'https://10.225.42.71:5000/${Constants.urlLogin}',
        options: Options(method: 'POST', headers: headers),
        data: {'username': cardId, 'password': password},
      );

      if (response.statusCode == 200) {
        userId = cardId;
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', response.data['token']);
        print('✅ Đăng nhập thành công: $cardId');
        return true;
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data.toString());
    } catch (e) {
      showDialogMessage(message: '❌ Lỗi không xác định: $e');
    }
    return false;
  }
}
