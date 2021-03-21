import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'components/fly.dart';

class FlyKillerGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;

  FlyKillerGame(){
    initialize();

  }
  void initialize() async {
    flies = new List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    spawnFly();
  }
  void spawnFly(){
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this,x,y));
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    flies.forEach((Fly fly)=> fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width / 9;
  }
  void onTapDown(TapDownDetails d){
    print('onTapDown - work');
    flies.forEach((Fly fly) {
      if(fly.flyRect.contains(d.globalPosition)){
        fly.onTapDown();
        print("fly taped");
      }
    });
  }
}