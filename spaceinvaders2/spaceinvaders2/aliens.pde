public int alien1Y;

void spawnAlien1() {
  PImage alien1 = loadImage("alien1.png");
  alien1.resize(0, 25);
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i <= width/(alien1.width); i++)
      image(alien1, (alien1.width+33)*i, alien1Y+(alien1.height+5)*j);
  }
}

void updateAlien1() {
  if (frameCount%10 == 0) alien1Y+=10;
}
