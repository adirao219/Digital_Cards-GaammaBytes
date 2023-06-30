class GetGetLinkDefinitionResp {
  bool? isSuccess;
  LinkResult? result;
  String? errorMessage;

  GetGetLinkDefinitionResp({this.isSuccess, this.result, this.errorMessage});

  GetGetLinkDefinitionResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? LinkResult.fromJson(json['Result']) : null;
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

class LinkResult {
  LinkDefinitionData? linkDefinitionData;
  dynamic linkDefinitionList;

  LinkResult({this.linkDefinitionData, this.linkDefinitionList});

  LinkResult.fromJson(Map<String, dynamic> json) {
    linkDefinitionData = json['LinkDefinitionData'] != null
        ? LinkDefinitionData.fromJson(json['LinkDefinitionData'])
        : null;
    linkDefinitionList = json['LinkDefinitionList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.linkDefinitionData != null) {
      data['LinkDefinitionData'] = this.linkDefinitionData?.toJson();
    }
    if (this.linkDefinitionList != null) {
      data['LinkDefinitionList'] = this.linkDefinitionList;
    }
    return data;
  }
}

class LinkDefinitionData {
  int? cardID;
  String? cardIDName;
  List<CardIDList>? cardIDList;
  String? twitter;
  String? facebook;
  String? instagram;
  String? snapchatUser;
  String? googlePlus;
  String? linkedIn;
  String? foursquare;
  String? blog;
  String? youtube;
  String? pinterest;
  String? meetup;
  String? otherURL1;
  String? otherURL2;
  String? paymentQRCode;
  String? paymentQRCodeRef;
  String? iconFile1;
  String? iconFile2;

  LinkDefinitionData(
      {this.cardID,
      this.cardIDName,
      this.cardIDList,
      this.twitter,
      this.facebook,
      this.instagram,
      this.snapchatUser,
      this.googlePlus,
      this.linkedIn,
      this.foursquare,
      this.blog,
      this.youtube,
      this.pinterest,
      this.meetup,
      this.otherURL1,
      this.otherURL2,
      this.paymentQRCode,
      this.paymentQRCodeRef,
      this.iconFile1,
      this.iconFile2});

  LinkDefinitionData.fromJson(Map<String, dynamic> json) {
    cardID = json['CardID'];
    cardIDName = json['CardIDName'];
    if (json['CardIDList'] != null) {
      cardIDList = <CardIDList>[];
      json['CardIDList'].forEach((v) {
        cardIDList?.add(CardIDList.fromJson(v));
      });
    }
    twitter = json['Twitter'];
    facebook = json['Facebook'];
    instagram = json['Instagram'];
    snapchatUser = json['SnapchatUser'];
    googlePlus = json['GooglePlus'];
    linkedIn = json['LinkedIn'];
    foursquare = json['Foursquare'];
    blog = json['Blog'];
    youtube = json['Youtube'];
    pinterest = json['Pinterest'];
    meetup = json['Meetup'];
    otherURL1 = json['OtherURL1'];
    otherURL2 = json['OtherURL2'];
    paymentQRCode = json['PaymentQRCode'];
    paymentQRCodeRef = json['PaymentQRCodeRef'];
    iconFile1 = json['IconFile1'];
    iconFile2 = json['IconFile2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
    }
    if (this.cardIDName != null) {
      data['CardIDName'] = this.cardIDName;
    }
    if (this.cardIDList != null) {
      data['CardIDList'] = this.cardIDList?.map((v) => v.toJson()).toList();
    }
    if (this.twitter != null) {
      data['Twitter'] = this.twitter;
    }
    if (this.facebook != null) {
      data['Facebook'] = this.facebook;
    }
    if (this.instagram != null) {
      data['Instagram'] = this.instagram;
    }
    if (this.snapchatUser != null) {
      data['SnapchatUser'] = this.snapchatUser;
    }
    if (this.googlePlus != null) {
      data['GooglePlus'] = this.googlePlus;
    }
    if (this.linkedIn != null) {
      data['LinkedIn'] = this.linkedIn;
    }
    if (this.foursquare != null) {
      data['Foursquare'] = this.foursquare;
    }
    if (this.blog != null) {
      data['Blog'] = this.blog;
    }
    if (this.youtube != null) {
      data['Youtube'] = this.youtube;
    }
    if (this.pinterest != null) {
      data['Pinterest'] = this.pinterest;
    }
    if (this.meetup != null) {
      data['Meetup'] = this.meetup;
    }
    if (this.otherURL1 != null) {
      data['OtherURL1'] = this.otherURL1;
    }
    if (this.otherURL2 != null) {
      data['OtherURL2'] = this.otherURL2;
    }
    if (this.paymentQRCode != null) {
      data['PaymentQRCode'] = this.paymentQRCode;
    }
    if (this.paymentQRCodeRef != null) {
      data['PaymentQRCodeRef'] = this.paymentQRCodeRef;
    }
    if (this.iconFile1 != null) {
      data['IconFile1'] = this.iconFile1;
    }
    if (this.iconFile2 != null) {
      data['IconFile2'] = this.iconFile2;
    }
    return data;
  }
}

class CardIDList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  CardIDList({this.disabled, this.group, this.selected, this.text, this.value});

  CardIDList.fromJson(Map<String, dynamic> json) {
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
