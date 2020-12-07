import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BannerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 140.h,
    margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
    child:  ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Swiper(
        autoplay: state.bannerList.length > 1,
        autoplayDelay: 2000,
        itemBuilder: (BuildContext context,int index){
          return new Image.network(state.bannerList[index].imageUrl,
            fit: BoxFit.fill,);
        },
        itemCount: state.bannerList.length,
        pagination: new SwiperPagination(),
        control: null,
      ),
    ),

  );
}
