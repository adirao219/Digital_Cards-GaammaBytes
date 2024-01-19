class CommonDropdownResp {
  bool? isSuccess;
  List<Result>? result;
  dynamic errorMessage;

  CommonDropdownResp({this.isSuccess, this.result, this.errorMessage});

  CommonDropdownResp.fromJson(Map<String, dynamic> json) {
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
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Result({this.disabled, this.group, this.selected, this.text, this.value});

  Result.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'] ?? 'hi_IN';
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.disabled != null) {
      data['Disabled'] = this.disabled;
    }
    if (this.group != null) {
      data['Group'] = this.group;
    }
    if (this.selected != null) {
      data['Selected'] = this.selected;
    }
    if (this.text != null) {
      data['Text'] = this.text;
    }
    if (this.value != null) {
      data['Value'] = this.value;
    }
    return data;
  }
}
class CaptionMessageResult {
  bool? isSuccess;
  List<DefaultCaptionMessageData>? result;
  dynamic errorMessage;

  CaptionMessageResult({this.isSuccess, this.result, this.errorMessage});

  CaptionMessageResult.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Result'] != null) {
      result = <DefaultCaptionMessageData>[];
      json['Result'].forEach((v) {
        result?.add(DefaultCaptionMessageData.fromJson(v));
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
class DefaultCaptionMessageData {
  int? id;
  int? typeID;
  String? typeIDName;
  int? greetingTypeID;
  String? greetingTypeIDName;
  int? languageID;
  String? languageName;
  String? details;

  DefaultCaptionMessageData(
      {this.id,
      this.typeID,
      this.typeIDName,
      this.greetingTypeID,
      this.greetingTypeIDName,
      this.languageID,
      this.languageName,
      this.details});

  DefaultCaptionMessageData.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    typeID = json['TypeID'];
    typeIDName = json['TypeIDName'];
    greetingTypeID = json['GreetingTypeID'];
    greetingTypeIDName = json['GreetingTypeIDName'];
    languageID = json['LanguageID'];
    languageName = json['LanguageName'];
    details = json['Details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['ID'] = this.id;
    }
    if (this.typeID != null) {
      data['TypeID'] = this.typeID;
    }
    if (this.typeIDName != null) {
      data['TypeIDName'] = this.typeIDName;
    }
    if (this.greetingTypeID != null) {
      data['GreetingTypeID'] = this.greetingTypeID;
    }
    if (this.greetingTypeIDName != null) {
      data['GreetingTypeIDName'] = this.greetingTypeIDName;
    }
    if (this.languageID != null) {
      data['LanguageID'] = this.languageID;
    }
    if (this.languageName != null) {
      data['LanguageName'] = this.languageName;
    }
    if (this.details != null) {
      data['Details'] = this.details;
    }
    return data;
  }
}
