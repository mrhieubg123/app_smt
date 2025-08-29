class ListErrorNotConfirmModel {
  List<ErrorNotConfirmModel>? data;

  ListErrorNotConfirmModel({this.data});

  ListErrorNotConfirmModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ErrorNotConfirmModel>[];
      json['data'].forEach((v) {
        data!.add(ErrorNotConfirmModel.fromJson(v));
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
  String? iD;
  String? line;
  String? timeAlarm;
  String? dateAlarm;
  String? content;
  String? eMPConfirm;
  String? root;
  String? act;
  String? type;
  String? dateTime;
  int? iDD;
  String? signal;
  String? signalTuan;
  String? mark;

  ErrorNotConfirmModel(
      {this.iD,
        this.line,
        this.timeAlarm,
        this.dateAlarm,
        this.content,
        this.eMPConfirm,
        this.root,
        this.act,
        this.type,
        this.dateTime,
        this.iDD,
        this.signal,
        this.signalTuan,
        this.mark});

  ErrorNotConfirmModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    line = json['line'];
    timeAlarm = json['time_alarm'];
    dateAlarm = json['date_alarm'];
    content = json['content'];
    eMPConfirm = json['EMP_confirm'];
    root = json['root_'];
    act = json['act'];
    type = json['type'];
    dateTime = json['date_time'];
    iDD = json['IDD'];
    signal = json['signal'];
    signalTuan = json['signal_tuan'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['line'] = line;
    data['time_alarm'] = timeAlarm;
    data['date_alarm'] = dateAlarm;
    data['content'] = content;
    data['EMP_confirm'] = eMPConfirm;
    data['root_'] = root;
    data['act'] = act;
    data['type'] = type;
    data['date_time'] = dateTime;
    data['IDD'] = iDD;
    data['signal'] = signal;
    data['signal_tuan'] = signalTuan;
    data['mark'] = mark;
    return data;
  }
}
