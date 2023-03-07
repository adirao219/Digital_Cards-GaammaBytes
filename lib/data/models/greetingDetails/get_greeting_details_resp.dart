class GetGreetingDetailsResp {
  bool? isSuccess;
  GreetingDetailResult? result;
  dynamic errorMessage;

  GetGreetingDetailsResp({this.isSuccess, this.result, this.errorMessage});

  GetGreetingDetailsResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? GreetingDetailResult.fromJson(json['Result']) : null;
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

class GreetingDetailResult {
  GreetingDetailsData? greetingDetailsData;
  
  List<GreetingListDetail>? greetingDetailsList;
  int? totalCount;
  List<HiddenFilter>? hiddenFilter;
  List<StringFilter>? stringFilter;
  List<NumericDateFilter>? numericDateFilter;
  dynamic addMasterList;

  GreetingDetailResult(
      {this.greetingDetailsData,
      this.greetingDetailsList,
      this.totalCount,
      this.hiddenFilter,
      this.stringFilter,
      this.numericDateFilter,
      this.addMasterList});

  GreetingDetailResult.fromJson(Map<String, dynamic> json) {
    greetingDetailsData = json['GreetingDetailsData'] != null
        ? GreetingDetailsData.fromJson(json['GreetingDetailsData'])
        : null;
    

    if (json['GreetingDetailsList'] != null) {
      greetingDetailsList = <GreetingListDetail>[];
      json['GreetingDetailsList'].forEach((v) {
        greetingDetailsList!.add(new GreetingListDetail.fromJson(v));
      });
    }
    totalCount = json['TotalCount'];
    if (json['HiddenFilter'] != null) {
      hiddenFilter = <HiddenFilter>[];
      json['HiddenFilter'].forEach((v) {
        hiddenFilter?.add(HiddenFilter.fromJson(v));
      });
    }
    if (json['StringFilter'] != null) {
      stringFilter = <StringFilter>[];
      json['StringFilter'].forEach((v) {
        stringFilter?.add(StringFilter.fromJson(v));
      });
    }
    if (json['NumericDateFilter'] != null) {
      numericDateFilter = <NumericDateFilter>[];
      json['NumericDateFilter'].forEach((v) {
        numericDateFilter?.add(NumericDateFilter.fromJson(v));
      });
    }
    addMasterList = json['AddMasterList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.greetingDetailsData != null) {
      data['GreetingDetailsData'] = this.greetingDetailsData?.toJson();
    }
    if (this.greetingDetailsList != null) {
      data['GreetingDetailsList'] =
          this.greetingDetailsList!.map((v) => v.toJson()).toList();
    }
    if (this.totalCount != null) {
      data['TotalCount'] = this.totalCount;
    }
    if (this.hiddenFilter != null) {
      data['HiddenFilter'] = this.hiddenFilter?.map((v) => v.toJson()).toList();
    }
    if (this.stringFilter != null) {
      data['StringFilter'] = this.stringFilter?.map((v) => v.toJson()).toList();
    }
    if (this.numericDateFilter != null) {
      data['NumericDateFilter'] =
          this.numericDateFilter?.map((v) => v.toJson()).toList();
    }
    if (this.addMasterList != null) {
      data['AddMasterList'] = this.addMasterList;
    }
    return data;
  }
}

class GreetingDetailsData {
  int? id;
  int? userId;
  dynamic userIdString;
  dynamic displayName;
  dynamic userEmail;
  dynamic companyName;
  int? typeID;
  dynamic typeIDName;
  List<TypeIDList>? typeIDList;
  int? languageID;
  dynamic languageName;
  dynamic languageList;
  int? templateID;
  dynamic templateName;
  List<TemplateList>? templateList;
  dynamic name;
  dynamic creditExpiryDate;
  dynamic createdDate;
  dynamic publishedDate;
  int? greetingStatus;
  dynamic greetingStatusName;
  dynamic caption;
  dynamic message;
  dynamic sender;
  bool? userPicture;
  dynamic picture;
  dynamic pictureRef;
  dynamic logo;
  dynamic logoRef;
  int? previewOption;
  dynamic publishFolder;
  dynamic thumbnailImage;

  GreetingDetailsData(
      {this.id,
      this.userId,
      this.userIdString,
      this.displayName,
      this.userEmail,
      this.companyName,
      this.typeID,
      this.typeIDName,
      this.typeIDList,
      this.languageID,
      this.languageName,
      this.languageList,
      this.templateID,
      this.templateName,
      this.templateList,
      this.name,
      this.creditExpiryDate,
      this.createdDate,
      this.publishedDate,
      this.greetingStatus,
      this.greetingStatusName,
      this.caption,
      this.message,
      this.sender,
      this.userPicture,
      this.picture,
      this.pictureRef,
      this.logo,
      this.logoRef,
      this.previewOption,
      this.publishFolder,
      this.thumbnailImage});

  GreetingDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    userId = json['UserId'];
    userIdString = json['UserIdString'];
    displayName = json['DisplayName'];
    userEmail = json['UserEmail'];
    companyName = json['CompanyName'];
    typeID = json['TypeID'];
    typeIDName = json['TypeIDName'];
    if (json['TypeIDList'] != null) {
      typeIDList = <TypeIDList>[];
      json['TypeIDList'].forEach((v) {
        typeIDList?.add(TypeIDList.fromJson(v));
      });
    }
    languageID = json['LanguageID'];
    languageName = json['LanguageName'];
    languageList = json['LanguageList'];
    templateID = json['TemplateID'];
    templateName = json['TemplateName'];
    if (json['TemplateList'] != null) {
      templateList = <TemplateList>[];
      json['TemplateList'].forEach((v) {
        templateList?.add(TemplateList.fromJson(v));
      });
    }
    name = json['Name'];
    creditExpiryDate = json['CreditExpiryDate'];
    createdDate = json['CreatedDate'];
    publishedDate = json['PublishedDate'];
    greetingStatus = json['GreetingStatus'];
    greetingStatusName = json['GreetingStatusName'];
    caption = json['Caption'];
    message = json['Message'];
    sender = json['Sender'];
    userPicture = json['UserPicture'];
    picture = json['Picture'];
    pictureRef = json['PictureRef'];
    logo = json['Logo'];
    logoRef = json['LogoRef'];
    previewOption = json['PreviewOption'];
    publishFolder = json['PublishFolder'];
    thumbnailImage = json['ThumbnailImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['ID'] = this.id;
    }
    if (this.userId != null) {
      data['UserId'] = this.userId;
    }
    if (this.userIdString != null) {
      data['UserIdString'] = this.userIdString;
    }
    if (this.displayName != null) {
      data['DisplayName'] = this.displayName;
    }
    if (this.userEmail != null) {
      data['UserEmail'] = this.userEmail;
    }
    if (this.companyName != null) {
      data['CompanyName'] = this.companyName;
    }
    if (this.typeID != null) {
      data['TypeID'] = this.typeID;
    }
    if (this.typeIDName != null) {
      data['TypeIDName'] = this.typeIDName;
    }
    if (this.typeIDList != null) {
      data['TypeIDList'] = this.typeIDList?.map((v) => v.toJson()).toList();
    }
    if (this.languageID != null) {
      data['LanguageID'] = this.languageID;
    }
    if (this.languageName != null) {
      data['LanguageName'] = this.languageName;
    }
    if (this.languageList != null) {
      data['LanguageList'] = this.languageList;
    }
    if (this.templateID != null) {
      data['TemplateID'] = this.templateID;
    }
    if (this.templateName != null) {
      data['TemplateName'] = this.templateName;
    }
    if (this.templateList != null) {
      data['TemplateList'] = this.templateList?.map((v) => v.toJson()).toList();
    }
    if (this.name != null) {
      data['Name'] = this.name;
    }
    if (this.creditExpiryDate != null) {
      data['CreditExpiryDate'] = this.creditExpiryDate;
    }
    if (this.createdDate != null) {
      data['CreatedDate'] = this.createdDate;
    }
    if (this.publishedDate != null) {
      data['PublishedDate'] = this.publishedDate;
    }
    if (this.greetingStatus != null) {
      data['GreetingStatus'] = this.greetingStatus;
    }
    if (this.greetingStatusName != null) {
      data['GreetingStatusName'] = this.greetingStatusName;
    }
    if (this.caption != null) {
      data['Caption'] = this.caption;
    }
    if (this.message != null) {
      data['Message'] = this.message;
    }
    if (this.sender != null) {
      data['Sender'] = this.sender;
    }
    if (this.userPicture != null) {
      data['UserPicture'] = this.userPicture;
    }
    if (this.picture != null) {
      data['Picture'] = this.picture;
    }
    if (this.pictureRef != null) {
      data['PictureRef'] = this.pictureRef;
    }
    if (this.logo != null) {
      data['Logo'] = this.logo;
    }
    if (this.logoRef != null) {
      data['LogoRef'] = this.logoRef;
    }
    if (this.previewOption != null) {
      data['PreviewOption'] = this.previewOption;
    }
    if (this.publishFolder != null) {
      data['PublishFolder'] = this.publishFolder;
    }
    if (this.thumbnailImage != null) {
      data['ThumbnailImage'] = this.thumbnailImage;
    }
    return data;
  }
}

