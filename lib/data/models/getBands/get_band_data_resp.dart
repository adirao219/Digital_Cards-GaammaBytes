class GetGetBandDataResp {
  bool? isSuccess;
  BandDataResult? result;
  dynamic errorMessage;

  GetGetBandDataResp({this.isSuccess, this.result, this.errorMessage});

  GetGetBandDataResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? BandDataResult.fromJson(json['Result']) : null;
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

class BandDataResult {
  int? cardBandID;
  int? cardID;
  String? cardIDName;
  dynamic cardIDList;
  int? bandType;
  String? bandTypeIDName;
  dynamic bandTypeIDList;
  String? heading;
  String? cBContent;
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
  int? link1;
  dynamic link1Name;
  int? link2;
  dynamic link2Name;
  int? link3;
  dynamic link3Name;
  int? link4;
  dynamic link4Name;
  int? link5;
  dynamic link5Name;
  int? link6;
  dynamic link6Name;
  int? link7;
  dynamic link7Name;
  int? link8;
  dynamic link8Name;

  BandDataResult(
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

  BandDataResult.fromJson(Map<String, dynamic> json) {
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
