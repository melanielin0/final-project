class alien {

  public int alien1Y;
  public int alien1X;
  public int alienY;
  public int alienX;
  public String dir;
  PImage alien1, alien2;


  alien(int alien1X, int alien1Y, String dir) {
    alien1 = loadImage("alien1.png");
    alien2 = loadImage("alien2.png");
    alien1.resize(0, 25);
    alien2.resize(0, 25);
    this.alien1Y = alien1Y;
    this.alien1X = alien1X;
    this.dir = dir;
  }
 
 void display(int alienY, int urgency) {
   if (frameCount%urgency > 0 && frameCount %urgency < urgency/2) image(alien1, alien1X, alienY);
   else image(alien2, alien1X, alienY);
 }

  void updateAlien1(int speed) {
    if (frameCount%speed == 0 && dir.equals("right")) alien1X += 20;
    else if (frameCount %speed == 0 && dir.equals("left")) alien1X -= 20;
  }
}
