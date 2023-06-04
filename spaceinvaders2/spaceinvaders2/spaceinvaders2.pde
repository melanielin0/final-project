alien wave3; 
player player1;
 
 void setup() {
    size(640, 720);
    wave3 = new alien();
    player1  = new player();
  }

  void draw() {
    background(0, 0, 0);
    player1.updatePlayer();
    player1.display();
    wave3.updateAlien1();
    wave3.display();
  }
  
