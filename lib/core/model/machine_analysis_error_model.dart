class MachineAnalysisErrorModel {
  List<MachineAnalysisErrorByError>? data;

  MachineAnalysisErrorModel({this.data});

  MachineAnalysisErrorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MachineAnalysisErrorByError>[];
      json['data'].forEach((v) {
        data!.add(MachineAnalysisErrorByError.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MachineAnalysisErrorByError {
  String? lINE;
  String? mACHINECODE;
  String? sTATUS;
  int? totalTime;
  int? fREN;
  String? eRRORCODE;
  String? eRROR;

  MachineAnalysisErrorByError(
      {this.lINE,
        this.mACHINECODE,
        this.sTATUS,
        this.totalTime,
        this.fREN,
        this.eRRORCODE,
        this.eRROR});

  MachineAnalysisErrorByError.fromJson(Map<String, dynamic> json) {
    lINE = json['LINE'];
    mACHINECODE = json['MACHINE_CODE'];
    sTATUS = json['STATUS'];
    totalTime = json['TotalTime'];
    fREN = json['FREN'];
    eRRORCODE = json['ERROR_CODE'];
    eRROR = json['ERROR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LINE'] = lINE;
    data['MACHINE_CODE'] = mACHINECODE;
    data['STATUS'] = sTATUS;
    data['TotalTime'] = totalTime;
    data['FREN'] = fREN;
    data['ERROR_CODE'] = eRRORCODE;
    data['ERROR'] = eRROR;
    return data;
  }
}
