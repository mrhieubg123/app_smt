class ErrorDetailTotalModel {
  List<ErrorCauseSolutionModel>? data;

  ErrorDetailTotalModel({this.data});

  ErrorDetailTotalModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ErrorCauseSolutionModel>[];
      json['data'].forEach((v) {
        data!.add(ErrorCauseSolutionModel.fromJson(v));
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

class ErrorCauseSolutionModel {
  int? id;
  String? subCode;
  String? nameError;
  String? cause;
  String? solution;
  int? usedCount;

  ErrorCauseSolutionModel({this.id, this.subCode, this.nameError, this.cause, this.solution, this.usedCount});

  ErrorCauseSolutionModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    subCode = json['Sub_code'];
    nameError = json['Name_error'];
    cause = json['Cause'];
    solution = json['solution'];
    usedCount = json['usedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = id;
    data['Sub_code'] = subCode;
    data['Name_error'] = nameError;
    data['Cause'] = cause;
    data['solution'] = solution;
    data['usedCount'] = usedCount;
    return data;
  }
}
