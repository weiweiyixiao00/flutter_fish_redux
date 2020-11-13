import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MessageItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 100,
    color: Colors.green,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(state.message.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(state.message.content,
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 14,
            ),
          ),
        ),
        Text(state.message.date,
          style: TextStyle(
            color: Color(0xff999999),
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
