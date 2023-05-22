public int playerX, playerY;
public int pw;
public int alien1Y;

void setup() {
 size(720, 960);


}

void draw() {
  background(0, 0, 0);
 spawnPlayer();
 updatePlayer();
 spawnAlien1();
 updateAlien1();
}

void spawnPlayer() {
  PImage player = loadImage("player.png");
 player.resize(0, 50);
 image(player, playerX, height-player.height);
 pw = player.width;
}

void spawnAlien1() {
 PImage alien1 = loadImage("alien1.png");
 alien1.resize(0, 50);
 for (int i = 0; i <= width/(alien1.width + 40); i++)
 image(alien1, (alien1.width+40)*i, alien1Y);
 
}

void updateAlien1() {
  if (frameCount%40 == 0) alien1Y+=10;
}

void updatePlayer() {
  if (playerX < 0) playerX = 1;
  if (playerX > width-pw) playerX = width-pw-1;
}

void keyPressed() {
 if (playerX > -1) 
  if (keyCode == RIGHT) playerX += 20;
 if (playerX < width-pw) 
   if (keyCode == LEFT) playerX -= 20;

 
}
