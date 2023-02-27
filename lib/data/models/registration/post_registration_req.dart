class PostRegistrationReq {
  String? typeOfLogin;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? password;
  String? confirmPassword;
  String? coupanCode;

  PostRegistrationReq(
      {this.typeOfLogin,
      this.email,
      this.phoneNumber,
      this.displayName,
      this.password,
      this.confirmPassword,
      this.coupanCode});

  PostRegistrationReq.fromJson(Map<String, dynamic> json) {
    typeOfLogin = json['TypeOfLogin'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    displayName = json['DisplayName'];
    password = json['Password'];
    confirmPassword = json['ConfirmPassword'];
    coupanCode = json['CoupanCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.typeOfLogin != null) {
      data['TypeOfLogin'] = this.typeOfLogin;
    }
    if (this.email != null) {
      data['Email'] = this.email;
    }
    if (this.phoneNumber != null) {
      data['PhoneNumber'] = this.phoneNumber;
    }
    if (this.displayName != null) {
      data['DisplayName'] = this.displayName;
    }
    if (this.password != null) {
      data['Password'] = this.password;
    }
    if (this.confirmPassword != null) {
      data['ConfirmPassword'] = this.confirmPassword;
    }
    if (this.coupanCode != null) {
      data['CoupanCode'] = this.coupanCode;
    }
    return data;
  }
}
