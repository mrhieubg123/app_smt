class PickupRateDetailAnalysisModel {
  List<ItemPickupRateDetailAnalysisModel>? data;

  PickupRateDetailAnalysisModel({this.data});

  PickupRateDetailAnalysisModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ItemPickupRateDetailAnalysisModel>[];
      json['data'].forEach((v) {
        data!.add(new ItemPickupRateDetailAnalysisModel.fromJson(v));
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

class ItemPickupRateDetailAnalysisModel {
  String? lINENAME;
  String? mACHINE;
  String? pARTNAME;
  String? fEEDERSN;
  String? sLOTNO;
  String? mO;
  int? tOTALQTY;
  int? fAILQTY;
  double? pickupRate;
  double? pickupRateBefo;
  String? trend;
  double? diff;

  ItemPickupRateDetailAnalysisModel(
      {this.lINENAME,
        this.mACHINE,
        this.pARTNAME,
        this.fEEDERSN,
        this.sLOTNO,
        this.mO,
        this.tOTALQTY,
        this.fAILQTY,
        this.pickupRate,
        this.pickupRateBefo,
        this.trend,
        this.diff});

  ItemPickupRateDetailAnalysisModel.fromJson(Map<String, dynamic> json) {
    lINENAME = json['LINE_NAME'];
    mACHINE = json['MACHINE'];
    pARTNAME = json['PART_NAME'];
    fEEDERSN = json['FEEDER_SN'];
    sLOTNO = json['SLOT_NO'];
    mO = json['MO'];
    tOTALQTY = json['TOTAL_QTY'];
    fAILQTY = json['FAIL_QTY'];
    pickupRate = json['PickupRate'];
    pickupRateBefo = json['PickupRateBefo'];
    trend = json['Trend'];
    diff = json['Diff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LINE_NAME'] = this.lINENAME;
    data['MACHINE'] = this.mACHINE;
    data['PART_NAME'] = this.pARTNAME;
    data['FEEDER_SN'] = this.fEEDERSN;
    data['SLOT_NO'] = this.sLOTNO;
    data['MO'] = this.mO;
    data['TOTAL_QTY'] = this.tOTALQTY;
    data['FAIL_QTY'] = this.fAILQTY;
    data['PickupRate'] = this.pickupRate;
    data['PickupRateBefo'] = this.pickupRateBefo;
    data['Trend'] = this.trend;
    data['Diff'] = this.diff;
    return data;
  }
}
