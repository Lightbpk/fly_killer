import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/flykiller-game.dart';

class Fly {
  final FlyKillerGame game;
  Rect flyRect;
  bool isDead = false;
  bool isOffScreen = false;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  Fly(this.game, double x , double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }
  void render(Canvas c){
    if(isDead){
      deadSprite.renderRect(c, flyRect.inflate(2));
    }else{
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));//index округляется до int
    }
  }
  void update(double t){
    if(isDead){
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    }else {
      flyingSpriteIndex += 30 * t;//МАГИЯ анимации предполагается что е = 0,016
      if (flyingSpriteIndex >= 2){
        flyingSpriteIndex -= 2;
      }
    }
    if(flyRect.top > game.screenSize.height){
      isOffScreen = true;
      print('Fly fly away');
    }
  }
  void onTapDown(){
    isDead = true;
    game.spawnFly();
  }
}