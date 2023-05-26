public int bulletX, bulletY;

void setup() {
 size(720, 840);
}

void draw() {
 background(0, 0, 0);
 spawnPlayer();
 updatePlayer();
 spawnAlien1();
 updateAlien1();
}


 //void shoot() {
 // bulletX = playerX + pw/2 - 8;
 // bulletY = playerY+height-2*ph;
 // fill (0, 0, 255);
 // rect(bulletX, bulletY, 15, 40);
  
 //}
 

  
 
