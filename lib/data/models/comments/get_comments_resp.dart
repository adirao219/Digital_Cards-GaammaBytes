class GetCommentsResp {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  GetCommentsResp({this.postId, this.id, this.name, this.email, this.body});

  GetCommentsResp.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.postId != null) {
      data['postId'] = this.postId;
    }
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.body != null) {
      data['body'] = this.body;
    }
    return data;
  }
}
