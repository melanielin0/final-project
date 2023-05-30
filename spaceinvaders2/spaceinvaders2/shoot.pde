class shoot {

  int bX, bY;

  void setBullet(int bX, int bY) {
    this.bX = bX;
    this.bY = bY;
  }

  void draw() {
    noStroke();
      fill(0, 0, 255);
      rect(this.bX, this.bY, 15, 40);
      if (frameCount%20 == 0) updateBullet();
  }
  
  void updateBullet() {
   bY -= 20;
  }
}
