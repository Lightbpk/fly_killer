import 'package:flame/sprite.dart';
import 'package:fly_killer/components/fly.dart';
import 'package:fly_killer/flykiller-game.dart';

class AgileFly extends Fly{
  AgileFly(FlyKillerGame game,double x, double y): super(game,x,y){
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite("flies/agile-fly-1.png"));
    flyingSprite.add(Sprite('flies/agile-fly-.png'));
    deadSprite = Sprite("flies/agile-fly-dead.png");
  }
}