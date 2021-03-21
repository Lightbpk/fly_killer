import 'dart:ui';

import 'package:fly_killer/flykiller-game.dart';

class Fly {
  final FlyKillerGame game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.game, double x , double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = new Paint();
    flyPaint.color = Color(0xff6ab04c);
  }
  void render(Canvas c){
    c.drawRect(flyRect, flyPaint);
  }
  void update(double t){
    if(isDead){
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    }
    if(flyRect.top > game.screenSize.height){
      isOffScreen = true;
      print('Fly fly away');
    }
  }
  void onTapDown(){
    flyPaint.color = Color(0xffff4757);
    isDead = true;
    game.spawnFly();
  }
}