class TypeIDList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  TypeIDList({this.disabled, this.group, this.selected, this.text, this.value});

  TypeIDList.fromJson(Map<String, dynamic> json) {
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

class TemplateList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  TemplateList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  TemplateList.fromJson(Map<String, dynamic> json) {
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

class HiddenFilter {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  HiddenFilter(
      {this.disabled, this.group, this.selected, this.text, this.value});

  HiddenFilter.fromJson(Map<String, dynamic> json) {
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

class StringFilter {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  StringFilter(
      {this.disabled, this.group, this.selected, this.text, this.value});

  StringFilter.fromJson(Map<String, dynamic> json) {
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

class NumericDateFilter {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  NumericDateFilter(
      {this.disabled, this.group, this.selected, this.text, this.value});

  NumericDateFilter.fromJson(Map<String, dynamic> json) {
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
class GreetingListDetail {
  int? iD;
  int? userId;
  String? userIdString;
  String? displayName;
  String? userEmail;
  String? companyName;
  int? typeID;
  String? typeIDName;
  String? typeIDList;
  int? languageID;
  String? languageName;
  String? languageList;
  int? templateID;
  String? templateName;
  String? templateList;
  String? name;
  String? creditExpiryDate;
  String? createdDate;
  String? publishedDate;
  int? greetingStatus;
  String? greetingStatusName;
  String? caption;
  String? message;
  String? sender;
  bool? userPicture;
  String? picture;
  String? pictureRef;
  String? logo;
  String? logoRef;
  int? logoPosition;
  String? logoPositionName;
  String? logoPositionList;
  int? contentPosition;
  String? contentPositionName;
  String? contentPositionList;
  String? lastEditDate;
  int? previewOption;
  String? publishFolder;
  String? thumbnailImage;

  GreetingListDetail(
      {this.iD,
      this.userId,
      this.userIdString,
      this.displayName,
      this.userEmail,
      this.companyName,
      this.typeID,
      this.typeIDName,
      this.typeIDList,
      this.languageID,
      this.languageName,
      this.languageList,
      this.templateID,
      this.templateName,
      this.templateList,
      this.name,
      this.creditExpiryDate,
      this.createdDate,
      this.publishedDate,
      this.greetingStatus,
      this.greetingStatusName,
      this.caption,
      this.message,
      this.sender,
      this.userPicture,
      this.picture,
      this.pictureRef,
      this.logo,
      this.logoRef,
      this.logoPosition,
      this.logoPositionName,
      this.logoPositionList,
      this.contentPosition,
      this.contentPositionName,
      this.contentPositionList,
      this.lastEditDate,
      this.previewOption,
      this.publishFolder,
      this.thumbnailImage});

  GreetingListDetail.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userId = json['UserId'];
    userIdString = json['UserIdString'];
    displayName = json['DisplayName'];
    userEmail = json['UserEmail'];
    companyName = json['CompanyName'];
    typeID = json['TypeID'];
    typeIDName = json['TypeIDName'];
    typeIDList = json['TypeIDList'];
    languageID = json['LanguageID'];
    languageName = json['LanguageName'];
    languageList = json['LanguageList'];
    templateID = json['TemplateID'];
    templateName = json['TemplateName'];
    templateList = json['TemplateList'];
    name = json['Name'];
    creditExpiryDate = json['CreditExpiryDate'];
    createdDate = json['CreatedDate'];
    publishedDate = json['PublishedDate'];
    greetingStatus = json['GreetingStatus'];
    greetingStatusName = json['GreetingStatusName'];
    caption = json['Caption'];
    message = json['Message'];
    sender = json['Sender'];
    userPicture = json['UserPicture'];
    picture = json['Picture'];
    pictureRef = json['PictureRef'];
    logo = json['Logo'];
    logoRef = json['LogoRef'];
    logoPosition = json['LogoPosition'];
    logoPositionName = json['LogoPositionName'];
    logoPositionList = json['LogoPositionList'];
    contentPosition = json['ContentPosition'];
    contentPositionName = json['ContentPositionName'];
    contentPositionList = json['ContentPositionList'];
    lastEditDate = json['LastEditDate'];
    previewOption = json['PreviewOption'];
    publishFolder = json['PublishFolder'];
    thumbnailImage = json['ThumbnailImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['UserId'] = this.userId;
    data['UserIdString'] = this.userIdString;
    data['DisplayName'] = this.displayName;
    data['UserEmail'] = this.userEmail;
    data['CompanyName'] = this.companyName;
    data['TypeID'] = this.typeID;
    data['TypeIDName'] = this.typeIDName;
    data['TypeIDList'] = this.typeIDList;
    data['LanguageID'] = this.languageID;
    data['LanguageName'] = this.languageName;
    data['LanguageList'] = this.languageList;
    data['TemplateID'] = this.templateID;
    data['TemplateName'] = this.templateName;
    data['TemplateList'] = this.templateList;
    data['Name'] = this.name;
    data['CreditExpiryDate'] = this.creditExpiryDate;
    data['CreatedDate'] = this.createdDate;
    data['PublishedDate'] = this.publishedDate;
    data['GreetingStatus'] = this.greetingStatus;
    data['GreetingStatusName'] = this.greetingStatusName;
    data['Caption'] = this.caption;
    data['Message'] = this.message;
    data['Sender'] = this.sender;
    data['UserPicture'] = this.userPicture;
    data['Picture'] = this.picture;
    data['PictureRef'] = this.pictureRef;
    data['Logo'] = this.logo;
    data['LogoRef'] = this.logoRef;
    data['LogoPosition'] = this.logoPosition;
    data['LogoPositionName'] = this.logoPositionName;
    data['LogoPositionList'] = this.logoPositionList;
    data['ContentPosition'] = this.contentPosition;
    data['ContentPositionName'] = this.contentPositionName;
    data['ContentPositionList'] = this.contentPositionList;
    data['LastEditDate'] = this.lastEditDate;
    data['PreviewOption'] = this.previewOption;
    data['PublishFolder'] = this.publishFolder;
    data['ThumbnailImage'] = this.thumbnailImage;
    return data;
  }
}
