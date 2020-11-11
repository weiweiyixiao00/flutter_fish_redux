class CategoryData {
  int id;
  int activityId;
  String name;
  String iconUrl;
  String iconSize;
  String iconFormat;
  String fontColor;
  int sort;
  int linkType;
  String linkUrl;
  Null linkValue;

  CategoryData(
      {this.id,
      this.activityId,
      this.name,
      this.iconUrl,
      this.iconSize,
      this.iconFormat,
      this.fontColor,
      this.sort,
      this.linkType,
      this.linkUrl,
      this.linkValue});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityId = json['activityId'];
    name = json['name'];
    iconUrl = json['iconUrl'];
    iconSize = json['iconSize'];
    iconFormat = json['iconFormat'];
    fontColor = json['fontColor'];
    sort = json['sort'];
    linkType = json['linkType'];
    linkUrl = json['linkUrl'];
    linkValue = json['linkValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activityId'] = this.activityId;
    data['name'] = this.name;
    data['iconUrl'] = this.iconUrl;
    data['iconSize'] = this.iconSize;
    data['iconFormat'] = this.iconFormat;
    data['fontColor'] = this.fontColor;
    data['sort'] = this.sort;
    data['linkType'] = this.linkType;
    data['linkUrl'] = this.linkUrl;
    data['linkValue'] = this.linkValue;
    return data;
  }
}
