import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_killer/components/backGround.dart';
import 'package:fly_killer/views/home-view.dart';

import 'components/fly.dart';
import 'components/house-Fly.dart';
import 'components/drooler-fly.dart';
import 'components/agile-Fly.dart';
import 'components/macho-Fly.dart';
import 'components/hungry-Fly.dart';
import 'package:fly_killer/view.dart';

class FlyKillerGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  BackGround backGround;
  View activeView = View.home;

  //HomeView homeView;
  FlyKillerGame(){
    initialize();

  }
  void initialize() async {// init
    //homeView = HomeView(this);
    flies = new List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    backGround = BackGround(this);
    spawnFly();
  }
  void spawnFly(){  // добавлятель мух
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    switch (rnd.nextInt(5)){
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  @override
  void render(Canvas canvas) {
    backGround.render(canvas);//рендер бэкграунда
    flies.forEach((Fly fly)=> fly.render(canvas)); // отрисовка мух ил List (flies)
    //if(activeView == View.home) homeView.render(canvas);
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