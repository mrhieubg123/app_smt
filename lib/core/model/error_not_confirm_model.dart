class ListErrorNotConfirmModel {
  List<ErrorNotConfirmModel>? data;

  ListErrorNotConfirmModel({this.data});

  ListErrorNotConfirmModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ErrorNotConfirmModel>[];
      json['data'].forEach((v) {
        data!.add( ErrorNotConfirmModel.fromJson(v));
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

class ErrorNotConfirmModel {
  String? id;
  String? lINE;
  String? mACHINECODE;
  String? sTATUS;
  String? eRROR;
  String? eRRORCODE;
  String? root;
  String? eMPConfirm;
  String? act;
  String? sTARTTIME;
  String? eNDTIME;
  int? tIMER;

  ErrorNotConfirmModel(
      {this.lINE,
        this.id,
        this.mACHINECODE,
        this.sTATUS,
        this.eRROR,
        this.eRRORCODE,
        this.root,
        this.eMPConfirm,
        this.act,
        this.sTARTTIME,
        this.eNDTIME,
        this.tIMER});

  ErrorNotConfirmModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lINE = json['LINE'];
    mACHINECODE = json['MACHINE_CODE'];
    sTATUS = json['STATUS'];
    eRROR = json['ERROR'];
    eRRORCODE = json['ERROR_CODE'];
    root = json['root_'];
    eMPConfirm = json['EMP_confirm'];
    act = json['act'];
    sTARTTIME = json['START_TIME'];
    eNDTIME = json['END_TIME'];
    tIMER = json['TIMER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['LINE'] = lINE;
    data['MACHINE_CODE'] = mACHINECODE;
    data['STATUS'] = sTATUS;
    data['ERROR'] = eRROR;
    data['ERROR_CODE'] = eRRORCODE;
    data['root_'] = root;
    data['EMP_confirm'] = eMPConfirm;
    data['act'] = act;
    data['START_TIME'] = sTARTTIME;
    data['END_TIME'] = eNDTIME;
    data['TIMER'] = tIMER;
    return data;
  }
}
