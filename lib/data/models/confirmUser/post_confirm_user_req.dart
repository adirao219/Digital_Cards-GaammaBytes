class PostConfirmUserReq {
  int? typeOfLogin;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? verificationCode;

  PostConfirmUserReq(
      {this.typeOfLogin,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.verificationCode});

  PostConfirmUserReq.fromJson(Map<String, dynamic> json) {
    typeOfLogin = json['TypeOfLogin'];
    displayName = json['DisplayName'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    verificationCode = json['VerificationCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.typeOfLogin != null) {
      data['TypeOfLogin'] = this.typeOfLogin;
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
    if (this.verificationCode != null) {
      data['VerificationCode'] = this.verificationCode;
    }
    return data;
  }
}
