import 'package:flutter/material.dart';

class Constants {
  static const Map<String, dynamic> statusMachine = {
    "RUN": {"name": "Đang hoạt động", "color": Colors.green},
    "ERROR": {"name": "Đang lỗi", "color": Colors.red},
    "OFF": {"name": "Đang tắt", "color": Colors.yellow},
    "OFFt": {"name": "Đang tắt", "color": Colors.yellow},
    "NA": {"name": "Không xác định", "color": Colors.grey},
  };
  static String urlLogin = "api/v1/auth/login";
  static String urlRegister = "api/create";
  static String urlMachineStatus = "api/Machine/MachineStatus";
  static String urlPickupRateStatus = "api/Machine/PickupRateStatus";
  static String urlGetListConfirm = "api/Machine/MachineErrorOver10m";
  static String urlErrorsByCode = "api/Machine/MachineStatusQueryParam";
  static String urlConfirmErrorDetail =
      "api/SmtMachineRouter/updateConfirmError";
  static String urlGetErrorDetail = "api/get_error_detail";
  static String urlAddError = "api/SmtMachineRouter/addCauseSolution";
  static String urlUploadErrorImage = "api/upload_error_image";
  static String urlAddMaintenance = "api/add_maintenance";
  static String urlViewMaintenance = "api/view_maintenance";
  static String urlMachineTotalTrend = "api/Machine/MachineTotalTrend";
  static String urlMachineAnalysisError = "api/Machine/MachineAnalysisError";
  static String urlGetErrorNotConfirm =
      "api/SmtMachineRouter/getErrorNotConfirm";
  static String urlGetMachineAnalysisError =
      "api/SmtMachineRouter/getMachineAnalysisError";
  static String urlGetDataErrorCauseSolution =
      "api/SmtMachineRouter/getDataErrorCauseSolution";
  static String urlGetDataPickupRateAbnormalHandle =
      "api/Machine/PickupRateAbnormalHandle";
  static String urlGetDataPickupRateAnalysisByDay =
      "api/Machine/PickupRateAnalysisByDay";
}
