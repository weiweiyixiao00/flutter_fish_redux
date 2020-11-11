import 'dart:async';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'action.dart';
import 'state.dart';

Timer timer;

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    Lifecycle.initState: _initAction,
    Lifecycle.dispose: _dispose,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {
}

void _initAction(Action action, Context<SplashState> ctx) {
  SystemChrome.setEnabledSystemUIOverlays([]);
  timer = Timer(Duration(seconds: 2), (){
    Navigator.of(ctx.context).pushReplacementNamed('main_page');
  });
}

void _dispose(Action action, Context<SplashState> ctx) {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
  timer.cancel();
}
