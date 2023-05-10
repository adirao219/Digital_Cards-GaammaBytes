class GetGetCreateGreetingResp {
  bool? isSuccess;
  Result? result;
  dynamic errorMessage;

  GetGetCreateGreetingResp({this.isSuccess, this.result, this.errorMessage});

  GetGetCreateGreetingResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
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

class Result {
  GreetingDetailsData? greetingDetailsData;
  dynamic greetingDetailsList;
  int? totalCount;
  dynamic hiddenFilter;
  dynamic stringFilter;
  dynamic numericDateFilter;
  List? addMasterList;

  Result(
      {this.greetingDetailsData,
      this.greetingDetailsList,
      this.totalCount,
      this.hiddenFilter,
      this.stringFilter,
      this.numericDateFilter,
      this.addMasterList});

  Result.fromJson(Map<String, dynamic> json) {
    greetingDetailsData = json['GreetingDetailsData'] != null
        ? GreetingDetailsData.fromJson(json['GreetingDetailsData'])
        : null;
    greetingDetailsList = json['GreetingDetailsList'];
    totalCount = json['TotalCount'];
    hiddenFilter = json['HiddenFilter'];
    stringFilter = json['StringFilter'];
    numericDateFilter = json['NumericDateFilter'];
    if (json['AddMasterList'] != null) {
      addMasterList = [];
      json['AddMasterList'].forEach((v) {
        addMasterList?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.greetingDetailsData != null) {
      data['GreetingDetailsData'] = this.greetingDetailsData?.toJson();
    }
    if (this.greetingDetailsList != null) {
      data['GreetingDetailsList'] = this.greetingDetailsList;
    }
    if (this.totalCount != null) {
      data['TotalCount'] = this.totalCount;
    }
    if (this.hiddenFilter != null) {
      data['HiddenFilter'] = this.hiddenFilter;
    }
    if (this.stringFilter != null) {
      data['StringFilter'] = this.stringFilter;
    }
    if (this.numericDateFilter != null) {
      data['NumericDateFilter'] = this.numericDateFilter;
    }
    if (this.addMasterList != null) {
      data['AddMasterList'] = this.addMasterList?.map((v) => v).toList();
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
  String? typeIDName;
  List<TypeIDList>? typeIDList;
  int? languageID;
  dynamic languageName;
  List<LanguageList>? languageList;
  int? templateID;
  dynamic templateName;
  List<TemplateList>? templateList;
  dynamic name;
  dynamic creditExpiryDate;
  dynamic creditExpiryDateString;
  dynamic lastEditedDateString;
  dynamic createdDate;
  dynamic publishedDate;
  int? greetingStatus;
  String? greetingStatusName;
  dynamic caption;
  dynamic message;
  dynamic sender;
  bool? userPicture;
  bool? isBackgroundImage;
  dynamic picture;
  dynamic pictureRef;
  int? pictureOldId;
  int? logoOldId;
  dynamic logo;
  dynamic logoRef;
  int? previewOption;
  dynamic publishFolder;
  dynamic thumbnailImage;
  dynamic backgroundColor;
  String? backgroundColorHex;
  int? contentPosition;
  int? logoPosition;

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
      this.creditExpiryDateString,
      this.lastEditedDateString,
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
      this.logoOldId,
      this.pictureOldId,
      this.previewOption,
      this.backgroundColor,
      this.backgroundColorHex,
      this.publishFolder,
      this.isBackgroundImage,
      this.contentPosition,
      this.logoPosition,
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
    if (json['LanguageList'] != null) {
      languageList = <LanguageList>[];
      json['LanguageList'].forEach((v) {
        languageList?.add(LanguageList.fromJson(v));
      });
    }
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
    creditExpiryDateString = json['CreatedDateString'];
    lastEditedDateString= json['LastEditDateString'];
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
    logoOldId = json['LogoOldId'];
    pictureOldId = json['PictureOldId'];
    previewOption = json['PreviewOption'];
    publishFolder = json['PublishFolder'];
    thumbnailImage = json['ThumbnailImage'];
    contentPosition = json['ContentPosition'];
    logoPosition = json['LogoPosition'];
    isBackgroundImage= json['IsBackgroundImage'];
    backgroundColor = json['BackgroundColor'];
    backgroundColorHex = json['BackgroundColorHex'];
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
      data['LanguageList'] = this.languageList?.map((v) => v.toJson()).toList();
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
    if (this.creditExpiryDateString != null) {
      data['CreatedDateString'] = this.creditExpiryDateString;
    }
    if (this.lastEditedDateString != null) {
      data['LastEditDateString'] = this.lastEditedDateString;
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
    if (this.logoOldId != null) {
      data['LogoOldId'] = this.logoOldId;
    }
    if (this.pictureOldId != null) {
      data['PictureOldId'] = this.pictureOldId;
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

class LanguageList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  LanguageList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  LanguageList.fromJson(Map<String, dynamic> json) {
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
