class PostMyProfileReq {
  String? userId;
  int? id;
  String? displayName;
  String? email;
  String? phoneNumber;
  dynamic place;
  String? country;
  String? countryCode;
  int? languageId;

  PostMyProfileReq(
      {this.userId,
      this.id,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.place,
      this.country,
      this.countryCode,
      this.languageId});

  PostMyProfileReq.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    id = json['Id'];
    displayName = json['DisplayName'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    place = json['Place'];
    country = json['Country'];
    countryCode = json['CountryCode'];
    languageId = json['LanguageId'];
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
    if (this.countryCode != null) {
      data['CountryCode'] = this.countryCode;
    }
    if (this.languageId != null) {
      data['LanguageId'] = this.languageId;
    }
    return data;
  }
}
