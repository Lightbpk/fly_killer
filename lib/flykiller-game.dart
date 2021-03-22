import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_killer/components/backGround.dart';

import 'components/fly.dart';

class FlyKillerGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  BackGround backGround;

  FlyKillerGame(){
    initialize();

  }
  void initialize() async {// init
    flies = new List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    backGround = BackGround(this);
    spawnFly();
  }
  void spawnFly(){  // добавлятель мух
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this,x,y));
  }

  @override
  void render(Canvas canvas) {
    backGround.render(canvas);//рендер бэкграунда
    flies.forEach((Fly fly)=> fly.render(canvas)); // отрисовка мух ил List (flies)
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width / 9;// размер (ширина) одного тэйла
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