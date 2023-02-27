class PostRegistrationResp {
  bool? isSuccess;
  Result? result;
  dynamic errorMessage;

  PostRegistrationResp({this.isSuccess, this.result, this.errorMessage});

  PostRegistrationResp.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
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

class Result {
  String? userId;
  dynamic userName;
  dynamic email;
  dynamic phoneNumber;
  dynamic iPAddress;
  dynamic displayName;
  dynamic phoneNumber2;
  dynamic place;
  dynamic country;
  dynamic userPhoto;
  bool? emailConfirmed;
  dynamic passwordHash;
  dynamic securityStamp;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEndDateUtc;
  bool? lockoutEnabled;
  int? accessFailedCount;
  int? id;
  String? regDate;
  dynamic passcode;
  bool? isActive;
  bool? isCreated;
  dynamic lastLogInTime;
  dynamic startTime;
  dynamic endTime;
  bool? isFakeData;
  dynamic fakeRemarks;
  dynamic isHidden;
  int? companyId;
  dynamic companyName;
  bool? isDashboardUser;
  int? languageId;

  Result(
      {this.userId,
      this.userName,
      this.email,
      this.phoneNumber,
      this.iPAddress,
      this.displayName,
      this.phoneNumber2,
      this.place,
      this.country,
      this.userPhoto,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEndDateUtc,
      this.lockoutEnabled,
      this.accessFailedCount,
      this.id,
      this.regDate,
      this.passcode,
      this.isActive,
      this.isCreated,
      this.lastLogInTime,
      this.startTime,
      this.endTime,
      this.isFakeData,
      this.fakeRemarks,
      this.isHidden,
      this.companyId,
      this.companyName,
      this.isDashboardUser,
      this.languageId});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    userName = json['UserName'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    iPAddress = json['IPAddress'];
    displayName = json['DisplayName'];
    phoneNumber2 = json['PhoneNumber2'];
    place = json['Place'];
    country = json['Country'];
    userPhoto = json['UserPhoto'];
    emailConfirmed = json['EmailConfirmed'];
    passwordHash = json['PasswordHash'];
    securityStamp = json['SecurityStamp'];
    phoneNumberConfirmed = json['PhoneNumberConfirmed'];
    twoFactorEnabled = json['TwoFactorEnabled'];
    lockoutEndDateUtc = json['LockoutEndDateUtc'];
    lockoutEnabled = json['LockoutEnabled'];
    accessFailedCount = json['AccessFailedCount'];
    id = json['Id'];
    regDate = json['RegDate'];
    passcode = json['Passcode'];
    isActive = json['IsActive'];
    isCreated = json['IsCreated'];
    lastLogInTime = json['LastLogInTime'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    isFakeData = json['IsFakeData'];
    fakeRemarks = json['FakeRemarks'];
    isHidden = json['IsHidden'];
    companyId = json['CompanyId'];
    companyName = json['CompanyName'];
    isDashboardUser = json['IsDashboardUser'];
    languageId = json['LanguageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.userId != null) {
      data['UserId'] = this.userId;
    }
    if (this.userName != null) {
      data['UserName'] = this.userName;
    }
    if (this.email != null) {
      data['Email'] = this.email;
    }
    if (this.phoneNumber != null) {
      data['PhoneNumber'] = this.phoneNumber;
    }
    if (this.iPAddress != null) {
      data['IPAddress'] = this.iPAddress;
    }
    if (this.displayName != null) {
      data['DisplayName'] = this.displayName;
    }
    if (this.phoneNumber2 != null) {
      data['PhoneNumber2'] = this.phoneNumber2;
    }
    if (this.place != null) {
      data['Place'] = this.place;
    }
    if (this.country != null) {
      data['Country'] = this.country;
    }
    if (this.userPhoto != null) {
      data['UserPhoto'] = this.userPhoto;
    }
    if (this.emailConfirmed != null) {
      data['EmailConfirmed'] = this.emailConfirmed;
    }
    if (this.passwordHash != null) {
      data['PasswordHash'] = this.passwordHash;
    }
    if (this.securityStamp != null) {
      data['SecurityStamp'] = this.securityStamp;
    }
    if (this.phoneNumberConfirmed != null) {
      data['PhoneNumberConfirmed'] = this.phoneNumberConfirmed;
    }
    if (this.twoFactorEnabled != null) {
      data['TwoFactorEnabled'] = this.twoFactorEnabled;
    }
    if (this.lockoutEndDateUtc != null) {
      data['LockoutEndDateUtc'] = this.lockoutEndDateUtc;
    }
    if (this.lockoutEnabled != null) {
      data['LockoutEnabled'] = this.lockoutEnabled;
    }
    if (this.accessFailedCount != null) {
      data['AccessFailedCount'] = this.accessFailedCount;
    }
    if (this.id != null) {
      data['Id'] = this.id;
    }
    if (this.regDate != null) {
      data['RegDate'] = this.regDate;
    }
    if (this.passcode != null) {
      data['Passcode'] = this.passcode;
    }
    if (this.isActive != null) {
      data['IsActive'] = this.isActive;
    }
    if (this.isCreated != null) {
      data['IsCreated'] = this.isCreated;
    }
    if (this.lastLogInTime != null) {
      data['LastLogInTime'] = this.lastLogInTime;
    }
    if (this.startTime != null) {
      data['StartTime'] = this.startTime;
    }
    if (this.endTime != null) {
      data['EndTime'] = this.endTime;
    }
    if (this.isFakeData != null) {
      data['IsFakeData'] = this.isFakeData;
    }
    if (this.fakeRemarks != null) {
      data['FakeRemarks'] = this.fakeRemarks;
    }
    if (this.isHidden != null) {
      data['IsHidden'] = this.isHidden;
    }
    if (this.companyId != null) {
      data['CompanyId'] = this.companyId;
    }
    if (this.companyName != null) {
      data['CompanyName'] = this.companyName;
    }
    if (this.isDashboardUser != null) {
      data['IsDashboardUser'] = this.isDashboardUser;
    }
    if (this.languageId != null) {
      data['LanguageId'] = this.languageId;
    }
    return data;
  }
}
