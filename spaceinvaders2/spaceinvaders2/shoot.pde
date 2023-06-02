class shoot {

  int bX, bY;
  ArrayList<PVector> bPos = new ArrayList<PVector>();
  PVector pos = new PVector();

  void setBullet(int bX, int bY) {
    this.bX = bX;
    this.bY = bY;
    pos = new PVector(bX, bY);
    noStroke();
    fill(0, 0, 255);
  }


  void draw() {
    background(0, 0, 0);
    drawBullet();
    if (frameCount%20 == 0) updateBullet();
  }

  void drawBullet() {
    rect(pos.x, pos.y, 5, 15);
    for (int i = 0; i < bPos.size(); i++)
      rect(bPos.get(i).x, bPos.get(i).y, 5, 15);
  }

  void updateBullet() {
    bPos.add(new PVector(pos.x, pos.y));
    pos.y -= 20;
  }
}
