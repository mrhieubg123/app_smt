import 'package:flutter/material.dart';

class Constants {
  static const Map<String, dynamic> statusMachine = {
    "RUN": {"name": "Đang hoạt động", "color": Colors.green},
    "ERROR": {"name": "Đang lỗi", "color": Colors.red},
    "OFF": {"name": "Đang tắt", "color": Colors.yellow},
    "NA": {"name": "Không xác định", "color": Colors.grey},
  };
  static String urlLogin = "api/login";
  static String urlRegister = "api/create";
  static String urlMachineStatus = "api/Machine/MachineStatus";
  static String urlGetListConfirm = "api/Machine/MachineErrorOver10m";
  static String urlErrorsByCode = "api/Machine/MachineStatusQueryParam";
  static String urlDashboardError = "api/dashboard-error";
  static String urlConfirmErrorDetail = "api/confirm_error_detail";
  static String urlGetErrorDetail = "api/get_error_detail";
  static String urlAddError = "api/add_error";
  static String urlUploadErrorImage = "api/upload_error_image";
  static String urlAddMaintenance = "api/add_maintenance";
  static String urlViewMaintenance = "api/view_maintenance";
}
