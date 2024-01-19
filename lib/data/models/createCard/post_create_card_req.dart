class PostCreateCardReq {
  String? userIdString;
  String? cardID;
  int? themeID;
  int? cardType;
  int? cardSubType;
  String? name;
  String? eventDate;
  String? website;
  String? emailId;
  String? phoneNum;
  String? phoneNum2;
  String? whatsappNum;
  String? whatsappNum2;
  int? latitude;
  int? longitude;
  String? cardColorInHex;
  String? backgroundColorHex;
  int? logoPosition;
  String? picture1;
  String? picture1Ref;
  String? picture1OldId;
  String? picture2;
  String? picture2Ref;
  String? picture2OldId;
  String? afterExpiryAction;
  int? afterExpiryActionid;
  String? afterExpiryActionLink;
  bool? removeFromGoogleSearch;
  String? thumbnailImage;
  String? thumbnailImageRef;
  String? thumbnailImageOldId;
  String? headerData1;
  String? headerData2;
  String? headerData3;

  PostCreateCardReq(
      {this.userIdString,
      this.cardID,
      this.themeID,
      this.cardType,
      this.cardSubType,
      this.name,
      this.eventDate,
      this.website,
      this.emailId,
      this.phoneNum,
      this.phoneNum2,
      this.whatsappNum,
      this.whatsappNum2,
      this.latitude,
      this.longitude,
      this.cardColorInHex,
      this.backgroundColorHex,
      this.logoPosition,
      this.picture1,
      this.picture1Ref,
      this.picture1OldId,
      this.picture2,
      this.picture2Ref,
      this.picture2OldId,
      this.afterExpiryAction,
      this.afterExpiryActionid,
      this.afterExpiryActionLink,
      this.removeFromGoogleSearch,
      this.thumbnailImage,
      this.thumbnailImageRef,
      this.thumbnailImageOldId,
      this.headerData1,
      this.headerData2,
      this.headerData3});

  PostCreateCardReq.fromJson(Map<String, dynamic> json) {
    userIdString = json['UserIdString'];
    cardID = json['CardID'];
    themeID = json['ThemeID'];
    cardType = json['CardType'];
    cardSubType = json['CardSubType'];
    name = json['Name'];
    eventDate = json['EventDate'];
    website = json['Website'];
    emailId = json['EmailId'];
    phoneNum = json['PhoneNum'];
    phoneNum2 = json['PhoneNum2'];
    whatsappNum = json['WhatsappNum'];
    whatsappNum2 = json['WhatsappNum2'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    cardColorInHex = json['CardColorInHex'];
    backgroundColorHex = json['BackgroundColorHex'];
    logoPosition = json['LogoPosition'];
    picture1 = json['Picture1'];
    picture1Ref = json['Picture1Ref'];
    picture1OldId = json['Picture1OldId'];
    picture2 = json['Picture2'];
    picture2Ref = json['Picture2Ref'];
    picture2OldId = json['Picture2OldId'];
    afterExpiryAction = json['AfterExpiryAction'];
    afterExpiryActionid = json['AfterExpiryActionid'];
    afterExpiryActionLink = json['AfterExpiryActionLink'];
    removeFromGoogleSearch = json['RemoveFromGoogleSearch'];
    thumbnailImage = json['ThumbnailImage'];
    thumbnailImageRef = json['ThumbnailImageRef'];
    thumbnailImageOldId = json['ThumbnailImageOldId'];
    headerData1 = json['HeaderData1'];
    headerData2 = json['HeaderData2'];
    headerData3 = json['HeaderData3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.userIdString != null) {
      data['UserIdString'] = this.userIdString;
    }
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
    }
    if (this.themeID != null) {
      data['ThemeID'] = this.themeID;
    }
    if (this.cardType != null) {
      data['CardType'] = this.cardType;
    }
    if (this.cardSubType != null) {
      data['CardSubType'] = this.cardSubType;
    }
    if (this.name != null) {
      data['Name'] = this.name;
    }
    if (this.eventDate != null) {
      data['EventDate'] = this.eventDate;
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
    if (this.latitude != null) {
      data['Latitude'] = this.latitude;
    }
    if (this.longitude != null) {
      data['Longitude'] = this.longitude;
    }
    if (this.cardColorInHex != null) {
      data['CardColorInHex'] = this.cardColorInHex;
    }
    if (this.backgroundColorHex != null) {
      data['BackgroundColorHex'] = this.backgroundColorHex;
    }
    if (this.logoPosition != null) {
      data['LogoPosition'] = this.logoPosition;
    }
    if (this.picture1 != null) {
      data['Picture1'] = this.picture1;
    }
    if (this.picture1Ref != null) {
      data['Picture1Ref'] = this.picture1Ref;
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
    if (this.picture2OldId != null) {
      data['Picture2OldId'] = this.picture2OldId;
    }
    if (this.afterExpiryAction != null) {
      data['AfterExpiryAction'] = this.afterExpiryAction;
    }
    if (this.afterExpiryActionid != null) {
      data['AfterExpiryActionid'] = this.afterExpiryActionid;
    }
    if (this.afterExpiryActionLink != null) {
      data['AfterExpiryActionLink'] = this.afterExpiryActionLink;
    }
    if (this.removeFromGoogleSearch != null) {
      data['RemoveFromGoogleSearch'] = this.removeFromGoogleSearch;
    }
    if (this.thumbnailImage != null) {
      data['ThumbnailImage'] = this.thumbnailImage;
    }
    if (this.thumbnailImageRef != null) {
      data['ThumbnailImageRef'] = this.thumbnailImageRef;
    }
    if (this.thumbnailImageOldId != null) {
      data['ThumbnailImageOldId'] = this.thumbnailImageOldId;
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
