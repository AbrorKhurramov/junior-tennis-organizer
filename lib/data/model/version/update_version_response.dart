class UpdateVersionResponse {
  String? status;
  String? message;
  UpdateVersion? data;

  UpdateVersionResponse({this.status, this.message, this.data});

  UpdateVersionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UpdateVersion.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UpdateVersion {
  String? appName;
  String? version;
  bool? isRequired;

  UpdateVersion({this.appName, this.version, this.isRequired});

  UpdateVersion.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    version = json['version'];
    isRequired = json['isRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appName'] = appName;
    data['version'] = version;
    data['isRequired'] = isRequired;
    return data;
  }
}
