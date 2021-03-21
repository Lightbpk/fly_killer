import 'dart:ui';

import 'package:fly_killer/flykiller-game.dart';

class Fly {
  final FlyKillerGame game;
  Rect flyRect;
  Paint flyPaint;

  Fly(this.game, double x , double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = new Paint();
    flyPaint.color = Color(0xff6ab04c);
  }
  void render(Canvas c){
    c.drawRect(flyRect, flyPaint);
  }
  void update(double t){}
  void onTapDown(){
    flyPaint.color = Color(0xffff4757);
  }
}