// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return MessageModel(
    id: json['id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    relationId: json['relationId'] as int,
    isRead: json['isRead'] as int,
    isPush: json['isPush'] as int,
    type: json['type'] as int,
    memberId: json['memberId'] as int,
    isDelete: json['isDelete'] as int,
    createTime: json['createTime'] as int,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'relationId': instance.relationId,
      'isRead': instance.isRead,
      'isPush': instance.isPush,
      'type': instance.type,
      'memberId': instance.memberId,
      'isDelete': instance.isDelete,
      'createTime': instance.createTime,
      'date': instance.date,
    };
