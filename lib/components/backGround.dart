import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_killer/flykiller-game.dart';

class BackGround {
  final FlyKillerGame game;
  Sprite bgSprite;

  BackGround(this.game){
    bgSprite = Sprite("bg/backyard.png");
  }

  void render(Canvas c){
    Rect bgRect = Rect.fromLTWH(0,
        game.screenSize.height - (game.tileSize *23),//23 на основе размеров картинки
        game.tileSize * 9, //9 тайлов задано в flikiilergame
        game.tileSize * 23); //23 на основе размеров картинки
        bgSprite.renderRect(c, bgRect);
  }
  void update(double t){}
}