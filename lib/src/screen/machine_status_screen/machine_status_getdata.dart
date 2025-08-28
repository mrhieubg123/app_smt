import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../core/model/error_stats_model.dart';
import '../../../core/model/machine_status_model.dart';
import '../../../main.dart';
import '../../../src/data_mau/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/interceptor/dio_client.dart';
import '../../../core/model/dashboard_error_model.dart';
import '../../../core/model/error_by_code_model.dart';
import '../../../core/model/error_detail_model.dart';
import '../../../core/model/error_detail_total_model.dart';
import '../../../core/model/error_not_confirm_model.dart';
import '../../../core/model/view_maintennance_model.dart';
import '../../../core/widget/dialog.dart';
import '../../data_mau/data_mau.dart';

class MachineStatusGetData {
  static String userId = "";

  Future getMachineStatus() async {
    if (kDebugMode) {
      return ListMachineSMTStatusModel.fromJson({
        "data": apiMachineMachineStatus,
      });
    }
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.get(Constants.urlMachineStatus);
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

  // getUniqueSortedLocations(List<MachineStatusModel> machines) {
  //   final locations = machines.map((m) => m.location!).toSet().toList();
  //
  //   // Chuyển về số để sort theo giá trị (không phải chuỗi)
  //   locations.sort((a, b) => int.parse(a).compareTo(int.parse(b)));
  //
  //   return locations;
  // }

  Future getListConfirm() async {
    if (kDebugMode) {
      return ListErrorNotConfirmModel.fromJson({"data":getListConfirm_example});
    }
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.get(Constants.urlGetListConfirm);

      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ListErrorNotConfirmModel.fromJson({"data":response.data});
      } else {
        showDialogMessage(message: 'Lỗi server: ${response.statusCode}');
      }
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future getListErrorDetail({required String errorCode}) async {
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.get(
        "errors_details",
        queryParameters: {'error_code': errorCode},
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ErrorDetailsModel.fromJson(response.data);
      } else {
        showDialogMessage(message: 'Lỗi server: ${response.statusCode}');
      }
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future getDashboardError({required body}) async {
    if (kDebugMode) {
      return DashboardErrorModel.fromJson(api_dashboard_error_example);
    }

    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlDashboardError,
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return DashboardErrorModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['error']);
      return false;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future getErrorByCode({required body}) async {
    if (kDebugMode) {
      return ErrorDetailByCodeModel.fromJson(getErrorByCode_example);
    }

    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlErrorsByCode,
        data: body,
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ErrorDetailByCodeModel.fromJson(response.data);
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

  Future getViewMaintenance({required body}) async {
    if (kDebugMode) {
      if (body['maintenance_type'] == "WEEKLY") {
        return ViewMaintenanceModel.fromJson(getViewMaintenance_weekly_example);
      } else {
        return ViewMaintenanceModel.fromJson(
          getViewMaintenance_monthly_example,
        );
      }
    }

    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlGetErrorDetail,
        data: body,
      );

      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ViewMaintenanceModel.fromJson(response.data);
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

  Future createConfirmError({required body}) async {
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.post(
        Constants.urlConfirmErrorDetail,
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
      final response = await dioPost.post(Constants.urlAddError, data: body);

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

  Future getErrorStatsModel({required String errorCode}) async {
    final dioPost = DioClient.instance;

    try {
      final response = await dioPost.get(
        "error_stats",
        queryParameters: {'error_code': errorCode},
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return ErrorStatsModel.fromJson(response.data);
      } else {
        showDialogMessage(message: 'Lỗi server: ${response.statusCode}');
      }
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }

  Future createConfirmData({
    required String errorCode,
    required int idCause,
    int? idSolution,
    String? textSolution,
    required String userId,
    required int idErrorConfirm,
  }) async {
    final dioPost = DioClient.instance;

    try {
      final Map<String, dynamic> body = {
        "error_code": errorCode,
        "id_cause": idCause,
        "id_solution": idSolution,
        "user_id": userId,
        "id_error_confirm": idErrorConfirm,
        if (idSolution == null && textSolution != null)
          "text_solution": textSolution,
      };

      final response = await dioPost.post('createConfirm', data: body);

      if (response.statusCode == 201) {
        final data = response.data;
        showDialogMessage(
          message:
              '✅ Success: id_confirm = ${data['id_confirm']}, id_solution = ${data['id_solution']}',
        );
        return data;
      } else {
        showDialogMessage(
          message: '❌ Error: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        showDialogMessage(message: '❗ Timeout while connecting to API');
      } else if (e.response != null) {
        showDialogMessage(
          message:
              '❗ Server error: ${e.response?.statusCode} - ${e.response?.data}',
        );
      } else {
        showDialogMessage(message: '❗ Dio error: ${e.message}');
      }
    } catch (e) {
      showDialogMessage(message: '❗ Unknown error: $e');
    }
    return;
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
        data: {'card_code': cardId, 'password': password},
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
