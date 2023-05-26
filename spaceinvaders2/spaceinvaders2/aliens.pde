public int alien1Y;

void spawnAlien1() {
 PImage alien1 = loadImage("alien1.png");
 alien1.resize(0, 50);
 for (int i = 0; i <= width/(alien1.width + 40); i++)
 image(alien1, (alien1.width+40)*i, alien1Y);
 
}

void updateAlien1() {
  if (frameCount%10 == 0) alien1Y+=10;
}
