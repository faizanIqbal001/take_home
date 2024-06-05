class GetAgentInfoResponseModel {
  bool? status;
  String? statusMsg;
  AgentInfo? data;

  GetAgentInfoResponseModel({this.status, this.statusMsg, this.data});

  GetAgentInfoResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    data = json['data'] != null ? AgentInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusMsg'] = statusMsg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AgentInfo {
  int? id;
  String? firstName;
  String? lastName;
  int? agencyId;
  dynamic paymentLinkId;
  String? email;
  String? password;
  dynamic passwordResetOtp;
  bool? otpVerified;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  AgentInfo(
      {
        this.id,
        this.firstName,
        this.lastName,
        this.agencyId,
        this.paymentLinkId,
        this.email,
        this.password,
        this.passwordResetOtp,
        this.otpVerified,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.deletedAt
      });

  AgentInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    agencyId = json['agencyId'];
    paymentLinkId = json['paymentLinkId'];
    email = json['email'];
    password = json['password'];
    passwordResetOtp = json['passwordResetOtp'];
    otpVerified = json['otpVerified'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['agencyId'] = agencyId;
    data['paymentLinkId'] = paymentLinkId;
    data['email'] = email;
    data['password'] = password;
    data['passwordResetOtp'] = passwordResetOtp;
    data['otpVerified'] = otpVerified;
    data['phoneNumber'] = phoneNumber;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
