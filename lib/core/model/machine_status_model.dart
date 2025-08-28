// class ListMachineStatusModel {
//   List<MachineStatusModel>? data;
//
//   ListMachineStatusModel({this.data});
//
//   ListMachineStatusModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(MachineStatusModel.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class MachineStatusModel {
//   String? line;
//   String? location;
//   String? machineName;
//   String? machineType;
//   String? status;
//   String? error_code;
//
//   MachineStatusModel({
//     this.line,
//     this.location,
//     this.machineName,
//     this.machineType,
//     this.status,
//     this.error_code,
//   });
//
//   MachineStatusModel.fromJson(Map<String, dynamic> json) {
//     line = json['line'] ?? "";
//     location = json['location'] ?? "";
//     machineName = json['machine_name'];
//     machineType = json['machine_type'];
//     status = json['status'];
//     error_code = json['error_code'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['line'] = line;
//     data['location'] = location;
//     data['machine_name'] = machineName;
//     data['machine_type'] = machineType;
//     data['status'] = status;
//     data['error_code'] = error_code;
//     return data;
//   }
// }

class ListMachineSMTStatusModel {
  List<MachineStatusModel>? data;

  ListMachineSMTStatusModel({this.data});

  ListMachineSMTStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MachineStatusModel>[];
      json['data'].forEach((v) {
        data!.add(new MachineStatusModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MachineStatusModel {
  String? line;
  String? printer;
  String? h1;
  String? h2;
  String? h3;
  String? h4;
  String? h5;
  String? h6;
  String? h7;
  String? h8;
  String? reflow;

  MachineStatusModel(
      {this.line,
        this.printer,
        this.h1,
        this.h2,
        this.h3,
        this.h4,
        this.h5,
        this.h6,
        this.h7,
        this.h8,
        this.reflow});

  MachineStatusModel.fromJson(Map<String, dynamic> json) {
    line = json['LINE'];
    printer = json['PRINTER'];
    h1 = json['H1'];
    h2 = json['H2'];
    h3 = json['H3'];
    h4 = json['H4'];
    h5 = json['H5'];
    h6 = json['H6'];
    h7 = json['H7'];
    h8 = json['H8'];
    reflow = json['REFLOW'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LINE'] = this.line;
    data['PRINTER'] = this.printer;
    data['H1'] = this.h1;
    data['H2'] = this.h2;
    data['H3'] = this.h3;
    data['H4'] = this.h4;
    data['H5'] = this.h5;
    data['H6'] = this.h6;
    data['H7'] = this.h7;
    data['H8'] = this.h8;
    data['REFLOW'] = this.reflow;
    return data;
  }
}

