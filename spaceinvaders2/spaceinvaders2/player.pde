class player {

  public int playerX, playerY;
  public int pw, ph;
  public int lives;
  PImage player;
 
  player() {
    player = loadImage("player.png");
    pw = player.width;
    ph = player.height;
    player.resize(0, 25);
    lives = 3;
  }

  void updatePlayer() {
    if (playerX < 0) playerX = 1;
    if (playerX > width-(pw/25)) playerX = width-(pw/25)-1;
    if (playerX > -1)
      if (keyPressed && keyCode == RIGHT) playerX += 5;
    if (playerX < width-(pw/25))
      if (keyPressed && keyCode == LEFT) playerX -= 5;
  }
  
  void display() {
    image(player, playerX, height-player.height);
  }
  


}
