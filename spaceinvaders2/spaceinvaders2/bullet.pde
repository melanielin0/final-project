class bullet {

  int bX, bY;
 

  bullet() {
    noStroke();
    fill(255);
  }
  
  void setBullet(int bX, int bY) {
    this.bX = bX;
    this.bY = bY;
  }
  
  void display() {
    rect(bX, bY, 5, 15);
  }
  
  
}
