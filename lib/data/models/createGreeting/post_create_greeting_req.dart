class PostCreateGreetingReq {
  String? userIdString;
  int? id;
  int? typeID;
  int? languageID;
  int? templateID;
  int? greetingStatus;
  String? caption;
  String? message;
  String? sender;

  PostCreateGreetingReq(
      {this.userIdString,
      this.id,
      this.typeID,
      this.languageID,
      this.templateID,
      this.greetingStatus,
      this.caption,
      this.message,
      this.sender});

  PostCreateGreetingReq.fromJson(Map<String, dynamic> json) {
    userIdString = json['UserIdString'];
    id = json['Id'];
    typeID = json['TypeID'];
    languageID = json['LanguageID'];
    templateID = json['TemplateID'];
    greetingStatus = json['GreetingStatus'];
    caption = json['Caption'];
    message = json['Message'];
    sender = json['Sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.userIdString != null) {
      data['UserIdString'] = this.userIdString;
    }
    if (this.id != null) {
      data['Id'] = this.id;
    }
    if (this.typeID != null) {
      data['TypeID'] = this.typeID;
    }
    if (this.languageID != null) {
      data['LanguageID'] = this.languageID;
    }
    if (this.templateID != null) {
      data['TemplateID'] = this.templateID;
    }
    if (this.greetingStatus != null) {
      data['GreetingStatus'] = this.greetingStatus;
    }
    if (this.caption != null) {
      data['Caption'] = this.caption;
    }
    if (this.message != null) {
      data['Message'] = this.message;
    }
    if (this.sender != null) {
      data['Sender'] = this.sender;
    }
    return data;
  }
}
