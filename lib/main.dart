import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_killer/flykiller-game.dart';

void main() async {
  TapGestureRecognizer tapper = new TapGestureRecognizer();
  FlyKillerGame game = new FlyKillerGame();
  Util flameUtil = new Util();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget);
  flameUtil.addGestureRecognizer(tapper);
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

}
