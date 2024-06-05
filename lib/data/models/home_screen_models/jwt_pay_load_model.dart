class JwtPayLoad {
  int? id;
  String? email;
  bool? user;
  String? userType;
  int? agencyId;
  String? name;
  String? agencyName;
  String? phoneNumber;
  dynamic paymentLinkId;
  int? iat;

  JwtPayLoad(
      {this.id,
        this.email,
        this.user,
        this.userType,
        this.agencyId,
        this.name,
        this.agencyName,
        this.phoneNumber,
        // this.paymentLinkId,
        this.iat});

  JwtPayLoad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    user = json['user'];
    userType = json['userType'];
    agencyId = json['agencyId'];
    name = json['name'];
    agencyName = json['agencyName'];
    phoneNumber = json['phoneNumber'];
      // paymentLinkId = json['paymentLinkId'];
    iat = json['iat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['user'] = user;
    data['userType'] = userType;
    data['agencyId'] = agencyId;
    data['name'] = name;
    data['agencyName'] = agencyName;
    data['phoneNumber'] = phoneNumber;
    // data['paymentLinkId'] = paymentLinkId;
    data['iat'] = iat;
    return data;
  }
}
