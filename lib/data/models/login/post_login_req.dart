class PostLoginReq {
  int? typeOfLogin;
  String? email;
  String? password;
  bool? rememberMe;

  PostLoginReq({this.typeOfLogin, this.email, this.password, this.rememberMe});

  PostLoginReq.fromJson(Map<String, dynamic> json) {
    typeOfLogin = json['TypeOfLogin'];
    email = json['Email'];
    password = json['Password'];
    rememberMe = json['RememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.typeOfLogin != null) {
      data['TypeOfLogin'] = this.typeOfLogin;
    }
    if (this.email != null) {
      data['Email'] = this.email;
    }
    if (this.password != null) {
      data['Password'] = this.password;
    }
    if (this.rememberMe != null) {
      data['RememberMe'] = this.rememberMe;
    }
    return data;
  }
}
