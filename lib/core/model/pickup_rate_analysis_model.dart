class PickupRateAnalysisByDayModel {
  List<DataBySlot>? dataBySlot;
  List<DataByError>? dataByError;
  List<DataByTime>? dataByTime;

  PickupRateAnalysisByDayModel(
      {this.dataBySlot, this.dataByError, this.dataByTime});

  PickupRateAnalysisByDayModel.fromJson(Map<String, dynamic> json) {
    if (json['dataBySlot'] != null) {
      dataBySlot = <DataBySlot>[];
      json['dataBySlot'].forEach((v) {
        dataBySlot!.add(DataBySlot.fromJson(v));
      });
    }
    if (json['dataByError'] != null) {
      dataByError = <DataByError>[];
      json['dataByError'].forEach((v) {
        dataByError!.add(DataByError.fromJson(v));
      });
    }
    if (json['dataByTime'] != null) {
      dataByTime = <DataByTime>[];
      json['dataByTime'].forEach((v) {
        dataByTime!.add(DataByTime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataBySlot != null) {
      data['dataBySlot'] = dataBySlot!.map((v) => v.toJson()).toList();
    }
    if (dataByError != null) {
      data['dataByError'] = dataByError!.map((v) => v.toJson()).toList();
    }
    if (dataByTime != null) {
      data['dataByTime'] = dataByTime!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataBySlot {
  String? lINENAME;
  String? mACHINE;
  String? sLOTNO;
  String? lM;
  int? tOTALQTY;
  int? fAILQTY;

  DataBySlot(
      {this.lINENAME,
        this.mACHINE,
        this.sLOTNO,
        this.lM,
        this.tOTALQTY,
        this.fAILQTY});

  DataBySlot.fromJson(Map<String, dynamic> json) {
    lINENAME = json['LINE_NAME'];
    mACHINE = json['MACHINE'];
    sLOTNO = json['SLOT_NO'];
    lM = json['LM'];
    tOTALQTY = json['TOTAL_QTY'];
    fAILQTY = json['FAIL_QTY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LINE_NAME'] = lINENAME;
    data['MACHINE'] = mACHINE;
    data['SLOT_NO'] = sLOTNO;
    data['LM'] = lM;
    data['TOTAL_QTY'] = tOTALQTY;
    data['FAIL_QTY'] = fAILQTY;
    return data;
  }
}

class DataByError {
  String? lINENAME;
  String? mACHINE;
  String? lM;
  String? eRROR;
  int? fAILQTY;

  DataByError({this.lINENAME, this.mACHINE, this.lM, this.eRROR, this.fAILQTY});

  DataByError.fromJson(Map<String, dynamic> json) {
    lINENAME = json['LINE_NAME'];
    mACHINE = json['MACHINE'];
    lM = json['LM'];
    eRROR = json['ERROR'];
    fAILQTY = json['FAIL_QTY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LINE_NAME'] = lINENAME;
    data['MACHINE'] = mACHINE;
    data['LM'] = lM;
    data['ERROR'] = eRROR;
    data['FAIL_QTY'] = fAILQTY;
    return data;
  }
}

class DataByTime {
  String? lINENAME;
  String? mACHINE;
  String? dATETIME;
  String? lM;
  int? tOTALQTY;
  int? fAILQTY;

  DataByTime(
      {this.lINENAME,
        this.mACHINE,
        this.dATETIME,
        this.lM,
        this.tOTALQTY,
        this.fAILQTY});

  DataByTime.fromJson(Map<String, dynamic> json) {
    lINENAME = json['LINE_NAME'];
    mACHINE = json['MACHINE'];
    dATETIME = json['DATE_TIME'];
    lM = json['LM'];
    tOTALQTY = json['TOTAL_QTY'];
    fAILQTY = json['FAIL_QTY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LINE_NAME'] = lINENAME;
    data['MACHINE'] = mACHINE;
    data['DATE_TIME'] = dATETIME;
    data['LM'] = lM;
    data['TOTAL_QTY'] = tOTALQTY;
    data['FAIL_QTY'] = fAILQTY;
    return data;
  }
}
