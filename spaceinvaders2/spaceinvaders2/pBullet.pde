class pBullet extends bullet {
  
  
  pBullet(int bX, int bY) {
   super(bX, bY); 
  }
  
  void updateBullet() {
   bY -= 20; 
  }
  

}
