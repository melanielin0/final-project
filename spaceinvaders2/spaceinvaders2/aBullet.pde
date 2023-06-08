class aBullet extends bullet {
  
  aBullet(int bX, int bY) {
   super(bX, bY); 
  }
  
  void updateBullet() {
   bY += 5; 
  }
  
}
