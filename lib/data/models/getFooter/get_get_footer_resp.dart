import 'package:digitalcardsgaammabytes/data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';

class GetGetFooterResp {
  bool? isSuccess;
  FooterResult? result;
  dynamic errorMessage;

  GetGetFooterResp({this.isSuccess, this.result, this.errorMessage});

  GetGetFooterResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? FooterResult.fromJson(json['Result']) : null;
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.isSuccess != null) {
      data['IsSuccess'] = this.isSuccess;
    }
    if (this.result != null) {
      data['Result'] = this.result?.toJson();
    }
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage;
    }
    return data;
  }
}

class FooterResult {
  FooterData? footerData;
  dynamic footerList;

  FooterResult({this.footerData, this.footerList});

  FooterResult.fromJson(Map<String, dynamic> json) {
    footerData = json['FooterData'] != null
        ? FooterData.fromJson(json['FooterData'])
        : null;
    footerList = json['FooterList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.footerData != null) {
      data['FooterData'] = this.footerData?.toJson();
    }
    if (this.footerList != null) {
      data['FooterList'] = this.footerList;
    }
    return data;
  }
}

class FooterData {
  int? cardID;
  String? cardIDName;
  List<CardIDList>? cardIDList;
  int? link1;
  dynamic link1Name;
  List<Result>? linkList;
  int? link2;
  dynamic link2Name;
  int? link3;
  dynamic link3Name;
  dynamic link4;
  dynamic link4Name;
  dynamic link5;
  dynamic link5Name;
  dynamic link6;
  dynamic link6Name;
  dynamic link7;
  dynamic link7Name;
  dynamic link8;
  dynamic link8Name;

  FooterData(
      {this.cardID,
      this.cardIDName,
      this.cardIDList,
      this.link1,
      this.link1Name,
      this.linkList,
      this.link2,
      this.link2Name,
      this.link3,
      this.link3Name,
      this.link4,
      this.link4Name,
      this.link5,
      this.link5Name,
      this.link6,
      this.link6Name,
      this.link7,
      this.link7Name,
      this.link8,
      this.link8Name});

  FooterData.fromJson(Map<String, dynamic> json) {
    cardID = json['CardID'];
    cardIDName = json['CardIDName'];
    if (json['CardIDList'] != null) {
      cardIDList = <CardIDList>[];
      json['CardIDList'].forEach((v) {
        cardIDList?.add(CardIDList.fromJson(v));
      });
    }
    link1 = json['Link1'];
    link1Name = json['Link1Name'];
    if (json['Link1List'] != null) {
      linkList = <Result>[];
      json['Link1List'].forEach((v) {
        linkList?.add(Result.fromJson(v));
      });
    }
    link2 = json['Link2'];
    link2Name = json['Link2Name'];
    
    link3 = json['Link3'];
    link3Name = json['Link3Name'];
   
    link4 = json['Link4'];
    link4Name = json['Link4Name'];
   
    link5 = json['Link5'];
    link5Name = json['Link5Name'];
    
    link6 = json['Link6'];
    link6Name = json['Link6Name'];
   
    link7 = json['Link7'];
    link7Name = json['Link7Name'];
   
    link8 = json['Link8'];
    link8Name = json['Link8Name'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
    }
    if (this.cardIDName != null) {
      data['CardIDName'] = this.cardIDName;
    }
    if (this.cardIDList != null) {
      data['CardIDList'] = this.cardIDList?.map((v) => v.toJson()).toList();
    }
    if (this.link1 != null) {
      data['Link1'] = this.link1;
    }
    if (this.link1Name != null) {
      data['Link1Name'] = this.link1Name;
    }
    if (this.linkList != null) {
      data['Link1List'] = this.linkList?.map((v) => v.toJson()).toList();
    }
    if (this.link2 != null) {
      data['Link2'] = this.link2;
    }
    if (this.link2Name != null) {
      data['Link2Name'] = this.link2Name;
    }
  
    if (this.link3 != null) {
      data['Link3'] = this.link3;
    }
    if (this.link3Name != null) {
      data['Link3Name'] = this.link3Name;
    }
    
    if (this.link4 != null) {
      data['Link4'] = this.link4;
    }
    if (this.link4Name != null) {
      data['Link4Name'] = this.link4Name;
    }
   
    if (this.link5 != null) {
      data['Link5'] = this.link5;
    }
    if (this.link5Name != null) {
      data['Link5Name'] = this.link5Name;
    }
   
    if (this.link6 != null) {
      data['Link6'] = this.link6;
    }
    if (this.link6Name != null) {
      data['Link6Name'] = this.link6Name;
    }
   
    if (this.link7 != null) {
      data['Link7'] = this.link7;
    }
    if (this.link7Name != null) {
      data['Link7Name'] = this.link7Name;
    }
   
    if (this.link8 != null) {
      data['Link8'] = this.link8;
    }
    if (this.link8Name != null) {
      data['Link8Name'] = this.link8Name;
    }
   
    return data;
  }
}

class CardIDList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  CardIDList({this.disabled, this.group, this.selected, this.text, this.value});

  CardIDList.fromJson(Map<String, dynamic> json) {
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

class Link1List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link1List({this.disabled, this.group, this.selected, this.text, this.value});

  Link1List.fromJson(Map<String, dynamic> json) {
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

class Link2List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link2List({this.disabled, this.group, this.selected, this.text, this.value});

  Link2List.fromJson(Map<String, dynamic> json) {
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

class Link3List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link3List({this.disabled, this.group, this.selected, this.text, this.value});

  Link3List.fromJson(Map<String, dynamic> json) {
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

class Link4List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link4List({this.disabled, this.group, this.selected, this.text, this.value});

  Link4List.fromJson(Map<String, dynamic> json) {
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

class Link5List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link5List({this.disabled, this.group, this.selected, this.text, this.value});

  Link5List.fromJson(Map<String, dynamic> json) {
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

class Link6List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link6List({this.disabled, this.group, this.selected, this.text, this.value});

  Link6List.fromJson(Map<String, dynamic> json) {
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

class Link7List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link7List({this.disabled, this.group, this.selected, this.text, this.value});

  Link7List.fromJson(Map<String, dynamic> json) {
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

class Link8List {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  Link8List({this.disabled, this.group, this.selected, this.text, this.value});

  Link8List.fromJson(Map<String, dynamic> json) {
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
