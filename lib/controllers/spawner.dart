import 'package:fly_killer/components/fly.dart';
import 'package:fly_killer/flykiller-game.dart';

class FlySpawner {
  final FlyKillerGame game;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final intervalChange = 3;
  final maxFliesOnScreen = 7;

  int currentInterval;
  int nextSpawn;


  FlySpawner(this.game){
    start();
    game.spawnFly();
  }
  void start(){
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }
  void killAll(){
    game.flies.forEach((Fly fly) => fly.isDead = true);
  }
  void update(double t){
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingFlies = 0;
    game.flies.forEach((Fly fly) {if(!fly.isDead)livingFlies += 1;});

    if(nowTimestamp >= nextSpawn && livingFlies < maxFliesOnScreen){
      game.spawnFly();
      if(currentInterval > minSpawnInterval){
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.2).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }
}