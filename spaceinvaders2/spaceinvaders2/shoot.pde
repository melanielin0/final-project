class shoot {

  PVector bullet = new PVector();
  
  void setup() {
   noStroke(); 
  }

  void setBullet(int bX, int bY) {
    this.bullet.x = (int) bX;
    this.bullet.y = (int) bY;
  }


  void b() {
    while (bullet.y > 0) {
    fill(0, 255, 0);
    rect(bullet.x, bullet.y, 15, 40);
    bullet.y -= 30;
    fill(0, 0, 255);
    rect(bullet.x, bullet.y, 15, 40);
    }
  }
  
}
