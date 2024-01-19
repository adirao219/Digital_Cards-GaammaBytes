class GetGetGreetingTypeResp {
  bool? isSuccess;
  List<Result>? result;
  dynamic errorMessage;

  GetGetGreetingTypeResp({this.isSuccess, this.result, this.errorMessage});

  GetGetGreetingTypeResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Result'] != null) {
      result = <Result>[];
      json['Result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.isSuccess != null) {
      data['IsSuccess'] = this.isSuccess;
    }
    if (this.result != null) {
      data['Result'] = this.result?.map((v) => v.toJson()).toList();
    }
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage;
    }
    return data;
  }
}

class Result {
  int? typeID;
  String? typeName;
  String? thumbnailURL;

  Result({ this.typeID, this.typeName,this.thumbnailURL});

  Result.fromJson(Map<String, dynamic> json) {
    thumbnailURL = json['ThumbnailImage'];
    typeName = json['TypeName'];
    typeID= json['TypeID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
   
    if (this.thumbnailURL != null) {
      data['ThumbnailImage'] = this.thumbnailURL;
    }
    if (this.typeID != null) {
      data['TypeID'] = this.typeID;
    }
    if (this.typeName != null) {
      data['TypeName'] = this.typeName;
    }
    return data;
  }
}
