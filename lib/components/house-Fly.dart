import 'package:flame/sprite.dart';
import 'package:fly_killer/components/fly.dart';
import 'package:fly_killer/flykiller-game.dart';

class HouseFly extends Fly{
  HouseFly(FlyKillerGame game,double x, double y): super(game,x,y){
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite("flies/house-fly-1.png"));
    flyingSprite.add(Sprite("flies/house-fly-2.png"));
    deadSprite = Sprite("flies/house-fly-dead.png");
  }
}