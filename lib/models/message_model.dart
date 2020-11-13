import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  int id;
  String title;
  String content;
  int relationId;
  int isRead;
  int isPush;
  int type;
  int memberId;
  int isDelete;
  int createTime;
  String date;

  MessageModel(
      {this.id,
      this.title,
      this.content,
      this.relationId,
      this.isRead,
      this.isPush,
      this.type,
      this.memberId,
      this.isDelete,
      this.createTime,
      this.date});
  
   factory MessageModel.fromJson(Map<String,dynamic> json) => _$MessageModelFromJson(json);
  Map<String,dynamic> toJson() => _$MessageModelToJson(this);

  // MessageModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   content = json['content'];
  //   relationId = json['relationId'];
  //   isRead = json['isRead'];
  //   isPush = json['isPush'];
  //   type = json['type'];
  //   memberId = json['memberId'];
  //   isDelete = json['isDelete'];
  //   createTime = json['createTime'];
  //   date = json['date'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['content'] = this.content;
  //   data['relationId'] = this.relationId;
  //   data['isRead'] = this.isRead;
  //   data['isPush'] = this.isPush;
  //   data['type'] = this.type;
  //   data['memberId'] = this.memberId;
  //   data['isDelete'] = this.isDelete;
  //   data['createTime'] = this.createTime;
  //   data['date'] = this.date;
  //   return data;
  // }
}
