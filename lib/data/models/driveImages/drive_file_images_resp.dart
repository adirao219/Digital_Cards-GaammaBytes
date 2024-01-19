class GetDriveFileImagesResp {
  bool? isSuccess;
  List<DriveFilesData>? result;
  dynamic errorMessage;

  GetDriveFileImagesResp({this.isSuccess, this.result, this.errorMessage});

  GetDriveFileImagesResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
      if (json['Result'] != null && json['Result']['DriveFilesList']!=null) {
      result = <DriveFilesData>[];
      json['Result']['DriveFilesList'].forEach((v) {
        result?.add(DriveFilesData.fromJson(v));
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

class DriveFilesData {
  int? id;
  int? userId;
  int? refTypeID;
  int? refID;
  int? slNo;
  String? driveRefID;
  String? driveUrl;
  String? fileName;
  dynamic fileSize;
  bool? isPreDefined;

  DriveFilesData(
      {this.id,
      this.userId,
      this.refTypeID,
      this.refID,
      this.slNo,
      this.driveRefID,
      this.driveUrl,
      this.fileName,
      this.fileSize,
      this.isPreDefined});

  DriveFilesData.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    userId = json['UserId'];
    refTypeID = json['RefTypeID'];
    refID = json['RefID'];
    slNo = json['SlNo'];
    driveRefID = json['DriveRefID'];
    driveUrl = json['DriveUrl'];
    fileName = json['FileName'];
    fileSize = json['FileSize'];
    isPreDefined = json['IsPreDefined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['ID'] = this.id;
    }
    if (this.userId != null) {
      data['UserId'] = this.userId;
    }
    if (this.refID != null) {
      data['RefID'] = this.refID;
    }
    if (this.refTypeID != null) {
      data['RefTypeID'] = this.refTypeID;
    }
    if (this.driveRefID != null) {
      data['DriveRefID'] = this.driveRefID;
    }
    if (this.driveUrl != null) {
      data['DriveUrl'] = this.driveUrl;
    }
    if (this.fileName != null) {
      data['FileName'] = this.fileName;
    }
    if (this.fileSize != null) {
      data['FileSize'] = this.fileSize;
    }
    if (this.isPreDefined != null) {
      data['IsPreDefined'] = this.isPreDefined;
    }
    return data;
  }
}

class TypeIDList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  TypeIDList({this.disabled, this.group, this.selected, this.text, this.value});

  TypeIDList.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.disabled != null) {
      data['Disabled'] = this.disabled;
    }
    if (this.group != null) {
      data['Group'] = this.group;
    }
    if (this.selected != null) {
      data['Selected'] = this.selected;
    }
    if (this.text != null) {
      data['Text'] = this.text;
    }
    if (this.value != null) {
      data['Value'] = this.value;
    }
    return data;
  }
}

class TemplateList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  TemplateList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  TemplateList.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.disabled != null) {
      data['Disabled'] = this.disabled;
    }
    if (this.group != null) {
      data['Group'] = this.group;
    }
    if (this.selected != null) {
      data['Selected'] = this.selected;
    }
    if (this.text != null) {
      data['Text'] = this.text;
    }
    if (this.value != null) {
      data['Value'] = this.value;
    }
    return data;
  }
}

class HiddenFilter {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  HiddenFilter(
      {this.disabled, this.group, this.selected, this.text, this.value});

  HiddenFilter.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.disabled != null) {
      data['Disabled'] = this.disabled;
    }
    if (this.group != null) {
      data['Group'] = this.group;
    }
    if (this.selected != null) {
      data['Selected'] = this.selected;
    }
    if (this.text != null) {
      data['Text'] = this.text;
    }
    if (this.value != null) {
      data['Value'] = this.value;
    }
    return data;
  }
}

class StringFilter {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  StringFilter(
      {this.disabled, this.group, this.selected, this.text, this.value});

  StringFilter.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.disabled != null) {
      data['Disabled'] = this.disabled;
    }
    if (this.group != null) {
      data['Group'] = this.group;
    }
    if (this.selected != null) {
      data['Selected'] = this.selected;
    }
    if (this.text != null) {
      data['Text'] = this.text;
    }
    if (this.value != null) {
      data['Value'] = this.value;
    }
    return data;
  }
}

class NumericDateFilter {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  NumericDateFilter(
      {this.disabled, this.group, this.selected, this.text, this.value});

  NumericDateFilter.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.disabled != null) {
      data['Disabled'] = this.disabled;
    }
    if (this.group != null) {
      data['Group'] = this.group;
    }
    if (this.selected != null) {
      data['Selected'] = this.selected;
    }
    if (this.text != null) {
      data['Text'] = this.text;
    }
    if (this.value != null) {
      data['Value'] = this.value;
    }
    return data;
  }
}