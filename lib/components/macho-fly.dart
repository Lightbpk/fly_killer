import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_killer/components/fly.dart';
import 'package:fly_killer/flykiller-game.dart';

class MachoFly extends Fly{
  MachoFly(FlyKillerGame game,double x, double y): super(game){
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite("flies/macho-fly-1.png"));
    flyingSprite.add(Sprite('flies/macho-fly-.png'));
    deadSprite = Sprite("flies/macho-fly-dead.png");
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025 , game.tileSize * 2.025);
  }
}