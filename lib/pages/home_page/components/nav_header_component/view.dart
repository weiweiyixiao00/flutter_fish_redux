import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(NavHeaderState state, Dispatch dispatch, ViewService viewService) {
  String searchWord = state.searchWords.length > 0 ? state.searchWords[0] : '在千万商品中搜索';
  return Container(
      color: state.themeColor,
      padding: EdgeInsets.only(left: 12.0,right: 12.0,bottom: 8.0, top: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('商城',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 28.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(100.0)
              ),
              child: GestureDetector(
                onTap: () {
                  print('搜索');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.search,size: 15,color: Color(0xff999999),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(searchWord,
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 14.0
                        ),),
                    )
                  ],
                ),
              ),
            )
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: "购物车",backgroundColor: Color(0x00000000),gravity: ToastGravity.CENTER);
              },
              child: Image(
                image: AssetImage('lib/assets/images/icon_home_cart.png'),
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: "更多",backgroundColor: Color(0x77000000),gravity: ToastGravity.CENTER);
              },
              child: Image(
                image: AssetImage('lib/assets/images/icon_home_more.png'),
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
}
