import 'package:app_smt/core/function/dio_function.dart';
import 'package:app_smt/core/model/pickup_rate_analysis_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/model/error_cause_solution_model.dart';
import '../../../core/model/pickup_rate_abnormal_handle_model.dart';
import '../../../core/model/pickup_rate_detail_analysis_model.dart';
import '../../../core/model/pickup_rate_status_model.dart';
import '../../../core/widget/dialog.dart';
import '../../data_mau/constants.dart';
import '../../data_mau/data_mau.dart';
import '../../data_mau/data_mau_pickup.dart';
import 'pickuprate_repository.dart';

class PickupRateRepositoryImpl implements PickupRateRepository {
  static String myHost = "http://10.225.41.205:3030/";
  static String otherHost = "https://10.225.42.71:5000/";
  @override
  Future getDataPickupRateAbnormalHandle() async {
    if (kDebugMode) {
      return PickupRateAbnormalHandleModel.fromJson(
        api_PickupRateAbnormalHandle_example,
      );
    }

    try {
      final response = await DioFunction().callApiThroughProxy(
        url: otherHost + Constants.urlGetDataPickupRateAbnormalHandle,
        method: "POST",
        data: {},
      );
      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return PickupRateAbnormalHandleModel.fromJson(response.data);
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

  @override
  Future getDataPickupRateAnalysisByDay() async {
    if (kDebugMode) {
      return PickupRateAnalysisByDayModel.fromJson(
        api_PickupRateAnalysisByDay_example,
      );
    }

    try {
      final response = await DioFunction().callApiThroughProxy(
        url: otherHost + Constants.urlGetDataPickupRateAnalysisByDay,
        method: "POST",
        data: {},
      );
      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return PickupRateAnalysisByDayModel.fromJson(response.data);
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

  @override
  Future getPickupRateStatus({body}) async {
    if (kDebugMode) {
      return DataPickupRateStatusModel.fromJson({
        "data": apiPickupRateStatus_example,
      });
    }

    try {
      // final response = await dioPost.get(Constants.urlPickupRateStatus);
      var dio = Dio();
      var headers = {'Content-Type': 'application/json'};
      var response = await dio.request(
        '$otherHost${Constants.urlPickupRateStatus}',
        options: Options(method: 'POST', headers: headers),
        data: body,
      );
      // final response = await callApiThroughProxy(
      //   url: myHost + Constants.urlMachineStatus,
      // );
      debugPrint(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        return DataPickupRateStatusModel.fromJson({"data": response.data});
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

  @override
  Future getDataErrorCauseSolutionPickup() async {
    if (kDebugMode) {
      return DataErrorCauseSolutionModel.fromJson({
        "data": api_getDataErrorCauseSolutionPickup_example,
      });
    }

    try {
      final response = await DioFunction().callApiThroughProxy(
        url: myHost + Constants.urlGetDataErrorCauseSolutionPickup,
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

  @override
  Future updateConfirmErrorPickup({required body}) async {
    if (kDebugMode) return true;
    try {
      final response = await DioFunction().callApiThroughProxy(
        url: myHost + Constants.urlUpdateConfirmPickupRate,
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

  @override
  Future getPickupRateDetailAnalysis({required body}) async {
    if (kDebugMode) {
      return PickupRateDetailAnalysisModel.fromJson({
        "data": api_PickupRateDetailAnalysis_example,
      });
    }
    try {
      final response = await DioFunction().callApiThroughProxy(
        url: otherHost + Constants.urlGetPickupRateDetailAnalysis,
        method: "POST",
        data: body,
      );
      if (response.statusCode == 200 && response.data != null) {
        return PickupRateDetailAnalysisModel.fromJson({"data": response.data});
      }
    } on DioException catch (e) {
      showDialogMessage(message: e.response?.data['msg']);
      return;
    } catch (e) {
      showDialogMessage(message: 'Lỗi khi gọi API: $e');
    }
  }
}
