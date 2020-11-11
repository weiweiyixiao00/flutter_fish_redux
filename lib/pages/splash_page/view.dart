import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
    final size = MediaQuery.of(viewService.context).size;
  return Scaffold(
    body: Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(top: size.height/3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image(
              image: new AssetImage('lib/assets/images/icon_logo.png'),
              width: 100,
            )
          ),
          Padding(
            child: Text('购物商城',
              style: TextStyle(color: Colors.blue,fontSize: 18),), 
              padding: EdgeInsets.only(top:10),
          )
        ],
      ),
    )
  );
}
