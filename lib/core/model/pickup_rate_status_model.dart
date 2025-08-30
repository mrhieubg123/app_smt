class DataPickupRateStatusModel {
  List<PickupRateStatusModel>? data;

  DataPickupRateStatusModel({this.data});

  DataPickupRateStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PickupRateStatusModel>[];
      json['data'].forEach((v) {
        data!.add(PickupRateStatusModel.fromJson(v));
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

class PickupRateStatusModel {
  String? lINENAME;
  double? bN3H1;
  double? bN3H2;
  double? bN3H3;
  double? bN3H4;
  double? bN3H5;
  double? bN3H6;
  double? bN3G1;
  double? bN3G2;

  PickupRateStatusModel({
    this.lINENAME,
    this.bN3H1,
    this.bN3H2,
    this.bN3H3,
    this.bN3H4,
    this.bN3H5,
    this.bN3H6,
    this.bN3G1,
    this.bN3G2,
  });

  PickupRateStatusModel.fromJson(Map<String, dynamic> json) {
    lINENAME = json['LINE_NAME'];
    bN3H1 = json['BN3_H1'] == null
        ? null
        : double.tryParse(json['BN3_H1'].toString());
    bN3H2 = json['BN3_H2'] == null
        ? null
        : double.tryParse(json['BN3_H2'].toString());
    bN3H3 = json['BN3_H3'] == null
        ? null
        : double.tryParse(json['BN3_H3'].toString());
    bN3H4 = json['BN3_H4'] == null
        ? null
        : double.tryParse(json['BN3_H4'].toString());
    bN3H5 = json['BN3_H5'] == null
        ? null
        : double.tryParse(json['BN3_H5'].toString());
    bN3H6 = json['BN3_H6'] == null
        ? null
        : double.tryParse(json['BN3_H6'].toString());
    bN3G1 = json['BN3_G1'] == null
        ? null
        : double.tryParse(json['BN3_G1'].toString());
    bN3G2 = json['BN3_G2'] == null
        ? null
        : double.tryParse(json['BN3_G2'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LINE_NAME'] = lINENAME;
    data['BN3_H1'] = bN3H1;
    data['BN3_H2'] = bN3H2;
    data['BN3_H3'] = bN3H3;
    data['BN3_H4'] = bN3H4;
    data['BN3_H5'] = bN3H5;
    data['BN3_H6'] = bN3H6;
    data['BN3_G1'] = bN3G1;
    data['BN3_G2'] = bN3G2;
    return data;
  }
}
