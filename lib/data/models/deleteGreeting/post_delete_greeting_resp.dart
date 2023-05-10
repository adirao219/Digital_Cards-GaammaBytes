class PostBooleanGreetingResp {
  bool? isSuccess;
  bool? result;
  String? errorMessage;

  PostBooleanGreetingResp({this.isSuccess, this.result, this.errorMessage});

  PostBooleanGreetingResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.isSuccess != null) {
      data['IsSuccess'] = this.isSuccess;
    }
    if (this.result != null) {
      data['Result'] = this.result;
    }
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage;
    }
    return data;
  }
}

class APIResponse {
  bool? isSuccess;
  dynamic result;
  String? errorMessage;

  APIResponse({this.isSuccess, this.result, this.errorMessage});

  APIResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.isSuccess != null) {
      data['IsSuccess'] = this.isSuccess;
    }
    if (this.result != null) {
      data['Result'] = this.result;
    }
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage;
    }
    return data;
  }
}

class StorageResponse {
  bool? isSuccess;
  StorageData? result;
  String? errorMessage;

  StorageResponse({this.isSuccess, this.result, this.errorMessage});

  StorageResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = StorageData.fromJson(json['Result']);
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.isSuccess != null) {
      data['IsSuccess'] = this.isSuccess;
    }
    if (this.result != null) {
      data['Result'] = this.result;
    }
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage;
    }
    return data;
  }
}

class StorageData {
  int? noCredits;
  String? totalSpace;
  String? utilizedSapce;
  String? remaningSapce;

  StorageData(
      {this.noCredits,
      this.totalSpace,
      this.utilizedSapce,
      this.remaningSapce});

  StorageData.fromJson(Map<String, dynamic> json) {
    noCredits = json['NoCredits'];
    totalSpace = json['TotalSpace'];
    utilizedSapce = json['UtilizedSapce'];
    remaningSapce = json['RemaningSapce'];
  }
}

class CreditResponse {
  bool? isSuccess;
  List<CreditHistoryData>? result;
  String? errorMessage;

  CreditResponse({this.isSuccess, this.result, this.errorMessage});

  CreditResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Result'] != null) {
      result = <CreditHistoryData>[];
      json['Result'].forEach((v) {
        result?.add(CreditHistoryData.fromJson(v));
      });
    }
    errorMessage = json['ErrorMessage'];
  }
}

class CreditHistoryData {
  int? slNo;
  int? creditId;
  String? billNumber;
  String? billDate;
  String? expiresOn;
  String? utiliseUpTo;
  int? noOfCredits;
  int? noOfCreditsUtilised;
  int? noOfCreditsLapsed;
  int? noOfCreditsPending;
  String? downloadLink;
  String? downloadFileName;
  String? remarks;

  CreditHistoryData(
      {this.slNo,
      this.creditId,
      this.billNumber,
      this.billDate,
      this.expiresOn,
      this.utiliseUpTo,
      this.noOfCredits,
      this.noOfCreditsUtilised,
      this.noOfCreditsLapsed,
      this.noOfCreditsPending,
      this.downloadLink,
      this.downloadFileName,
      this.remarks});

  CreditHistoryData.fromJson(Map<String, dynamic> json) {
    slNo = json['SlNo'];
    creditId = json['CreditId'];
    billNumber = json['BillNumber'];
    billDate = json['BillDate'];
    expiresOn = json['ExpiresOn'];
    utiliseUpTo = json['UiliseUpTo'];
    noOfCredits = json['NoOfCredits'];
    noOfCreditsUtilised = json['NoOfCreditsUtilised'];
    noOfCreditsLapsed = json['NoOfCreditsLapsed'];
    noOfCreditsPending = json['NoOfCreditsPending'];
    downloadLink = json['DownloadLink'];
    downloadFileName = json['DownloadFileName'];
    remarks = json['Remarks'];
  }
}

class CreditDetailsResponse {
  bool? isSuccess;
  List<CreditDetailsData>? result;
  String? errorMessage;

  CreditDetailsResponse({this.isSuccess, this.result, this.errorMessage});

  CreditDetailsResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Result'] != null) {
      result = <CreditDetailsData>[];
      json['Result'].forEach((v) {
        result?.add(CreditDetailsData.fromJson(v));
      });
    }
    errorMessage = json['ErrorMessage'];
  }
}

class CreditDetailsData {
  int? iD;
  int? parentTypeId;
  String? parentTypeIdName;
  int? parentId;
  String? parentIdName;
  int? parentIdSub;
  String? parentIdSubName;
  int? creditId;
  String? creditAddedOn;
  String? creditAddedOnString;
  int? noofCredits;
  int? userId;

  CreditDetailsData(
      {this.iD,
      this.parentTypeId,
      this.parentTypeIdName,
      this.parentId,
      this.parentIdName,
      this.parentIdSub,
      this.parentIdSubName,
      this.creditId,
      this.creditAddedOn,
      this.creditAddedOnString,
      this.noofCredits,
      this.userId});

  CreditDetailsData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    parentTypeId = json['ParentTypeId'];
    parentTypeIdName = json['ParentTypeIdName'];
    parentId = json['ParentId'];
    parentIdName = json['ParentIdName'];
    parentIdSub = json['ParentIdSub'];
    parentIdSubName = json['ParentIdSubName'];
    creditId = json['CreditId'];
    creditAddedOn = json['CreditAddedOn'];
    creditAddedOnString = json['CreditAddedOnString'];
    noofCredits = json['NoofCredits'];
    userId = json['UserId'];
  }
}
