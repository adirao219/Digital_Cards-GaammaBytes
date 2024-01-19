class PostGetThemeDetailsResp {
  bool? isSuccess;
  ThemeResult? result;
  String? errorMessage;

  PostGetThemeDetailsResp({this.isSuccess, this.result, this.errorMessage});

  PostGetThemeDetailsResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? ThemeResult.fromJson(json['Result']) : null;
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

class ThemeResult {
  int? themeID;
  int? languageID;
  dynamic languageName;
  String? themeFile;
  int? cardType;
  dynamic cardTypeName;
  int? cardSubType;
  dynamic cardSubTypeName;
  dynamic text1;
  dynamic text2;
  dynamic text3;
  dynamic text4;
  dynamic text5;
  dynamic text6;
  dynamic text7;
  dynamic text8;
  dynamic text9;
  dynamic text10;
  dynamic text11;
  dynamic text12;
  dynamic text13;
  dynamic text14;
  dynamic text15;
  dynamic picture1;
  dynamic picture2;
  dynamic picture1Size;
  dynamic picture2Size;
  int? themeColor;
  String? htmldata;
  String? themeColorHex;
  bool? changeColor;
  dynamic text1Default;
  dynamic text2Default;
  dynamic text3Default;
  dynamic text4Default;
  dynamic text5Default;
  dynamic text6Default;
  dynamic text7Default;
  dynamic text8Default;
  dynamic text9Default;
  dynamic text10Default;
  dynamic text11Default;
  dynamic text12Default;
  dynamic text13Default;
  dynamic text14Default;
  dynamic text15Default;
  int? footer1;
  int? footer2;
  int? footer3;
  int? footer4;
  int? footer5;
  int? footer6;
  int? footer7;
  int? footer8;
  String? headerData1;
  String? headerData2;
  String? headerData3;
  String? headerData4;
  String? thumbnailImage;
  String? background;
  dynamic backgroundRef;
  String? hTMLContent;
  dynamic cSSVariables;
  int? editorColor;
  String? editorColorHex;
  bool? isBackgroundImage;
  bool? autoGenerateThumbnail;
  int? contentPosition;
  int? logoPosition;
  dynamic logoPositionName;
  bool? userPicture;
  String? logoCaptionName;
  String? logoPositionCaptionName;

  ThemeResult(
      {this.themeID,
      this.languageID,
      this.languageName,
      this.themeFile,
      this.cardType,
      this.cardTypeName,
      this.cardSubType,
      this.cardSubTypeName,
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.text5,
      this.text6,
      this.text7,
      this.text8,
      this.text9,
      this.text10,
      this.text11,
      this.text12,
      this.text13,
      this.text14,
      this.text15,
      this.picture1,
      this.picture2,
      this.picture1Size,
      this.picture2Size,
      this.themeColor,
      this.htmldata,
      this.themeColorHex,
      this.changeColor,
      this.text1Default,
      this.text2Default,
      this.text3Default,
      this.text4Default,
      this.text5Default,
      this.text6Default,
      this.text7Default,
      this.text8Default,
      this.text9Default,
      this.text10Default,
      this.text11Default,
      this.text12Default,
      this.text13Default,
      this.text14Default,
      this.text15Default,
      this.footer1,
      this.footer2,
      this.footer3,
      this.footer4,
      this.footer5,
      this.footer6,
      this.footer7,
      this.footer8,
      this.headerData1,
      this.headerData2,
      this.headerData3,
      this.headerData4,
      this.thumbnailImage,
      this.background,
      this.backgroundRef,
      this.hTMLContent,
      this.cSSVariables,
      this.editorColor,
      this.editorColorHex,
      this.isBackgroundImage,
      this.autoGenerateThumbnail,
      this.contentPosition,
      this.logoPosition,
      this.logoPositionName,
      this.userPicture,
      this.logoCaptionName,
      this.logoPositionCaptionName
      });

  ThemeResult.fromJson(Map<String, dynamic> json) {
    themeID = json['ThemeID'];
    languageID = json['LanguageID'];
    languageName = json['LanguageName'];
    themeFile = json['ThemeFile'];
    cardType = json['CardType'];
    cardTypeName = json['CardTypeName'];
    cardSubType = json['CardSubType'];
    cardSubTypeName = json['CardSubTypeName'];
    text1 = json['Text1'];
    text2 = json['Text2'];
    text3 = json['Text3'];
    text4 = json['Text4'];
    text5 = json['Text5'];
    text6 = json['Text6'];
    text7 = json['Text7'];
    text8 = json['Text8'];
    text9 = json['Text9'];
    text10 = json['Text10'];
    text11 = json['Text11'];
    text12 = json['Text12'];
    text13 = json['Text13'];
    text14 = json['Text14'];
    text15 = json['Text15'];
    picture1 = json['Picture1'];
    picture2 = json['Picture2'];
    picture1Size = json['Picture1Size'];
    picture2Size = json['Picture2Size'];
    themeColor = json['ThemeColor'];
    htmldata = json['htmldata'];
    themeColorHex = json['ThemeColorHex'];
    changeColor = json['ChangeColor'];
    text1Default = json['Text1Default'];
    text2Default = json['Text2Default'];
    text3Default = json['Text3Default'];
    text4Default = json['Text4Default'];
    text5Default = json['Text5Default'];
    text6Default = json['Text6Default'];
    text7Default = json['Text7Default'];
    text8Default = json['Text8Default'];
    text9Default = json['Text9Default'];
    text10Default = json['Text10Default'];
    text11Default = json['Text11Default'];
    text12Default = json['Text12Default'];
    text13Default = json['Text13Default'];
    text14Default = json['Text14Default'];
    text15Default = json['Text15Default'];
    footer1 = json['Footer1'];
    footer2 = json['Footer2'];
    footer3 = json['Footer3'];
    footer4 = json['Footer4'];
    footer5 = json['Footer5'];
    footer6 = json['Footer6'];
    footer7 = json['Footer7'];
    footer8 = json['Footer8'];
    headerData1 = json['HeaderData1'];
    headerData2 = json['HeaderData2'];
    headerData3 = json['HeaderData3'];
    headerData4 = json['HeaderData4'];
    thumbnailImage = json['ThumbnailImage'];
    background = json['Background'];
    backgroundRef = json['BackgroundRef'];
    hTMLContent = json['HTMLContent'];
    cSSVariables = json['CSSVariables'];
    editorColor = json['EditorColor'];
    editorColorHex = json['EditorColorHex'];
    isBackgroundImage = json['IsBackgroundImage'];
    autoGenerateThumbnail = json['AutoGenerateThumbnail'];
    contentPosition = json['ContentPosition'];
    logoPosition = json['LogoPosition'];
    logoPositionName = json['LogoPositionName'];
    userPicture = json['UserPicture'];
    logoCaptionName = json['Picture2Caption'];
    logoPositionCaptionName = json['Picture2PositionCaption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.themeID != null) {
      data['ThemeID'] = this.themeID;
    }
    if (this.languageID != null) {
      data['LanguageID'] = this.languageID;
    }
    if (this.languageName != null) {
      data['LanguageName'] = this.languageName;
    }
    if (this.themeFile != null) {
      data['ThemeFile'] = this.themeFile;
    }
    if (this.cardType != null) {
      data['CardType'] = this.cardType;
    }
    if (this.cardTypeName != null) {
      data['CardTypeName'] = this.cardTypeName;
    }
    if (this.cardSubType != null) {
      data['CardSubType'] = this.cardSubType;
    }
    if (this.cardSubTypeName != null) {
      data['CardSubTypeName'] = this.cardSubTypeName;
    }
    if (this.text1 != null) {
      data['Text1'] = this.text1;
    }
    if (this.text2 != null) {
      data['Text2'] = this.text2;
    }
    if (this.text3 != null) {
      data['Text3'] = this.text3;
    }
    if (this.text4 != null) {
      data['Text4'] = this.text4;
    }
    if (this.text5 != null) {
      data['Text5'] = this.text5;
    }
    if (this.text6 != null) {
      data['Text6'] = this.text6;
    }
    if (this.text7 != null) {
      data['Text7'] = this.text7;
    }
    if (this.text8 != null) {
      data['Text8'] = this.text8;
    }
    if (this.text9 != null) {
      data['Text9'] = this.text9;
    }
    if (this.text10 != null) {
      data['Text10'] = this.text10;
    }
    if (this.text11 != null) {
      data['Text11'] = this.text11;
    }
    if (this.text12 != null) {
      data['Text12'] = this.text12;
    }
    if (this.text13 != null) {
      data['Text13'] = this.text13;
    }
    if (this.text14 != null) {
      data['Text14'] = this.text14;
    }
    if (this.text15 != null) {
      data['Text15'] = this.text15;
    }
    if (this.picture1 != null) {
      data['Picture1'] = this.picture1;
    }
    if (this.picture2 != null) {
      data['Picture2'] = this.picture2;
    }
    if (this.picture1Size != null) {
      data['Picture1Size'] = this.picture1Size;
    }
    if (this.picture2Size != null) {
      data['Picture2Size'] = this.picture2Size;
    }
    if (this.themeColor != null) {
      data['ThemeColor'] = this.themeColor;
    }
    if (this.htmldata != null) {
      data['htmldata'] = this.htmldata;
    }
    if (this.themeColorHex != null) {
      data['ThemeColorHex'] = this.themeColorHex;
    }
    if (this.changeColor != null) {
      data['ChangeColor'] = this.changeColor;
    }
    if (this.text1Default != null) {
      data['Text1Default'] = this.text1Default;
    }
    if (this.text2Default != null) {
      data['Text2Default'] = this.text2Default;
    }
    if (this.text3Default != null) {
      data['Text3Default'] = this.text3Default;
    }
    if (this.text4Default != null) {
      data['Text4Default'] = this.text4Default;
    }
    if (this.text5Default != null) {
      data['Text5Default'] = this.text5Default;
    }
    if (this.text6Default != null) {
      data['Text6Default'] = this.text6Default;
    }
    if (this.text7Default != null) {
      data['Text7Default'] = this.text7Default;
    }
    if (this.text8Default != null) {
      data['Text8Default'] = this.text8Default;
    }
    if (this.text9Default != null) {
      data['Text9Default'] = this.text9Default;
    }
    if (this.text10Default != null) {
      data['Text10Default'] = this.text10Default;
    }
    if (this.text11Default != null) {
      data['Text11Default'] = this.text11Default;
    }
    if (this.text12Default != null) {
      data['Text12Default'] = this.text12Default;
    }
    if (this.text13Default != null) {
      data['Text13Default'] = this.text13Default;
    }
    if (this.text14Default != null) {
      data['Text14Default'] = this.text14Default;
    }
    if (this.text15Default != null) {
      data['Text15Default'] = this.text15Default;
    }
    if (this.footer1 != null) {
      data['Footer1'] = this.footer1;
    }
    if (this.footer2 != null) {
      data['Footer2'] = this.footer2;
    }
    if (this.footer3 != null) {
      data['Footer3'] = this.footer3;
    }
    if (this.footer4 != null) {
      data['Footer4'] = this.footer4;
    }
    if (this.footer5 != null) {
      data['Footer5'] = this.footer5;
    }
    if (this.footer6 != null) {
      data['Footer6'] = this.footer6;
    }
    if (this.footer7 != null) {
      data['Footer7'] = this.footer7;
    }
    if (this.footer8 != null) {
      data['Footer8'] = this.footer8;
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
    if (this.thumbnailImage != null) {
      data['ThumbnailImage'] = this.thumbnailImage;
    }
    if (this.background != null) {
      data['Background'] = this.background;
    }
    if (this.backgroundRef != null) {
      data['BackgroundRef'] = this.backgroundRef;
    }
    if (this.hTMLContent != null) {
      data['HTMLContent'] = this.hTMLContent;
    }
    if (this.cSSVariables != null) {
      data['CSSVariables'] = this.cSSVariables;
    }
    if (this.editorColor != null) {
      data['EditorColor'] = this.editorColor;
    }
    if (this.editorColorHex != null) {
      data['EditorColorHex'] = this.editorColorHex;
    }
    if (this.isBackgroundImage != null) {
      data['IsBackgroundImage'] = this.isBackgroundImage;
    }
    if (this.autoGenerateThumbnail != null) {
      data['AutoGenerateThumbnail'] = this.autoGenerateThumbnail;
    }
    if (this.contentPosition != null) {
      data['ContentPosition'] = this.contentPosition;
    }
    if (this.logoPosition != null) {
      data['LogoPosition'] = this.logoPosition;
    }
    if (this.logoPositionName != null) {
      data['LogoPositionName'] = this.logoPositionName;
    }
    if (this.userPicture != null) {
      data['UserPicture'] = this.userPicture;
    }
    return data;
  }
}
