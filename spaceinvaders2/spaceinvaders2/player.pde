public int playerX, playerY;
public int pw, ph;

void spawnPlayer() {
  PImage player = loadImage("player.png");
  player.resize(0, 50);
  image(player, playerX, height-player.height);
  pw = player.width;
  ph = player.height;
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
  if (playerX > width-pw) playerX = width - pw-1;
  if (playerX < -1) playerX = 0;
  if (keyCode == 49) {
   shoot bullet = new shoot();
   bullet.setBullet(playerX + pw/2 - 8, playerY+height-2*ph);
   bullet.draw();
  }
  
}



 
