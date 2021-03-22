import 'package:flame/sprite.dart';
import 'package:fly_killer/components/fly.dart';
import 'package:fly_killer/flykiller-game.dart';

class DroolerFly extends Fly{
  DroolerFly(FlyKillerGame game,double x, double y): super(game,x,y){
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite("flies/drooler-fly-1.png"));
    flyingSprite.add(Sprite('flies/drooler-fly-.png'));
    deadSprite = Sprite("flies/drooler-fly-dead.png");
  }
}