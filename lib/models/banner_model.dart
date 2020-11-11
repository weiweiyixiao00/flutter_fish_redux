import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerData {
  int id;
  String activityName;
  String activityType;
  String imageUrl;
  String backgroudColor;
  String shareTitle;
  String shareDescribe;
  String hyperLink;
  String hyperLinkType;
  String bannerStartTime;
  String bannerEndTime;

  BannerData({this.id,this.activityName,this.activityType,this.imageUrl,this.backgroudColor,this.shareTitle,this.shareDescribe,this.hyperLink,this.hyperLinkType,this.bannerStartTime,this.bannerEndTime});
  
  factory BannerData.fromJson(Map<String,dynamic> json) => _$BannerDataFromJson(json);
  Map<String,dynamic> toJson() => _$BannerDataToJson(this);
}
