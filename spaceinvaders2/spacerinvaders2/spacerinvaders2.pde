int playerX, playerY;
int pw;

void setup() {
 size(720, 960);


}

void draw() {
  background(0, 0, 0);
 spawnPlayer();
 updatePlayer();
}

void spawnPlayer() {
  PImage player = loadImage("player.png");
 player.resize(0, 50);
 image(player, playerX, height-player.height);
 pw = player.width;
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
