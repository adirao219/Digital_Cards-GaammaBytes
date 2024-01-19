class PostSaveFooterReq {
  int? cardID;
  String? link1;
  String? link2;
  String? link3;
  String? link4;
  String? link5;
  String? link6;
  String? link7;
  String? link8;

  PostSaveFooterReq(
      {this.cardID,
      this.link1,
      this.link2,
      this.link3,
      this.link4,
      this.link5,
      this.link6,
      this.link7,
      this.link8});

  PostSaveFooterReq.fromJson(Map<String, dynamic> json) {
    cardID = json['CardID'];
    link1 = json['Link1'];
    link2 = json['Link2'];
    link3 = json['Link3'];
    link4 = json['Link4'];
    link5 = json['Link5'];
    link6 = json['Link6'];
    link7 = json['Link7'];
    link8 = json['Link8'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
    }
    if (this.link1 != null) {
      data['Link1'] = this.link1;
    }
    if (this.link2 != null) {
      data['Link2'] = this.link2;
    }
    if (this.link3 != null) {
      data['Link3'] = this.link3;
    }
    if (this.link4 != null) {
      data['Link4'] = this.link4;
    }
    if (this.link5 != null) {
      data['Link5'] = this.link5;
    }
    if (this.link6 != null) {
      data['Link6'] = this.link6;
    }
    if (this.link7 != null) {
      data['Link7'] = this.link7;
    }
    if (this.link8 != null) {
      data['Link8'] = this.link8;
    }
    return data;
  }
}
