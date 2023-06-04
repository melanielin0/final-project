class player {

  public int playerX, playerY;
  public int pw, ph;
  PImage player;

  void setup() {
  
    
  }
  
  player() {
    player = loadImage("player.png");
    pw = player.width;
    ph = player.height;
    player.resize(0, 25);
  }

  void updatePlayer() {
    if (playerX < 0) playerX = 1;
    if (playerX > width-pw) playerX = width-pw-1;
    if (keyCode == RIGHT) playerX ++;
    if (keyCode == LEFT) playerX --;
  }
  
  void display() {
    image(player, playerX, height-player.height);
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
      bullet.setBullet(playerX + pw/2 - 2, playerY+height-2*ph+10);
      bullet.draw();
    }
  }
  
}
