class GetCardSubTypeResp {
  bool? isSuccess;
  List<CardSubTypeResult>? result;
  dynamic errorMessage;

  GetCardSubTypeResp({this.isSuccess, this.result, this.errorMessage});

  GetCardSubTypeResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Result'] != null) {
      result = <CardSubTypeResult>[];
      json['Result'].forEach((v) {
        result?.add(CardSubTypeResult.fromJson(v));
      });
    }
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.isSuccess != null) {
      data['IsSuccess'] = this.isSuccess;
    }
    if (this.result != null) {
      data['Result'] = this.result?.map((v) => v.toJson()).toList();
    }
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage;
    }
    return data;
  }
}

class CardSubTypeResult {
  int? id;
  int? cardType;
  String? cardTypeName;
  String? cardSubTypeName;
  String? thumbnailImage;
  dynamic publishFolder;
  dynamic pictureCaption;
  dynamic defaultHeight;
  dynamic defaultWidth;

  CardSubTypeResult(
      {this.id,
      this.cardType,
      this.cardTypeName,
      this.cardSubTypeName,
      this.thumbnailImage,
      this.publishFolder,
      this.pictureCaption,
      this.defaultHeight,
      this.defaultWidth});

  CardSubTypeResult.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    cardType = json['CardType'];
    cardTypeName = json['CardTypeName'];
    cardSubTypeName = json['CardSubTypeName'];
    thumbnailImage = json['ThumbnailImage'];
    publishFolder = json['PublishFolder'];
    pictureCaption = json['PictureCaption'];
    defaultHeight = json['DefaultHeight'];
    defaultWidth = json['DefaultWidth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['ID'] = this.id;
    }
    if (this.cardType != null) {
      data['CardType'] = this.cardType;
    }
    if (this.cardTypeName != null) {
      data['CardTypeName'] = this.cardTypeName;
    }
    if (this.cardSubTypeName != null) {
      data['CardSubTypeName'] = this.cardSubTypeName;
    }
    if (this.thumbnailImage != null) {
      data['ThumbnailImage'] = this.thumbnailImage;
    }
    if (this.publishFolder != null) {
      data['PublishFolder'] = this.publishFolder;
    }
    if (this.pictureCaption != null) {
      data['PictureCaption'] = this.pictureCaption;
    }
    if (this.defaultHeight != null) {
      data['DefaultHeight'] = this.defaultHeight;
    }
    if (this.defaultWidth != null) {
      data['DefaultWidth'] = this.defaultWidth;
    }
    return data;
  }
}
