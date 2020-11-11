import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildItem(CategoryState state, ViewService viewService) {
  List<Widget> categoryItems = state.categoryList?.map((item) => 
    Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: GestureDetector(
        onTap: () => {Fluttertoast.showToast(msg: item.name)},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(item.iconUrl,
                fit: BoxFit.fill,
                height: 42,
                width: 42,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(item.name,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                )
              ),
            )
          ],
        ),
      ),
    )
  )?.toList();
  return GridView(
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      childAspectRatio: 0.81
    ),
    children: categoryItems,
  );
}

Widget buildView(CategoryState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 200,
    width: 361,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
    child: buildItem(state, viewService),
  );
}
