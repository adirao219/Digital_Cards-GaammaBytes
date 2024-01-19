class PostSaveLinkDefinitionReq {
  int? cardID;
  String? userIdString;
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
  String? paymentQRCodeOldId;

  PostSaveLinkDefinitionReq(
      {this.cardID,
      this.userIdString,
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
      this.paymentQRCodeOldId});

  PostSaveLinkDefinitionReq.fromJson(Map<String, dynamic> json) {
    cardID = json['CardID'];
    userIdString = json['UserIdString'];
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
    paymentQRCodeOldId = json['PaymentQRCodeOldId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
    }
    if (this.userIdString != null) {
      data['UserIdString'] = this.userIdString;
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
    if (this.paymentQRCodeOldId != null) {
      data['PaymentQRCodeOldId'] = this.paymentQRCodeOldId;
    }
    return data;
  }
}
