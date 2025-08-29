class DataErrorCauseSolutionModel {
  List<ErrorCauseSolutionModel>? data;

  DataErrorCauseSolutionModel({this.data});

  DataErrorCauseSolutionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ErrorCauseSolutionModel>[];
      json['data'].forEach((v) {
        data!.add(ErrorCauseSolutionModel.fromJson(v));
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

class ErrorCauseSolutionModel {
  String? errorCode;
  String? causes;
  String? solution;

  ErrorCauseSolutionModel({this.errorCode, this.causes, this.solution});

  ErrorCauseSolutionModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    causes = json['causes'];
    solution = json['solution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    data['causes'] = causes;
    data['solution'] = solution;
    return data;
  }
}
