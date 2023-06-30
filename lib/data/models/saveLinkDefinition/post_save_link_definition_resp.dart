class PostSaveLinkDefinitionResp {
  bool? result;
  List? errorMessage;

  PostSaveLinkDefinitionResp({this.result, this.errorMessage});

  PostSaveLinkDefinitionResp.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['errorMessage'] != null) {
      errorMessage = [];
      json['errorMessage'].forEach((v) {
        errorMessage?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.result != null) {
      data['result'] = this.result;
    }
    if (this.errorMessage != null) {
      data['errorMessage'] = this.errorMessage?.map((v) => v).toList();
    }
    return data;
  }
}
