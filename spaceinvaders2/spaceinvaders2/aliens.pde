class alien {

  public int alien1Y;
  public int alien1X;
  public int alienY;
  public int alienX;
  PImage alien1;


  alien(int alienX, int alien1Y) {
    alien1 = loadImage("alien1.png");
    alien1.resize(0, 25);
    this.alien1Y = alien1Y;
    this.alienX = alienX;
    
  }
 
 void display(int alienX, int alienY) {
   //for (int i = 0; i < 3; i++) {
   //   for (int j = 0; j <= width/(alien1.width); j++)
   //     image(alien1, (alien1.width+33)*j, alien1Y+(alien1.height+10)*i);
   // }
   image(alien1, alienX, alienY);
 }

  void updateAlien1() {
    if (frameCount%120 == 0) alien1Y+=20;
  }
}
