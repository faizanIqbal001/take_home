class GetTransactionsResponse {
  bool? status;
  String? statusMsg;
  TransactionsData? data;

  GetTransactionsResponse({this.status, this.statusMsg, this.data});

  GetTransactionsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    data =
        json['data'] != null ? TransactionsData.fromJson(json['data']) : null;
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

class TransactionsData {
  List<TransactionsRows>? rows;
  int? count;

  TransactionsData({this.rows, this.count});

  TransactionsData.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <TransactionsRows>[];
      json['rows'].forEach((v) {
        rows!.add(TransactionsRows.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class TransactionsRows {
  String? amount;
  String? status;
  String? payeeInfoFirstName;
  String? payeeInfoLastName;
  String? paymentLinkDescription;

  TransactionsRows({
    this.amount,
    this.status,
    this.payeeInfoFirstName,
    this.payeeInfoLastName,
    this.paymentLinkDescription,
  });

  TransactionsRows.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    status = json['status'];
    payeeInfoFirstName = json['payeeInfo.firstName'];
    payeeInfoLastName = json['payeeInfo.lastName'];
    paymentLinkDescription = json['paymentLink.description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['status'] = status;
    data['payeeInfo.firstName'] = payeeInfoFirstName;
    data['payeeInfo.lastName'] = payeeInfoLastName;
    data['paymentLink.description'] = paymentLinkDescription;
    return data;
  }
}
