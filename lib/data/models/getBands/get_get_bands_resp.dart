import 'package:digitalcardsgaammabytes/data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';

class GetGetBandsResp {
  bool? isSuccess;
  BandResult? result;
  String? errorMessage;

  GetGetBandsResp({this.isSuccess, this.result, this.errorMessage});

  GetGetBandsResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? BandResult.fromJson(json['Result']) : null;
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

class BandResult {
  BandsData? bandsData;
  List<BandsList>? bandsList;
  String? cardName;

  BandResult({this.bandsData, this.bandsList, this.cardName});

  BandResult.fromJson(Map<String, dynamic> json) {
    bandsData = json['BandsData'] != null
        ? BandsData.fromJson(json['BandsData'])
        : null;
    if (json['BandsList'] != null) {
      bandsList = <BandsList>[];
      json['BandsList'].forEach((v) {
        bandsList?.add(BandsList.fromJson(v));
      });
    }
    cardName = json['CardName'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.bandsData != null) {
      data['BandsData'] = this.bandsData?.toJson();
    }
    if (this.bandsList != null) {
      data['BandsList'] = this.bandsList?.map((v) => v.toJson()).toList();
    }
    if (this.cardName != null) {
      data['CardName'] = this.cardName;
    }
   
    return data;
  }
}

class BandsData {
  int? cardBandID;
  int? cardID;
  dynamic cardIDName;
  dynamic cardIDList;
  dynamic bandType;
  dynamic bandTypeIDName;
  List<BandTypeIDList>? bandTypeIDList;
  dynamic heading;
  dynamic cBContent;
  dynamic uRLPicture;
  int? pictureSize;
  int? latitude;
  int? longitude;
  dynamic cardLinkBandID;
  dynamic cardLinkBandIDName;
  List? cardLinkBandIDList;
  dynamic accHolderName;
  dynamic bankName;
  dynamic branchName;
  dynamic accType;
  dynamic accTypeIDName;
  List<AccTypeIDList>? accTypeIDList;
  dynamic iFSCCOde;
  dynamic accNum;
  dynamic mICRCOde;
  dynamic swiftCode;
  dynamic dataPosition;
  dynamic dataPositionIDName;
  dynamic dataPositionIDList;
  dynamic uPIId;
  dynamic uPIPhoneNum;
  dynamic uPIQRCode;
  dynamic driveFileRef;
  dynamic link1;
  dynamic link1Name;
  dynamic link2;
  dynamic link2Name;
  dynamic link3;
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

