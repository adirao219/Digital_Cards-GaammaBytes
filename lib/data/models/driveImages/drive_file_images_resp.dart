class GetDriveFileImagesResp {
  bool? isSuccess;
  List<DriveFilesData>? result;
  dynamic errorMessage;

  GetDriveFileImagesResp({this.isSuccess, this.result, this.errorMessage});

  GetDriveFileImagesResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
      if (json['Result'] != null && json['Result']['DriveFilesList']!=null) {
      result = <DriveFilesData>[];
      json['Result']['DriveFilesList'].forEach((v) {
        result?.add(DriveFilesData.fromJson(v));
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

class DriveFilesData {
  int? id;
  int? userId;
  int? refTypeID;
  int? refID;
  int? slNo;
  String? driveRefID;
  String? driveUrl;
  String? fileName;
  dynamic fileSize;
  bool? isPreDefined;

  DriveFilesData(
      {this.id,
      this.userId,
      this.refTypeID,
      this.refID,
      this.slNo,
      this.driveRefID,
      this.driveUrl,
      this.fileName,
      this.fileSize,
      this.isPreDefined});

  DriveFilesData.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    userId = json['UserId'];
    refTypeID = json['RefTypeID'];
    refID = json['RefID'];
    slNo = json['SlNo'];
    driveRefID = json['DriveRefID'];
    driveUrl = json['DriveUrl'];
    fileName = json['FileName'];
    fileSize = json['FileSize'];
    isPreDefined = json['IsPreDefined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['ID'] = this.id;
    }
    if (this.userId != null) {
      data['UserId'] = this.userId;
    }
    if (this.refID != null) {
      data['RefID'] = this.refID;
    }
    if (this.refTypeID != null) {
      data['RefTypeID'] = this.refTypeID;
    }
    if (this.driveRefID != null) {
      data['DriveRefID'] = this.driveRefID;
    }
    if (this.driveUrl != null) {
      data['DriveUrl'] = this.driveUrl;
    }
    if (this.fileName != null) {
      data['FileName'] = this.fileName;
    }
    if (this.fileSize != null) {
      data['FileSize'] = this.fileSize;
    }
    if (this.isPreDefined != null) {
      data['IsPreDefined'] = this.isPreDefined;
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
  String? createdDateString;
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
  String? lastEditDateString;
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
      this.createdDateString,
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
      this.lastEditDateString,
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
    createdDateString = json['CreatedDateString'];
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
    lastEditDateString = json['LastEditDateString'];
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
    data['CreatedDateString'] = this.createdDateString;
    data['LastEditDateString'] = this.lastEditDateString;
    return data;
  }
}
