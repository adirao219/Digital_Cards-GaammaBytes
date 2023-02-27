class PostPreviewGreetingTemplateResp {
  bool? isSuccess;
  Result? result;
  dynamic errorMessage;

  PostPreviewGreetingTemplateResp(
      {this.isSuccess, this.result, this.errorMessage});

  PostPreviewGreetingTemplateResp.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? typeID;
  String? typeName;
  dynamic typeNameList;
  int? languageID;
  dynamic languageName;
  dynamic languageList;
  String? templateName;
  String? background;
  bool? userPicture;
  int? pictureHeight;
  int? pictureWidth;
  String? hTMLContent;
  String? captionDefault;
  String? messageDefault;
  String? senderDefault;
  String? headerData1;
  String? headerData2;
  String? headerData3;
  String? headerData4;
  String? cSSVariables;
  String? htmldata;
  dynamic thumbnailImage;

  Result(
      {this.id,
      this.typeID,
      this.typeName,
      this.typeNameList,
      this.languageID,
      this.languageName,
      this.languageList,
      this.templateName,
      this.background,
      this.userPicture,
      this.pictureHeight,
      this.pictureWidth,
      this.hTMLContent,
      this.captionDefault,
      this.messageDefault,
      this.senderDefault,
      this.headerData1,
      this.headerData2,
      this.headerData3,
      this.headerData4,
      this.cSSVariables,
      this.htmldata,
      this.thumbnailImage});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    typeID = json['TypeID'];
    typeName = json['TypeName'];
    typeNameList = json['TypeNameList'];
    languageID = json['LanguageID'];
    languageName = json['LanguageName'];
    languageList = json['LanguageList'];
    templateName = json['TemplateName'];
    background = json['Background'];
    userPicture = json['UserPicture'];
    pictureHeight = json['PictureHeight'];
    pictureWidth = json['PictureWidth'];
    hTMLContent = json['HTMLContent'];
    captionDefault = json['CaptionDefault'];
    messageDefault = json['MessageDefault'];
    senderDefault = json['SenderDefault'];
    headerData1 = json['HeaderData1'];
    headerData2 = json['HeaderData2'];
    headerData3 = json['HeaderData3'];
    headerData4 = json['HeaderData4'];
    cSSVariables = json['CSSVariables'];
    htmldata = json['htmldata'];
    thumbnailImage = json['ThumbnailImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['ID'] = this.id;
    }
    if (this.typeID != null) {
      data['TypeID'] = this.typeID;
    }
    if (this.typeName != null) {
      data['TypeName'] = this.typeName;
    }
    if (this.typeNameList != null) {
      data['TypeNameList'] = this.typeNameList;
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
    if (this.templateName != null) {
      data['TemplateName'] = this.templateName;
    }
    if (this.background != null) {
      data['Background'] = this.background;
    }
    if (this.userPicture != null) {
      data['UserPicture'] = this.userPicture;
    }
    if (this.pictureHeight != null) {
      data['PictureHeight'] = this.pictureHeight;
    }
    if (this.pictureWidth != null) {
      data['PictureWidth'] = this.pictureWidth;
    }
    if (this.hTMLContent != null) {
      data['HTMLContent'] = this.hTMLContent;
    }
    if (this.captionDefault != null) {
      data['CaptionDefault'] = this.captionDefault;
    }
    if (this.messageDefault != null) {
      data['MessageDefault'] = this.messageDefault;
    }
    if (this.senderDefault != null) {
      data['SenderDefault'] = this.senderDefault;
    }
    if (this.headerData1 != null) {
      data['HeaderData1'] = this.headerData1;
    }
    if (this.headerData2 != null) {
      data['HeaderData2'] = this.headerData2;
    }
    if (this.headerData3 != null) {
      data['HeaderData3'] = this.headerData3;
    }
    if (this.headerData4 != null) {
      data['HeaderData4'] = this.headerData4;
    }
    if (this.cSSVariables != null) {
      data['CSSVariables'] = this.cSSVariables;
    }
    if (this.htmldata != null) {
      data['htmldata'] = this.htmldata;
    }
    if (this.thumbnailImage != null) {
      data['ThumbnailImage'] = this.thumbnailImage;
    }
    return data;
  }
}
