class GetCardDetailsResp {
  bool? isSuccess;
  CardDetailsResult? result;
  dynamic errorMessage;

  GetCardDetailsResp({this.isSuccess, this.result, this.errorMessage});

  GetCardDetailsResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null
        ? CardDetailsResult.fromJson(json['Result'])
        : null;
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

class CardDetailsResult {
  CardDetailsData? cardDetailsData;
  List<CardDetailsListDetail>? cardDetailsList;
  int? totalCount;
  List<HiddenFilter>? hiddenFilter;
  List<StringFilter>? stringFilter;
  List<NumericDateFilter>? numericDateFilter;
  List<CardTypeList>? cardTypeList;
  dynamic languageList;
  int? profileLanguageId;

  CardDetailsResult(
      {this.cardDetailsData,
      this.cardDetailsList,
      this.totalCount,
      this.hiddenFilter,
      this.stringFilter,
      this.numericDateFilter,
      this.cardTypeList,
      this.languageList,
      this.profileLanguageId});

  CardDetailsResult.fromJson(Map<String, dynamic> json) {
    cardDetailsData = json['CardDetailsData'] != null
        ? CardDetailsData.fromJson(json['CardDetailsData'])
        : null;
    if (json['CardDetailsList'] != null) {
      cardDetailsList = <CardDetailsListDetail>[];
      json['CardDetailsList'].forEach((v) {
        cardDetailsList?.add(CardDetailsListDetail.fromJson(v));
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
    if (json['CardTypeList'] != null) {
      cardTypeList = <CardTypeList>[];
      json['CardTypeList'].forEach((v) {
        cardTypeList?.add(CardTypeList.fromJson(v));
      });
    }
    languageList = json['LanguageList'];
    profileLanguageId = json['ProfileLanguageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.cardDetailsData != null) {
      data['CardDetailsData'] = this.cardDetailsData?.toJson();
    }
    if (this.cardDetailsList != null) {
      data['CardDetailsList'] =
          this.cardDetailsList?.map((v) => v.toJson()).toList();
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
    if (this.cardTypeList != null) {
      data['CardTypeList'] = this.cardTypeList?.map((v) => v.toJson()).toList();
    }
    if (this.languageList != null) {
      data['LanguageList'] = this.languageList;
    }
    if (this.profileLanguageId != null) {
      data['ProfileLanguageId'] = this.profileLanguageId;
    }
    return data;
  }
}

class CardDetailsData {
  int? cardID;
  int? userId;
  dynamic userIdString;
  dynamic displayName;
  dynamic userEmail;
  dynamic companyName;
  int? languageID;
  dynamic languageName;
  int? themeID;
  dynamic themeName;
  int? cardType;
  dynamic cardTypeName;
  int? cardSubType;
  dynamic cardSubTypeName;
  dynamic name;
  String? createdDate;
  dynamic createdDateString;
  dynamic eventDate;
  String? eventDateString;
  String? expiryDateString;
  String? publishedURL;
  dynamic expiryDate;
  dynamic afterExpiryAction;
  int? afterExpiryActionid;
  dynamic afterExpiryActionName;
  List<AfterExpiryActionList>? afterExpiryActionList;
  dynamic afterExpiryActionLink;
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
  dynamic website;
  dynamic emailId;
  dynamic phoneNum;
  dynamic phoneNum2;
  dynamic whatsappNum;
  dynamic whatsappNum2;
  dynamic picture1;
  dynamic picture1Ref;
  int? picture1Size;
  dynamic picture1OldId;
  dynamic picture2;
  dynamic picture2Ref;
  int? picture2Size;
  dynamic picture2OldId;
  dynamic picture2Caption;
  dynamic location;
  int? latitude;
  int? longitude;
  dynamic cardColorInHex;
  int? cardColor;
  bool? userPicture;
  bool? isBackgroundImage;
  int? backgroundColor;
  dynamic backgroundColorHex;
  dynamic logoPosition;
  dynamic logoPositionName;
  dynamic logoPositionList;
  dynamic contentPosition;
  dynamic contentPositionName;
  dynamic contentPositionList;
  int? creditId;
  int? cardStatus;
  dynamic cardStatusName;
  dynamic publishedDate;
  dynamic publishedDateString;
  String? lastEditDate;
  dynamic lastEditDateString;
  dynamic creditExpiryDate;
  int? previewOption;
  bool? removeFromGoogleSearch;
  dynamic publishFolder;
  dynamic thumbnailImage;
  dynamic thumbnailImageRef;
  int? thumbnailImageSize;
  dynamic thumbnailImageOldId;
  dynamic hTMLContent;
  dynamic headerData1;
  dynamic headerData2;
  dynamic headerData3;

  CardDetailsData(
      {this.cardID,
      this.userId,
      this.userIdString,
      this.displayName,
      this.userEmail,
      this.companyName,
      this.languageID,
      this.languageName,
      this.themeID,
      this.themeName,
      this.cardType,
      this.cardTypeName,
      this.cardSubType,
      this.cardSubTypeName,
      this.name,
      this.createdDate,
      this.createdDateString,
      this.eventDate,
      this.expiryDate,
      this.afterExpiryAction,
      this.afterExpiryActionid,
      this.afterExpiryActionName,
      this.afterExpiryActionList,
      this.afterExpiryActionLink,
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
      this.website,
      this.emailId,
      this.phoneNum,
      this.phoneNum2,
      this.whatsappNum,
      this.whatsappNum2,
      this.picture1,
      this.picture1Ref,
      this.picture1Size,
      this.picture1OldId,
      this.picture2,
      this.picture2Ref,
      this.picture2Size,
      this.picture2OldId,
      this.picture2Caption,
      this.eventDateString,
      this.expiryDateString,
      this.publishedURL,
      this.location,
      this.latitude,
      this.longitude,
      this.cardColorInHex,
      this.cardColor,
      this.userPicture,
      this.isBackgroundImage,
      this.backgroundColor,
      this.backgroundColorHex,
      this.logoPosition,
      this.logoPositionName,
      this.logoPositionList,
      this.contentPosition,
      this.contentPositionName,
      this.contentPositionList,
      this.creditId,
      this.cardStatus,
      this.cardStatusName,
      this.publishedDate,
      this.publishedDateString,
      this.lastEditDate,
      this.lastEditDateString,
      this.creditExpiryDate,
      this.previewOption,
      this.removeFromGoogleSearch,
      this.publishFolder,
      this.thumbnailImage,
      this.thumbnailImageRef,
      this.thumbnailImageSize,
      this.thumbnailImageOldId,
      this.hTMLContent,
      this.headerData1,
      this.headerData2,
      this.headerData3});

  CardDetailsData.fromJson(Map<String, dynamic> json) {
    cardID = json['CardID'];
    userId = json['UserId'];
    userIdString = json['UserIdString'];
    displayName = json['DisplayName'];
    userEmail = json['UserEmail'];
    companyName = json['CompanyName'];
    languageID = json['LanguageID'];
    languageName = json['LanguageName'];
    themeID = json['ThemeID'];
    themeName = json['ThemeName'];
    cardType = json['CardType'];
    cardTypeName = json['CardTypeName'];
    cardSubType = json['CardSubType'];
    cardSubTypeName = json['CardSubTypeName'];
    name = json['Name'];
    createdDate = json['CreatedDate'];
    createdDateString = json['CreatedDateString'];
    eventDate = json['EventDate'];
    eventDateString = json['EventDateString'];
    expiryDateString = json['ExpiryDateString'];
    publishedURL = json['PublishedURL'];
    expiryDate = json['ExpiryDate'];
    afterExpiryAction = json['AfterExpiryAction'];
    afterExpiryActionid = json['AfterExpiryActionid'];
    afterExpiryActionName = json['AfterExpiryActionName'];
    if (json['AfterExpiryActionList'] != null) {
      afterExpiryActionList = <AfterExpiryActionList>[];
      json['AfterExpiryActionList'].forEach((v) {
        afterExpiryActionList?.add(AfterExpiryActionList.fromJson(v));
      });
    }
    afterExpiryActionLink = json['AfterExpiryActionLink'];
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
    website = json['Website'];
    emailId = json['EmailId'];
    phoneNum = json['PhoneNum'];
    phoneNum2 = json['PhoneNum2'];
    whatsappNum = json['WhatsappNum'];
    whatsappNum2 = json['WhatsappNum2'];
    picture1 = json['Picture1'];
    picture1Ref = json['Picture1Ref'];
    picture1Size = json['Picture1Size'];
    picture1OldId = json['Picture1OldId'];
    picture2 = json['Picture2'];
    picture2Ref = json['Picture2Ref'];
    picture2Size = json['Picture2Size'];
    picture2OldId = json['Picture2OldId'];
    picture2Caption = json['Picture2Caption'];
    location = json['Location'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    cardColorInHex = json['CardColorInHex'];
    cardColor = json['CardColor'];
    userPicture = json['UserPicture'];
    isBackgroundImage = json['IsBackgroundImage'];
    backgroundColor = json['BackgroundColor'];
    backgroundColorHex = json['BackgroundColorHex'];
    logoPosition = json['LogoPosition'];
    logoPositionName = json['LogoPositionName'];
    logoPositionList = json['LogoPositionList'];
    contentPosition = json['ContentPosition'];
    contentPositionName = json['ContentPositionName'];
    contentPositionList = json['ContentPositionList'];
    creditId = json['CreditId'];
    cardStatus = json['CardStatus'];
    cardStatusName = json['CardStatusName'];
    publishedDate = json['PublishedDate'];
    publishedDateString = json['PublishedDateString'];
    lastEditDate = json['LastEditDate'];
    lastEditDateString = json['LastEditDateString'];
    creditExpiryDate = json['CreditExpiryDate'];
    previewOption = json['PreviewOption'];
    removeFromGoogleSearch = json['RemoveFromGoogleSearch'];
    publishFolder = json['PublishFolder'];
    thumbnailImage = json['ThumbnailImage'];
    thumbnailImageRef = json['ThumbnailImageRef'];
    thumbnailImageSize = json['ThumbnailImageSize'];
    thumbnailImageOldId = json['ThumbnailImageOldId'];
    hTMLContent = json['HTMLContent'];
    headerData1 = json['HeaderData1'];
    headerData2 = json['HeaderData2'];
    headerData3 = json['HeaderData3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
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
    if (this.languageID != null) {
      data['LanguageID'] = this.languageID;
    }
    if (this.languageName != null) {
      data['LanguageName'] = this.languageName;
    }
    if (this.themeID != null) {
      data['ThemeID'] = this.themeID;
    }
    if (this.themeName != null) {
      data['ThemeName'] = this.themeName;
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
    if (this.name != null) {
      data['Name'] = this.name;
    }
    if (this.createdDate != null) {
      data['CreatedDate'] = this.createdDate;
    }
    if (this.createdDateString != null) {
      data['CreatedDateString'] = this.createdDateString;
    }
    if (this.eventDate != null) {
      data['EventDate'] = this.eventDate;
    }
    if (this.expiryDate != null) {
      data['ExpiryDate'] = this.expiryDate;
    }
    if (this.afterExpiryAction != null) {
      data['AfterExpiryAction'] = this.afterExpiryAction;
    }
    if (this.afterExpiryActionid != null) {
      data['AfterExpiryActionid'] = this.afterExpiryActionid;
    }
    if (this.afterExpiryActionName != null) {
      data['AfterExpiryActionName'] = this.afterExpiryActionName;
    }
    if (this.afterExpiryActionList != null) {
      data['AfterExpiryActionList'] =
          this.afterExpiryActionList?.map((v) => v.toJson()).toList();
    }
    if (this.afterExpiryActionLink != null) {
      data['AfterExpiryActionLink'] = this.afterExpiryActionLink;
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
    if (this.website != null) {
      data['Website'] = this.website;
    }
    if (this.emailId != null) {
      data['EmailId'] = this.emailId;
    }
    if (this.phoneNum != null) {
      data['PhoneNum'] = this.phoneNum;
    }
    if (this.phoneNum2 != null) {
      data['PhoneNum2'] = this.phoneNum2;
    }
    if (this.whatsappNum != null) {
      data['WhatsappNum'] = this.whatsappNum;
    }
    if (this.whatsappNum2 != null) {
      data['WhatsappNum2'] = this.whatsappNum2;
    }
    if (this.picture1 != null) {
      data['Picture1'] = this.picture1;
    }
    if (this.picture1Ref != null) {
      data['Picture1Ref'] = this.picture1Ref;
    }
    if (this.picture1Size != null) {
      data['Picture1Size'] = this.picture1Size;
    }
    if (this.picture1OldId != null) {
      data['Picture1OldId'] = this.picture1OldId;
    }
    if (this.picture2 != null) {
      data['Picture2'] = this.picture2;
    }
    if (this.picture2Ref != null) {
      data['Picture2Ref'] = this.picture2Ref;
    }
    if (this.picture2Size != null) {
      data['Picture2Size'] = this.picture2Size;
    }
    if (this.picture2OldId != null) {
      data['Picture2OldId'] = this.picture2OldId;
    }
    if (this.picture2Caption != null) {
      data['Picture2Caption'] = this.picture2Caption;
    }
    if (this.location != null) {
      data['Location'] = this.location;
    }
    if (this.latitude != null) {
      data['Latitude'] = this.latitude;
    }
    if (this.longitude != null) {
      data['Longitude'] = this.longitude;
    }
    if (this.cardColorInHex != null) {
      data['CardColorInHex'] = this.cardColorInHex;
    }
    if (this.cardColor != null) {
      data['CardColor'] = this.cardColor;
    }
    if (this.userPicture != null) {
      data['UserPicture'] = this.userPicture;
    }
    if (this.isBackgroundImage != null) {
      data['IsBackgroundImage'] = this.isBackgroundImage;
    }
    if (this.backgroundColor != null) {
      data['BackgroundColor'] = this.backgroundColor;
    }
    if (this.backgroundColorHex != null) {
      data['BackgroundColorHex'] = this.backgroundColorHex;
    }
    if (this.logoPosition != null) {
      data['LogoPosition'] = this.logoPosition;
    }
    if (this.logoPositionName != null) {
      data['LogoPositionName'] = this.logoPositionName;
    }
    if (this.logoPositionList != null) {
      data['LogoPositionList'] = this.logoPositionList;
    }
    if (this.contentPosition != null) {
      data['ContentPosition'] = this.contentPosition;
    }
    if (this.contentPositionName != null) {
      data['ContentPositionName'] = this.contentPositionName;
    }
    if (this.contentPositionList != null) {
      data['ContentPositionList'] = this.contentPositionList;
    }
    if (this.creditId != null) {
      data['CreditId'] = this.creditId;
    }
    if (this.cardStatus != null) {
      data['CardStatus'] = this.cardStatus;
    }
    if (this.cardStatusName != null) {
      data['CardStatusName'] = this.cardStatusName;
    }
    if (this.publishedDate != null) {
      data['PublishedDate'] = this.publishedDate;
    }
    if (this.publishedDateString != null) {
      data['PublishedDateString'] = this.publishedDateString;
    }
    if (this.lastEditDate != null) {
      data['LastEditDate'] = this.lastEditDate;
    }
    if (this.lastEditDateString != null) {
      data['LastEditDateString'] = this.lastEditDateString;
    }
    if (this.creditExpiryDate != null) {
      data['CreditExpiryDate'] = this.creditExpiryDate;
    }
    if (this.previewOption != null) {
      data['PreviewOption'] = this.previewOption;
    }
    if (this.removeFromGoogleSearch != null) {
      data['RemoveFromGoogleSearch'] = this.removeFromGoogleSearch;
    }
    if (this.publishFolder != null) {
      data['PublishFolder'] = this.publishFolder;
    }
    if (this.thumbnailImage != null) {
      data['ThumbnailImage'] = this.thumbnailImage;
    }
    if (this.thumbnailImageRef != null) {
      data['ThumbnailImageRef'] = this.thumbnailImageRef;
    }
    if (this.thumbnailImageSize != null) {
      data['ThumbnailImageSize'] = this.thumbnailImageSize;
    }
    if (this.thumbnailImageOldId != null) {
      data['ThumbnailImageOldId'] = this.thumbnailImageOldId;
    }
    if (this.hTMLContent != null) {
      data['HTMLContent'] = this.hTMLContent;
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
    return data;
  }
}

class AfterExpiryActionList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  AfterExpiryActionList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  AfterExpiryActionList.fromJson(Map<String, dynamic> json) {
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

class CardDetailsListDetail {
  int? cardID;
  int? userId;
  dynamic userIdString;
  dynamic displayName;
  dynamic userEmail;
  dynamic companyName;
  int? languageID;
  dynamic languageName;
  int? themeID;
  String? themeName;
  int? cardType;
  String? cardTypeName;
  int? cardSubType;
  String? cardSubTypeName;
  String? name;
  String? createdDate;
  String? createdDateString;
  String? eventDate;
  dynamic expiryDate;
  dynamic afterExpiryAction;
  int? afterExpiryActionid;
  dynamic afterExpiryActionName;
  dynamic afterExpiryActionList;
  dynamic afterExpiryActionLink;
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
  dynamic website;
  String? emailId;
  String? phoneNum;
  String? eventDateString;
  String? expiryDateString;
  String? publishedURL;
  dynamic phoneNum2;
  String? whatsappNum;
  dynamic whatsappNum2;
  dynamic picture1;
  dynamic picture1Ref;
  int? picture1Size;
  dynamic picture1OldId;
  dynamic picture2;
  dynamic picture2Ref;
  int? picture2Size;
  dynamic picture2OldId;
  dynamic picture2Caption;
  dynamic location;
  double? latitude;
  double? longitude;
  dynamic cardColorInHex;
  int? cardColor;
  bool? userPicture;
  bool? isBackgroundImage;
  int? backgroundColor;
  dynamic backgroundColorHex;
  dynamic logoPosition;
  dynamic logoPositionName;
  dynamic logoPositionList;
  dynamic contentPosition;
  dynamic contentPositionName;
  dynamic contentPositionList;
  int? creditId;
  int? cardStatus;
  String? cardStatusName;
  dynamic publishedDate;
  String? publishedDateString;
  String? lastEditDate;
  String? lastEditDateString;
  dynamic creditExpiryDate;
  int? previewOption;
  bool? removeFromGoogleSearch;
  String? publishFolder;
  String? thumbnailImage;
  dynamic thumbnailImageRef;
  int? thumbnailImageSize;
  dynamic thumbnailImageOldId;
  dynamic hTMLContent;
  dynamic headerData1;
  dynamic headerData2;
  dynamic headerData3;

  CardDetailsListDetail(
      {this.cardID,
      this.userId,
      this.userIdString,
      this.displayName,
      this.userEmail,
      this.companyName,
      this.languageID,
      this.languageName,
      this.themeID,
      this.themeName,
      this.cardType,
      this.cardTypeName,
      this.cardSubType,
      this.cardSubTypeName,
      this.name,
      this.createdDate,
      this.createdDateString,
      this.eventDate,
      this.expiryDate,
      this.eventDateString,
      this.expiryDateString,
      this.publishedURL,
      this.afterExpiryAction,
      this.afterExpiryActionid,
      this.afterExpiryActionName,
      this.afterExpiryActionList,
      this.afterExpiryActionLink,
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
      this.website,
      this.emailId,
      this.phoneNum,
      this.phoneNum2,
      this.whatsappNum,
      this.whatsappNum2,
      this.picture1,
      this.picture1Ref,
      this.picture1Size,
      this.picture1OldId,
      this.picture2,
      this.picture2Ref,
      this.picture2Size,
      this.picture2OldId,
      this.picture2Caption,
      this.location,
      this.latitude,
      this.longitude,
      this.cardColorInHex,
      this.cardColor,
      this.userPicture,
      this.isBackgroundImage,
      this.backgroundColor,
      this.backgroundColorHex,
      this.logoPosition,
      this.logoPositionName,
      this.logoPositionList,
      this.contentPosition,
      this.contentPositionName,
      this.contentPositionList,
      this.creditId,
      this.cardStatus,
      this.cardStatusName,
      this.publishedDate,
      this.publishedDateString,
      this.lastEditDate,
      this.lastEditDateString,
      this.creditExpiryDate,
      this.previewOption,
      this.removeFromGoogleSearch,
      this.publishFolder,
      this.thumbnailImage,
      this.thumbnailImageRef,
      this.thumbnailImageSize,
      this.thumbnailImageOldId,
      this.hTMLContent,
      this.headerData1,
      this.headerData2,
      this.headerData3});

  CardDetailsListDetail.fromJson(Map<String, dynamic> json) {
    cardID = json['CardID'];
    userId = json['UserId'];
    userIdString = json['UserIdString'];
    eventDateString = json['EventDateString'];
    expiryDateString = json['ExpiryDateString'];
    publishedURL = json['PublishedURL'];
    displayName = json['DisplayName'];
    userEmail = json['UserEmail'];
    companyName = json['CompanyName'];
    languageID = json['LanguageID'];
    languageName = json['LanguageName'];
    themeID = json['ThemeID'];
    themeName = json['ThemeName'];
    cardType = json['CardType'];
    cardTypeName = json['CardTypeName'];
    cardSubType = json['CardSubType'];
    cardSubTypeName = json['CardSubTypeName'];
    name = json['Name'];
    createdDate = json['CreatedDate'];
    createdDateString = json['CreatedDateString'];
    eventDate = json['EventDate'];
    expiryDate = json['ExpiryDate'];
    afterExpiryAction = json['AfterExpiryAction'];
    afterExpiryActionid = json['AfterExpiryActionid'];
    afterExpiryActionName = json['AfterExpiryActionName'];
    afterExpiryActionList = json['AfterExpiryActionList'];
    afterExpiryActionLink = json['AfterExpiryActionLink'];
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
    website = json['Website'];
    emailId = json['EmailId'];
    phoneNum = json['PhoneNum'];
    phoneNum2 = json['PhoneNum2'];
    whatsappNum = json['WhatsappNum'];
    whatsappNum2 = json['WhatsappNum2'];
    picture1 = json['Picture1'];
    picture1Ref = json['Picture1Ref'];
    picture1Size = json['Picture1Size'];
    picture1OldId = json['Picture1OldId'];
    picture2 = json['Picture2'];
    picture2Ref = json['Picture2Ref'];
    picture2Size = json['Picture2Size'];
    picture2OldId = json['Picture2OldId'];
    picture2Caption = json['Picture2Caption'];
    location = json['Location'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    cardColorInHex = json['CardColorInHex'];
    cardColor = json['CardColor'];
    userPicture = json['UserPicture'];
    isBackgroundImage = json['IsBackgroundImage'];
    backgroundColor = json['BackgroundColor'];
    backgroundColorHex = json['BackgroundColorHex'];
    logoPosition = json['LogoPosition'];
    logoPositionName = json['LogoPositionName'];
    logoPositionList = json['LogoPositionList'];
    contentPosition = json['ContentPosition'];
    contentPositionName = json['ContentPositionName'];
    contentPositionList = json['ContentPositionList'];
    creditId = json['CreditId'];
    cardStatus = json['CardStatus'];
    cardStatusName = json['CardStatusName'];
    publishedDate = json['PublishedDate'];
    publishedDateString = json['PublishedDateString'];
    lastEditDate = json['LastEditDate'];
    lastEditDateString = json['LastEditDateString'];
    creditExpiryDate = json['CreditExpiryDate'];
    previewOption = json['PreviewOption'];
    removeFromGoogleSearch = json['RemoveFromGoogleSearch'];
    publishFolder = json['PublishFolder'];
    thumbnailImage = json['ThumbnailImage'];
    thumbnailImageRef = json['ThumbnailImageRef'];
    thumbnailImageSize = json['ThumbnailImageSize'];
    thumbnailImageOldId = json['ThumbnailImageOldId'];
    hTMLContent = json['HTMLContent'];
    headerData1 = json['HeaderData1'];
    headerData2 = json['HeaderData2'];
    headerData3 = json['HeaderData3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
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
    if (this.languageID != null) {
      data['LanguageID'] = this.languageID;
    }
    if (this.languageName != null) {
      data['LanguageName'] = this.languageName;
    }
    if (this.themeID != null) {
      data['ThemeID'] = this.themeID;
    }
    if (this.themeName != null) {
      data['ThemeName'] = this.themeName;
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
    if (this.name != null) {
      data['Name'] = this.name;
    }
    if (this.createdDate != null) {
      data['CreatedDate'] = this.createdDate;
    }
    if (this.createdDateString != null) {
      data['CreatedDateString'] = this.createdDateString;
    }
    if (this.eventDate != null) {
      data['EventDate'] = this.eventDate;
    }
    if (this.expiryDate != null) {
      data['ExpiryDate'] = this.expiryDate;
    }
    if (this.afterExpiryAction != null) {
      data['AfterExpiryAction'] = this.afterExpiryAction;
    }
    if (this.afterExpiryActionid != null) {
      data['AfterExpiryActionid'] = this.afterExpiryActionid;
    }
    if (this.afterExpiryActionName != null) {
      data['AfterExpiryActionName'] = this.afterExpiryActionName;
    }
    if (this.afterExpiryActionList != null) {
      data['AfterExpiryActionList'] = this.afterExpiryActionList;
    }
    if (this.afterExpiryActionLink != null) {
      data['AfterExpiryActionLink'] = this.afterExpiryActionLink;
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
    if (this.website != null) {
      data['Website'] = this.website;
    }
    if (this.emailId != null) {
      data['EmailId'] = this.emailId;
    }
    if (this.phoneNum != null) {
      data['PhoneNum'] = this.phoneNum;
    }
    if (this.phoneNum2 != null) {
      data['PhoneNum2'] = this.phoneNum2;
    }
    if (this.whatsappNum != null) {
      data['WhatsappNum'] = this.whatsappNum;
    }
    if (this.whatsappNum2 != null) {
      data['WhatsappNum2'] = this.whatsappNum2;
    }
    if (this.picture1 != null) {
      data['Picture1'] = this.picture1;
    }
    if (this.picture1Ref != null) {
      data['Picture1Ref'] = this.picture1Ref;
    }
    if (this.picture1Size != null) {
      data['Picture1Size'] = this.picture1Size;
    }
    if (this.picture1OldId != null) {
      data['Picture1OldId'] = this.picture1OldId;
    }
    if (this.picture2 != null) {
      data['Picture2'] = this.picture2;
    }
    if (this.picture2Ref != null) {
      data['Picture2Ref'] = this.picture2Ref;
    }
    if (this.picture2Size != null) {
      data['Picture2Size'] = this.picture2Size;
    }
    if (this.picture2OldId != null) {
      data['Picture2OldId'] = this.picture2OldId;
    }
    if (this.picture2Caption != null) {
      data['Picture2Caption'] = this.picture2Caption;
    }
    if (this.location != null) {
      data['Location'] = this.location;
    }
    if (this.latitude != null) {
      data['Latitude'] = this.latitude;
    }
    if (this.longitude != null) {
      data['Longitude'] = this.longitude;
    }
    if (this.cardColorInHex != null) {
      data['CardColorInHex'] = this.cardColorInHex;
    }
    if (this.cardColor != null) {
      data['CardColor'] = this.cardColor;
    }
    if (this.userPicture != null) {
      data['UserPicture'] = this.userPicture;
    }
    if (this.isBackgroundImage != null) {
      data['IsBackgroundImage'] = this.isBackgroundImage;
    }
    if (this.backgroundColor != null) {
      data['BackgroundColor'] = this.backgroundColor;
    }
    if (this.backgroundColorHex != null) {
      data['BackgroundColorHex'] = this.backgroundColorHex;
    }
    if (this.logoPosition != null) {
      data['LogoPosition'] = this.logoPosition;
    }
    if (this.logoPositionName != null) {
      data['LogoPositionName'] = this.logoPositionName;
    }
    if (this.logoPositionList != null) {
      data['LogoPositionList'] = this.logoPositionList;
    }
    if (this.contentPosition != null) {
      data['ContentPosition'] = this.contentPosition;
    }
    if (this.contentPositionName != null) {
      data['ContentPositionName'] = this.contentPositionName;
    }
    if (this.contentPositionList != null) {
      data['ContentPositionList'] = this.contentPositionList;
    }
    if (this.creditId != null) {
      data['CreditId'] = this.creditId;
    }
    if (this.cardStatus != null) {
      data['CardStatus'] = this.cardStatus;
    }
    if (this.cardStatusName != null) {
      data['CardStatusName'] = this.cardStatusName;
    }
    if (this.publishedDate != null) {
      data['PublishedDate'] = this.publishedDate;
    }
    if (this.publishedDateString != null) {
      data['PublishedDateString'] = this.publishedDateString;
    }
    if (this.lastEditDate != null) {
      data['LastEditDate'] = this.lastEditDate;
    }
    if (this.lastEditDateString != null) {
      data['LastEditDateString'] = this.lastEditDateString;
    }
    if (this.creditExpiryDate != null) {
      data['CreditExpiryDate'] = this.creditExpiryDate;
    }
    if (this.previewOption != null) {
      data['PreviewOption'] = this.previewOption;
    }
    if (this.removeFromGoogleSearch != null) {
      data['RemoveFromGoogleSearch'] = this.removeFromGoogleSearch;
    }
    if (this.publishFolder != null) {
      data['PublishFolder'] = this.publishFolder;
    }
    if (this.thumbnailImage != null) {
      data['ThumbnailImage'] = this.thumbnailImage;
    }
    if (this.thumbnailImageRef != null) {
      data['ThumbnailImageRef'] = this.thumbnailImageRef;
    }
    if (this.thumbnailImageSize != null) {
      data['ThumbnailImageSize'] = this.thumbnailImageSize;
    }
    if (this.thumbnailImageOldId != null) {
      data['ThumbnailImageOldId'] = this.thumbnailImageOldId;
    }
    if (this.hTMLContent != null) {
      data['HTMLContent'] = this.hTMLContent;
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

class CardTypeList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  CardTypeList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  CardTypeList.fromJson(Map<String, dynamic> json) {
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
