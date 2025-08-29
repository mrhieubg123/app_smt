class MachineTotalTrendModel {
  List<MachineTotalTrendByDay>? data;

  MachineTotalTrendModel({this.data});

  MachineTotalTrendModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MachineTotalTrendByDay>[];
      json['data'].forEach((v) {
        data!.add(MachineTotalTrendByDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MachineTotalTrendByDay {
  String? lINE;
  String? mACHINECODE;
  String? dATETIME;
  int? oK;
  int? nG;

  MachineTotalTrendByDay({this.lINE, this.mACHINECODE, this.dATETIME, this.oK, this.nG});

  MachineTotalTrendByDay.fromJson(Map<String, dynamic> json) {
    lINE = json['LINE'];
    mACHINECODE = json['MACHINE_CODE'];
    dATETIME = json['DATE_TIME'];
    oK = json['OK'];
    nG = json['NG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LINE'] = lINE;
    data['MACHINE_CODE'] = mACHINECODE;
    data['DATE_TIME'] = dATETIME;
    data['OK'] = oK;
    data['NG'] = nG;
    return data;
  }
}
