import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/components/fly.dart';
import 'package:fly_killer/flykiller-game.dart';

class HungryFly extends Fly{
  HungryFly(FlyKillerGame game,double x, double y): super(game){
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite("flies/hungry-fly-1.png"));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite("flies/hungry-fly-dead.png");
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
  }
  double get speed => game.tileSize * 5;
}