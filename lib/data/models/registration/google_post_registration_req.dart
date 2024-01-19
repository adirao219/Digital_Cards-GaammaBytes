class GooglePostRegistrationReq {
  String? typeOfLogin;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? key;
  String? password;
  String? confirmPassword;
  String? coupanCode;

  GooglePostRegistrationReq(
      {this.typeOfLogin,
      this.email,
      this.phoneNumber,
      this.key,
      this.displayName,
      this.password,
      this.confirmPassword,
      this.coupanCode});

  GooglePostRegistrationReq.fromJson(Map<String, dynamic> json) {
    typeOfLogin = json['TypeOfLogin'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    displayName = json['DisplayName'];
    key = json['Key'];
    password = json['Password'];
    confirmPassword = json['ConfirmPassword'];
    coupanCode = json['CouponCode'];
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
    } if (this.key != null) {
      data['Key'] = this.key;
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
      data['CouponCode'] = this.coupanCode;
    }
    return data;
  }
}
