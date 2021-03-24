import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_killer/flykiller-game.dart';

class LostView {
  final FlyKillerGame game;
  Rect rect;
  Sprite sprite;

  LostView(this.game){
    rect = Rect.fromLTWH(game.tileSize,
        (game.screenSize.height / 2) - (game.tileSize * 5),
        game.tileSize * 7,
        game.tileSize * 5);
    sprite = Sprite('bg/lose-splash.png');
  }
  void render(Canvas c){
    sprite.renderRect(c,rect);
  }
  void update(double t){}
}