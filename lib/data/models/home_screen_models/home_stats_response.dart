class HomeStatsResponse {
  bool? status;
  String? statusMsg;
  AgentStats? data;

  HomeStatsResponse({this.status, this.statusMsg, this.data});

  HomeStatsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    data = json['data'] != null ?  AgentStats.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['status'] = status;
    data['statusMsg'] = statusMsg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AgentStats {
  int? approvedCount;
  int? pendingCount;
  int? approvedSum;

  AgentStats({
    this.approvedCount,
    this.pendingCount,
    this.approvedSum,
  });

  AgentStats.fromJson(Map<String, dynamic> json) {
    approvedCount = json['approvedCount'];
    pendingCount = json['pendingCount'];
    approvedSum = json['approvedSum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['approvedCount'] = approvedCount;
    data['pendingCount'] = pendingCount;
    data['approvedSum'] = approvedSum;
    return data;
  }
}
