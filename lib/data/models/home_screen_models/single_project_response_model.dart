

class SingleProjectResponseModel {
  String? id;
  String? name;
  int? commentCount;
  String? color;
  bool? isShared;
  int? order;
  bool? isFavorite;
  bool? isInboxProject;
  bool? isTeamInbox;
  String? viewStyle;
  String? url;
  String? parentId;

  SingleProjectResponseModel({
    this.id,
    this.name,
    this.commentCount,
    this.color,
    this.isShared,
    this.order,
    this.isFavorite,
    this.isInboxProject,
    this.isTeamInbox,
    this.viewStyle,
    this.url,
    this.parentId,
  });

  SingleProjectResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    commentCount = json['comment_count'] ?? 0;
    color = json['color'] ?? '';
    isShared = json['is_shared'] ?? false;
    order = json['order'] ?? 0;
    isFavorite = json['is_favorite'] ?? false;
    isInboxProject = json['is_inbox_project'] ?? false;
    isTeamInbox = json['is_team_inbox'] ?? false;
    viewStyle = json['view_style'] ?? '';
    url = json['url'] ?? '';
    parentId = json['parent_id'] != null ? json['parent_id'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['comment_count'] = this.commentCount;
    data['color'] = this.color;
    data['is_shared'] = this.isShared;
    data['order'] = this.order;
    data['is_favorite'] = this.isFavorite;
    data['is_inbox_project'] = this.isInboxProject;
    data['is_team_inbox'] = this.isTeamInbox;
    data['view_style'] = this.viewStyle;
    data['url'] = this.url;
    data['parent_id'] = this.parentId;
    return data;
  }
}
