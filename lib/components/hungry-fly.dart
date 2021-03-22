import 'package:flame/sprite.dart';
import 'package:fly_killer/components/fly.dart';
import 'package:fly_killer/flykiller-game.dart';

class HungryFly extends Fly{
  HungryFly(FlyKillerGame game,double x, double y): super(game,x,y){
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite("flies/hungry-fly-1.png"));
    flyingSprite.add(Sprite('flies/hungry-fly-.png'));
    deadSprite = Sprite("flies/hungry-fly-dead.png");
  }
}