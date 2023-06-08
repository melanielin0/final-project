alien[][] wave;
player player1;
pBullet playerBullet;
ArrayList<aBullet> alienBullets;
int curAB;
int autoOver = 0;

void setup() {
  size(640, 720);
  player1  = new player();
  playerBullet = new pBullet(0, 0);
  alienBullets = new ArrayList<>();
  curAB = 0;
  wave = new alien[3][13];
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 13; j++)
      wave[i][j] = new alien(j*50, i*50);
      
  fill(255, 255, 255);
  PFont lives = createFont("space_invaders.ttf", 24);
  textFont(lives);
}

void draw() {
  background(0, 0, 0);
  player1.updatePlayer();
  player1.display();
  playerBullet.display();
  text("Lives:  " + player1.lives, 500, 60);

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 13; j++)
      wave[i][j].display(j*50, wave[i][j].alien1Y+100);


  for (int i = 0; i < 3; i++)
    for (int j = 0; j< 13; j++)
      wave[i][j].updateAlien1();

  if (playerBullet.bY > -100) playerBullet.updateBullet();

  if (frameCount%100 == 0) {
    alienBullets.add(new aBullet((int)random(width), wave[(int)random(3)][(int)random(13)].alien1Y ));
    curAB ++;
  }

  for (int i = 0; i < curAB; i++) {
    alienBullets.get(i).updateBullet();
    alienBullets.get(i).display();
    if (keyCode == 51) System.out.println(alienBullets.get(i).bY);
    if ((alienBullets.get(i).bX > player1.playerX - 10 && alienBullets.get(i).bX < player1.playerX + 20) && alienBullets.get(i).bY == 680) {
      player1.lives --;
      alienBullets.set(i, new aBullet(0, 0));
      System.out.println("Lives left: " + player1.lives);
    }
  }

  if (player1.lives == 0) {
    background(0, 0, 0);
    PImage bigged = loadImage("alien1.png");
    bigged.resize(0, 200);
    image(bigged, 180, 360);
    fill(255, 0, 0);
    textSize(96);
    PFont spacefont = createFont("space_invaders.ttf", 96);
    textFont(spacefont);
    text("GAME OVER", 24, 140);
    stop();
  }
}

void keyPressed() {
  if (keyCode == 49 && playerBullet.bY < 0) {
    playerBullet.bX = player1.playerX+player1.pw/50-2;
    playerBullet.bY = height-(2*player1.ph/25);
  }
  if (keyCode == 50) System.out.println(player1.lives);
}
