// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData(
    id: json['id'] as int,
    activityName: json['activityName'] as String,
    activityType: json['activityType'] as String,
    imageUrl: json['imageUrl'] as String,
    backgroudColor: json['backgroudColor'] as String,
    shareTitle: json['shareTitle'] as String,
    shareDescribe: json['shareDescribe'] as String,
    hyperLink: json['hyperLink'] as String,
    hyperLinkType: json['hyperLinkType'] as String,
    bannerStartTime: json['bannerStartTime'] as String,
    bannerEndTime: json['bannerEndTime'] as String,
  );
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityName': instance.activityName,
      'activityType': instance.activityType,
      'imageUrl': instance.imageUrl,
      'backgroudColor': instance.backgroudColor,
      'shareTitle': instance.shareTitle,
      'shareDescribe': instance.shareDescribe,
      'hyperLink': instance.hyperLink,
      'hyperLinkType': instance.hyperLinkType,
      'bannerStartTime': instance.bannerStartTime,
      'bannerEndTime': instance.bannerEndTime,
    };
