class PickupRateAbnormalHandleModel {
  List<DataAbnormal>? dataAbnormal;
  List<DataCheckSheet>? dataCheckSheet;

  PickupRateAbnormalHandleModel({this.dataAbnormal, this.dataCheckSheet});

  PickupRateAbnormalHandleModel.fromJson(Map<String, dynamic> json) {
    if (json['dataAbnormal'] != null) {
      dataAbnormal = <DataAbnormal>[];
      json['dataAbnormal'].forEach((v) {
        dataAbnormal!.add(DataAbnormal.fromJson(v));
      });
    }
    if (json['dataCheckSheet'] != null) {
      dataCheckSheet = <DataCheckSheet>[];
      json['dataCheckSheet'].forEach((v) {
        dataCheckSheet!.add(DataCheckSheet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataAbnormal != null) {
      data['dataAbnormal'] = dataAbnormal!.map((v) => v.toJson()).toList();
    }
    if (dataCheckSheet != null) {
      data['dataCheckSheet'] =
          dataCheckSheet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataAbnormal {
  int? iD;
  String? dateT;
  String? timeT;
  String? lINENAME;
  String? mACHINE;
  String? lM;
  String? sTATION;
  String? pARTNAME;
  String? fEEDERSN;
  int? tOTALQTY;
  int? fAILQTY;
  double? failRate;
  String? contentAdj;
  String? newParam;
  String? eMPConfirm;
  dynamic confirm;
  String? rowNum;

  DataAbnormal(
      {this.iD,
        this.dateT,
        this.timeT,
        this.lINENAME,
        this.mACHINE,
        this.lM,
        this.sTATION,
        this.pARTNAME,
        this.fEEDERSN,
        this.tOTALQTY,
        this.fAILQTY,
        this.failRate,
        this.contentAdj,
        this.newParam,
        this.eMPConfirm,
        this.confirm,
        this.rowNum});

  DataAbnormal.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    dateT = json['DateT'];
    timeT = json['TimeT'];
    lINENAME = json['LINE_NAME'];
    mACHINE = json['MACHINE'];
    lM = json['LM'];
    sTATION = json['STATION'];
    pARTNAME = json['PART_NAME'];
    fEEDERSN = json['FEEDER_SN'];
    tOTALQTY = json['TOTAL_QTY'];
    fAILQTY = json['FAIL_QTY'];
    failRate = json['FailRate'];
    contentAdj = json['Content_Adj'];
    newParam = json['New_Param'];
    eMPConfirm = json['EMP_Confirm'];
    confirm = json['Confirm'];
    rowNum = json['RowNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['DateT'] = dateT;
    data['TimeT'] = timeT;
    data['LINE_NAME'] = lINENAME;
    data['MACHINE'] = mACHINE;
    data['LM'] = lM;
    data['STATION'] = sTATION;
    data['PART_NAME'] = pARTNAME;
    data['FEEDER_SN'] = fEEDERSN;
    data['TOTAL_QTY'] = tOTALQTY;
    data['FAIL_QTY'] = fAILQTY;
    data['FailRate'] = failRate;
    data['Content_Adj'] = contentAdj;
    data['New_Param'] = newParam;
    data['EMP_Confirm'] = eMPConfirm;
    data['Confirm'] = confirm;
    data['RowNum'] = rowNum;
    return data;
  }
}

class DataCheckSheet {
  String? lINE;
  String? dateT;
  String? sHIFTT;
  String? statusT;

  DataCheckSheet({this.lINE, this.dateT, this.sHIFTT, this.statusT});

  DataCheckSheet.fromJson(Map<String, dynamic> json) {
    lINE = json['LINE'];
    dateT = json['DateT'];
    sHIFTT = json['SHIFTT'];
    statusT = json['StatusT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LINE'] = lINE;
    data['DateT'] = dateT;
    data['SHIFTT'] = sHIFTT;
    data['StatusT'] = statusT;
    return data;
  }
}
