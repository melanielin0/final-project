class bullet {

  int bX, bY;
 

  bullet(int bX, int bY) {
    noStroke();
    fill(255);
    this.bX = bX;
    this.bY = bY;
  }
  
  
  void display() {
    rect(bX, bY, 5, 15);
  }
  
  
}
