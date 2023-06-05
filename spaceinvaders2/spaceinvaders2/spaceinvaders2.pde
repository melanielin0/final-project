alien wave; 
player player1;
pBullet playerBullet;
ArrayList<aBullet> alienBullets;
int curAB;
 
 void setup() {
    size(640, 720);
    wave = new alien();
    player1  = new player();
    playerBullet = new pBullet();
    alienBullets = new ArrayList<>();
    curAB = 0;
  }

  void draw() {
    background(0, 0, 0);
    player1.updatePlayer();
    player1.display();
    wave.updateAlien1();
    wave.display();
    playerBullet.display();
    if (playerBullet.bY > -100) playerBullet.updateBullet();
    if (frameCount%100 == 0) {
      alienBullets.add(new aBullet());
      curAB ++;
      alienBullets.get(curAB-1).setBullet((int)random(width), wave.alien1Y);
    }
    for (int i = 0; i < curAB; i++) {
      alienBullets.get(i).updateBullet();
       alienBullets.get(i).display();
    }
  }
  
  void keyPressed() {
   if (keyCode == 49 && playerBullet.bY < 0) {
     playerBullet.setBullet(player1.playerX+player1.pw/50-2, height-(2*player1.ph/25));
   }
   if (keyCode == 50) System.out.println(playerBullet.bY);
  }
  
  
  
  
