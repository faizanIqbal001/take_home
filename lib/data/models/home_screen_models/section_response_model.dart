class SectionResponseModel {
  String? id;
  String? projectId;
  int? order;
  String? name;

  SectionResponseModel({this.id, this.projectId, this.order, this.name});

  SectionResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    projectId = json['project_id'] ??'';
    order = json['order'] ?? 0;
    name = json['name']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['order'] = this.order;
    data['name'] = this.name;
    return data;
  }
}
