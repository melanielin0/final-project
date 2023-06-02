class spaceinvader2 {

  void setup() {
    size(640, 720);
    alien wave3 = new alien();
  }

  void draw() {
    background(0, 0, 0);
    spawnPlayer();
    updatePlayer();
    spawnAlien1();
    updateAlien1();
  }
  
}