  BandsData(
      {this.cardBandID,
      this.cardID,
      this.cardIDName,
      this.cardIDList,
      this.bandType,
      this.bandTypeIDName,
      this.bandTypeIDList,
      this.heading,
      this.cBContent,
      this.uRLPicture,
      this.pictureSize,
      this.latitude,
      this.longitude,
      this.cardLinkBandID,
      this.cardLinkBandIDName,
      this.cardLinkBandIDList,
      this.accHolderName,
      this.bankName,
      this.branchName,
      this.accType,
      this.accTypeIDName,
      this.accTypeIDList,
      this.iFSCCOde,
      this.accNum,
      this.mICRCOde,
      this.swiftCode,
      this.dataPosition,
      this.dataPositionIDName,
      this.dataPositionIDList,
      this.uPIId,
      this.uPIPhoneNum,
      this.uPIQRCode,
      this.driveFileRef,
      this.link1,
      this.link1Name,
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

  BandsData.fromJson(Map<String, dynamic> json) {
    cardBandID = json['CardBandID'];
    cardID = json['CardID'];
    cardIDName = json['CardIDName'];
    cardIDList = json['CardIDList'];
    bandType = json['BandType'];
    bandTypeIDName = json['BandTypeIDName'];
    if (json['BandTypeIDList'] != null) {
      bandTypeIDList = <BandTypeIDList>[];
      json['BandTypeIDList'].forEach((v) {
        bandTypeIDList?.add(BandTypeIDList.fromJson(v));
      });
    }
    heading = json['Heading'];
    cBContent = json['CBContent'];
    uRLPicture = json['URLPicture'];
    pictureSize = json['PictureSize'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    cardLinkBandID = json['CardLinkBandID'];
    cardLinkBandIDName = json['CardLinkBandIDName'];
    if (json['CardLinkBandIDList'] != null) {
      cardLinkBandIDList = [];
      json['CardLinkBandIDList'].forEach((v) {
        cardLinkBandIDList?.add(v);
      });
    }
    accHolderName = json['AccHolderName'];
    bankName = json['BankName'];
    branchName = json['BranchName'];
    accType = json['AccType'];
    accTypeIDName = json['AccTypeIDName'];
    if (json['AccTypeIDList'] != null) {
      accTypeIDList = <AccTypeIDList>[];
      json['AccTypeIDList'].forEach((v) {
        accTypeIDList?.add(AccTypeIDList.fromJson(v));
      });
    }
    iFSCCOde = json['IFSCCOde'];
    accNum = json['AccNum'];
    mICRCOde = json['MICRCOde'];
    swiftCode = json['SwiftCode'];
    dataPosition = json['DataPosition'];
    dataPositionIDName = json['DataPositionIDName'];
    dataPositionIDList = json['DataPositionIDList'];
    uPIId = json['UPIId'];
    uPIPhoneNum = json['UPIPhoneNum'];
    uPIQRCode = json['UPIQRCode'];
    driveFileRef = json['DriveFileRef'];
    link1 = json['Link1'];
    link1Name = json['Link1Name'];
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
    if (this.cardBandID != null) {
      data['CardBandID'] = this.cardBandID;
    }
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
    }
    if (this.cardIDName != null) {
      data['CardIDName'] = this.cardIDName;
    }
    if (this.cardIDList != null) {
      data['CardIDList'] = this.cardIDList;
    }
    if (this.bandType != null) {
      data['BandType'] = this.bandType;
    }
    if (this.bandTypeIDName != null) {
      data['BandTypeIDName'] = this.bandTypeIDName;
    }
    if (this.bandTypeIDList != null) {
      data['BandTypeIDList'] =
          this.bandTypeIDList?.map((v) => v.toJson()).toList();
    }
    if (this.heading != null) {
      data['Heading'] = this.heading;
    }
    if (this.cBContent != null) {
      data['CBContent'] = this.cBContent;
    }
    if (this.uRLPicture != null) {
      data['URLPicture'] = this.uRLPicture;
    }
    if (this.pictureSize != null) {
      data['PictureSize'] = this.pictureSize;
    }
    if (this.latitude != null) {
      data['Latitude'] = this.latitude;
    }
    if (this.longitude != null) {
      data['Longitude'] = this.longitude;
    }
    if (this.cardLinkBandID != null) {
      data['CardLinkBandID'] = this.cardLinkBandID;
    }
    if (this.cardLinkBandIDName != null) {
      data['CardLinkBandIDName'] = this.cardLinkBandIDName;
    }
    if (this.cardLinkBandIDList != null) {
      data['CardLinkBandIDList'] =
          this.cardLinkBandIDList?.map((v) => v).toList();
    }
    if (this.accHolderName != null) {
      data['AccHolderName'] = this.accHolderName;
    }
    if (this.bankName != null) {
      data['BankName'] = this.bankName;
    }
    if (this.branchName != null) {
      data['BranchName'] = this.branchName;
    }
    if (this.accType != null) {
      data['AccType'] = this.accType;
    }
    if (this.accTypeIDName != null) {
      data['AccTypeIDName'] = this.accTypeIDName;
    }
    if (this.accTypeIDList != null) {
      data['AccTypeIDList'] =
          this.accTypeIDList?.map((v) => v.toJson()).toList();
    }
    if (this.iFSCCOde != null) {
      data['IFSCCOde'] = this.iFSCCOde;
    }
    if (this.accNum != null) {
      data['AccNum'] = this.accNum;
    }
    if (this.mICRCOde != null) {
      data['MICRCOde'] = this.mICRCOde;
    }
    if (this.swiftCode != null) {
      data['SwiftCode'] = this.swiftCode;
    }
    if (this.dataPosition != null) {
      data['DataPosition'] = this.dataPosition;
    }
    if (this.dataPositionIDName != null) {
      data['DataPositionIDName'] = this.dataPositionIDName;
    }
    if (this.dataPositionIDList != null) {
      data['DataPositionIDList'] = this.dataPositionIDList;
    }
    if (this.uPIId != null) {
      data['UPIId'] = this.uPIId;
    }
    if (this.uPIPhoneNum != null) {
      data['UPIPhoneNum'] = this.uPIPhoneNum;
    }
    if (this.uPIQRCode != null) {
      data['UPIQRCode'] = this.uPIQRCode;
    }
    if (this.driveFileRef != null) {
      data['DriveFileRef'] = this.driveFileRef;
    }
    if (this.link1 != null) {
      data['Link1'] = this.link1;
    }
    if (this.link1Name != null) {
      data['Link1Name'] = this.link1Name;
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

class BandTypeIDList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  BandTypeIDList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  BandTypeIDList.fromJson(Map<String, dynamic> json) {
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

class AccTypeIDList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  AccTypeIDList(
      {this.disabled, this.group, this.selected, this.text, this.value});

  AccTypeIDList.fromJson(Map<String, dynamic> json) {
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

class BandsList {
  int? cardBandID;
  int? cardID;
  String? cardIDName;
  dynamic cardIDList;
  int? bandType;
  String? bandTypeIDName;
  dynamic bandTypeIDList;
  String? heading;
  dynamic cBContent;
  dynamic uRLPicture;
  int? pictureSize;
  double? latitude;
  double? longitude;
  int? cardLinkBandID;
  dynamic cardLinkBandIDName;
  dynamic cardLinkBandIDList;
  dynamic accHolderName;
  dynamic bankName;
  dynamic branchName;
  int? accType;
  dynamic accTypeIDName;
  dynamic accTypeIDList;
  dynamic iFSCCOde;
  dynamic accNum;
  dynamic mICRCOde;
  dynamic swiftCode;
  int? dataPosition;
  dynamic dataPositionIDName;
  dynamic dataPositionIDList;
  dynamic uPIId;
  dynamic uPIPhoneNum;
  String? uPIQRCode;
  String? driveFileRef;
  dynamic link1;
  dynamic link1Name;
  dynamic link2;
  dynamic link2Name;
  dynamic link3;
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

  BandsList(
      {this.cardBandID,
      this.cardID,
      this.cardIDName,
      this.cardIDList,
      this.bandType,
      this.bandTypeIDName,
      this.bandTypeIDList,
      this.heading,
      this.cBContent,
      this.uRLPicture,
      this.pictureSize,
      this.latitude,
      this.longitude,
      this.cardLinkBandID,
      this.cardLinkBandIDName,
      this.cardLinkBandIDList,
      this.accHolderName,
      this.bankName,
      this.branchName,
      this.accType,
      this.accTypeIDName,
      this.accTypeIDList,
      this.iFSCCOde,
      this.accNum,
      this.mICRCOde,
      this.swiftCode,
      this.dataPosition,
      this.dataPositionIDName,
      this.dataPositionIDList,
      this.uPIId,
      this.uPIPhoneNum,
      this.uPIQRCode,
      this.driveFileRef,
      this.link1,
      this.link1Name,
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

  BandsList.fromJson(Map<String, dynamic> json) {
    cardBandID = json['CardBandID'];
    cardID = json['CardID'];
    cardIDName = json['CardIDName'];
    cardIDList = json['CardIDList'];
    bandType = json['BandType'];
    bandTypeIDName = json['BandTypeIDName'];
    bandTypeIDList = json['BandTypeIDList'];
    heading = json['Heading'];
    cBContent = json['CBContent'];
    uRLPicture = json['URLPicture'];
    pictureSize = json['PictureSize'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    cardLinkBandID = json['CardLinkBandID'];
    cardLinkBandIDName = json['CardLinkBandIDName'];
    cardLinkBandIDList = json['CardLinkBandIDList'];
    accHolderName = json['AccHolderName'];
    bankName = json['BankName'];
    branchName = json['BranchName'];
    accType = json['AccType'];
    accTypeIDName = json['AccTypeIDName'];
    accTypeIDList = json['AccTypeIDList'];
    iFSCCOde = json['IFSCCOde'];
    accNum = json['AccNum'];
    mICRCOde = json['MICRCOde'];
    swiftCode = json['SwiftCode'];
    dataPosition = json['DataPosition'];
    dataPositionIDName = json['DataPositionIDName'];
    dataPositionIDList = json['DataPositionIDList'];
    uPIId = json['UPIId'];
    uPIPhoneNum = json['UPIPhoneNum'];
    uPIQRCode = json['UPIQRCode'];
    driveFileRef = json['DriveFileRef'];
    link1 = json['Link1'];
    link1Name = json['Link1Name'];
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
    if (this.cardBandID != null) {
      data['CardBandID'] = this.cardBandID;
    }
    if (this.cardID != null) {
      data['CardID'] = this.cardID;
    }
    if (this.cardIDName != null) {
      data['CardIDName'] = this.cardIDName;
    }
    if (this.cardIDList != null) {
      data['CardIDList'] = this.cardIDList;
    }
    if (this.bandType != null) {
      data['BandType'] = this.bandType;
    }
    if (this.bandTypeIDName != null) {
      data['BandTypeIDName'] = this.bandTypeIDName;
    }
    if (this.bandTypeIDList != null) {
      data['BandTypeIDList'] = this.bandTypeIDList;
    }
    if (this.heading != null) {
      data['Heading'] = this.heading;
    }
    if (this.cBContent != null) {
      data['CBContent'] = this.cBContent;
    }
    if (this.uRLPicture != null) {
      data['URLPicture'] = this.uRLPicture;
    }
    if (this.pictureSize != null) {
      data['PictureSize'] = this.pictureSize;
    }
    if (this.latitude != null) {
      data['Latitude'] = this.latitude;
    }
    if (this.longitude != null) {
      data['Longitude'] = this.longitude;
    }
    if (this.cardLinkBandID != null) {
      data['CardLinkBandID'] = this.cardLinkBandID;
    }
    if (this.cardLinkBandIDName != null) {
      data['CardLinkBandIDName'] = this.cardLinkBandIDName;
    }
    if (this.cardLinkBandIDList != null) {
      data['CardLinkBandIDList'] = this.cardLinkBandIDList;
    }
    if (this.accHolderName != null) {
      data['AccHolderName'] = this.accHolderName;
    }
    if (this.bankName != null) {
      data['BankName'] = this.bankName;
    }
    if (this.branchName != null) {
      data['BranchName'] = this.branchName;
    }
    if (this.accType != null) {
      data['AccType'] = this.accType;
    }
    if (this.accTypeIDName != null) {
      data['AccTypeIDName'] = this.accTypeIDName;
    }
    if (this.accTypeIDList != null) {
      data['AccTypeIDList'] = this.accTypeIDList;
    }
    if (this.iFSCCOde != null) {
      data['IFSCCOde'] = this.iFSCCOde;
    }
    if (this.accNum != null) {
      data['AccNum'] = this.accNum;
    }
    if (this.mICRCOde != null) {
      data['MICRCOde'] = this.mICRCOde;
    }
    if (this.swiftCode != null) {
      data['SwiftCode'] = this.swiftCode;
    }
    if (this.dataPosition != null) {
      data['DataPosition'] = this.dataPosition;
    }
    if (this.dataPositionIDName != null) {
      data['DataPositionIDName'] = this.dataPositionIDName;
    }
    if (this.dataPositionIDList != null) {
      data['DataPositionIDList'] = this.dataPositionIDList;
    }
    if (this.uPIId != null) {
      data['UPIId'] = this.uPIId;
    }
    if (this.uPIPhoneNum != null) {
      data['UPIPhoneNum'] = this.uPIPhoneNum;
    }
    if (this.uPIQRCode != null) {
      data['UPIQRCode'] = this.uPIQRCode;
    }
    if (this.driveFileRef != null) {
      data['DriveFileRef'] = this.driveFileRef;
    }
    if (this.link1 != null) {
      data['Link1'] = this.link1;
    }
    if (this.link1Name != null) {
      data['Link1Name'] = this.link1Name;
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

class LinkList {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  LinkList({this.disabled, this.group, this.selected, this.text, this.value});

  LinkList.fromJson(Map<String, dynamic> json) {
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
