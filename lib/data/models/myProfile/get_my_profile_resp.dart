class GetMyProfileResp {
  bool? isSuccess;
  ProfileResult? result;
  dynamic errorMessage;

  GetMyProfileResp({this.isSuccess, this.result, this.errorMessage});

  GetMyProfileResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? ProfileResult.fromJson(json['Result']) : null;
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.isSuccess != null) {
      data['IsSuccess'] = this.isSuccess;
    }
    if (this.result != null) {
      data['Result'] = this.result?.toJson();
    }
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage;
    }
    return data;
  }
}

class ProfileResult {
  String? userId;
  int? id;
  String? displayName;
  String? email;
  String? phoneNumber;
  dynamic place;
  String? country;
  List<CountryList>? countryList;
  String? countryCode;
  List<CountryCodeList>? countryCodeList;
  String? regDate;
  int? languageId;
  dynamic languageIdName;
  List<LanguageIdList>? languageIdList;

  ProfileResult(
      {this.userId,
      this.id,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.place,
      this.country,
      this.countryList,
      this.countryCode,
      this.countryCodeList,
      this.regDate,
      this.languageId,
      this.languageIdName,
      this.languageIdList});

  ProfileResult.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    id = json['Id'];
    displayName = json['DisplayName'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    place = json['Place'];
    country = json['Country'];
    if (json['CountryList'] != null) {
      countryList = <CountryList>[];
      json['CountryList'].forEach((v) {
        countryList?.add(CountryList.fromJson(v));
      });
    }
    countryCode = json['CountryCode'];
    if (json['CountryCodeList'] != null) {
      countryCodeList = <CountryCodeList>[];
      json['CountryCodeList'].forEach((v) {
        countryCodeList?.add(CountryCodeList.fromJson(v));
      });
    }
    regDate = json['RegDate'];
    languageId = json['LanguageId'];
    languageIdName = json['LanguageIdName'];
    if (json['LanguageIdList'] != null) {
      languageIdList = <LanguageIdList>[];
      json['LanguageIdList'].forEach((v) {
        languageIdList?.add(LanguageIdList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.userId != null) {
      data['UserId'] = this.userId;
    }
    if (this.id != null) {
      data['Id'] = this.id;
    }
    if (this.displayName != null) {
      data['DisplayName'] = this.displayName;
    }
    if (this.email != null) {
      data['Email'] = this.email;
    }
    if (this.phoneNumber != null) {
      data['PhoneNumber'] = this.phoneNumber;
    }
    if (this.place != null) {
      data['Place'] = this.place;
    }
    if (this.country != null) {
      data['Country'] = this.country;
    }
    if (this.countryList != null) {
      data['CountryList'] = this.countryList?.map((v) => v.toJson()).toList();
    }
    if (this.countryCode != null) {
      data['CountryCode'] = this.countryCode;
    }
    if (this.countryCodeList != null) {
      data['CountryCodeList'] =
          this.countryCodeList?.map((v) => v.toJson()).toList();
    }
    if (this.regDate != null) {
      data['RegDate'] = this.regDate;
    }
    if (this.languageId != null) {
      data['LanguageId'] = this.languageId;
    }
    if (this.languageIdName != null) {
      data['LanguageIdName'] = this.languageIdName;
    }
    if (this.languageIdList != null) {
      data['LanguageIdList'] =
          this.languageIdList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  CountryList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  CountryList.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
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

class CountryCodeList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  CountryCodeList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  CountryCodeList.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
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

class LanguageIdList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  LanguageIdList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  LanguageIdList.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
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
