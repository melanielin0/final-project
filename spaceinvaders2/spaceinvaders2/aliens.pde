class alien {

  public int alien1Y;
  PImage alien1;


  alien() {
    alien1 = loadImage("alien1.png");
    alien1.resize(0, 25);
  }
 
 void display() {
   for (int i = 0; i < 3; i++) {
      for (int j = 0; j <= width/(alien1.width); j++)
        image(alien1, (alien1.width+33)*j, alien1Y+(alien1.height+10)*i);
    }
 }

  void updateAlien1() {
    if (frameCount%60 == 0) alien1Y+=10;
  }
}
