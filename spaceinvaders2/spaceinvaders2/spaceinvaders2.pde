alien[][] wave;
player player1;
pBullet playerBullet;
ArrayList<aBullet> alienBullets;
int curAB;
int autoOver = 0;
int score = 0;
int initSpeed = 120;
int newSpeed = 120;
String difficulty = "easy";
int urgency = 60;

void setup() {
  size(640, 720);
  player1  = new player();
  playerBullet = new pBullet(-100, -100);
  alienBullets = new ArrayList<>();
  curAB = 0;
  wave = new alien[3][13];
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 11; j++)
      wave[i][j] = new alien(j*50+50, i*50, "right");

  fill(255, 255, 255);
  PFont lives = createFont("space_invaders.ttf", 24);
  textFont(lives);
  PFont score = createFont("space_invaders.ttf", 24);
  textFont(score);
}

void draw() {
  background(0, 0, 0);
  player1.updatePlayer();
  player1.display();
  playerBullet.display();
  text("Lives:  " + player1.lives, 500, 60);
  text("Score:  " + score, 20, 60);
  text("Difficulty: " + difficulty, 200, 60);

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 11; j++)
      if (wave[i][j].alien1Y == 580) autoOver = 1;

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 11; j++)
      if (wave[i][j].alien1X  >  playerBullet.bX - 40   &&
        wave[i][j].alien1X  < playerBullet.bX + 10  &&
        wave[i][j].alien1Y + 100 > playerBullet.bY - 10  &&
        wave[i][j].alien1Y + 100< playerBullet.bY + 10)
      {
        wave[i][j].alien1Y = -1000;
        playerBullet.bY = -1000;
        score += 10;
      }

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 11; j++)
      wave[i][j].display( wave[i][j].alien1Y+100, urgency);


  for (int i = 0; i < 3; i++)
    for (int j = 0; j< 11; j++)
      wave[i][j].updateAlien1(newSpeed);

  if (score > 380) {
    newSpeed = initSpeed/40;
    urgency = 20;
  } else if (score > 370) {
    newSpeed = initSpeed/30;
    urgency = 25;
  } else if (score > 360) {
    newSpeed = initSpeed/24;
    urgency = 30;
  } else if (score > 300) {
    newSpeed = initSpeed/12;
    urgency = 35;
  } else if (score > 240) {
    newSpeed = initSpeed/6;
    urgency = 40;
  } else if (score > 180) {
    newSpeed = initSpeed/4;
    urgency = 45;
  } else if (score > 120) {
    newSpeed = initSpeed/3;
    urgency = 50;
  } else if (score > 60) {
    newSpeed = initSpeed/2;
    urgency = 55;
  } else if (score <= 60) {
    newSpeed = initSpeed;
    urgency = 60;
  }

  if (difficulty.equals("medium")) initSpeed = 90;
  if (difficulty.equals("hard")) initSpeed = 60;


  if (playerBullet.bY > -100) playerBullet.updateBullet();
  int randX = (int)random(3);
  int randY = (int)random(11);
  if (wave[randX][randY].alien1Y > 0 && frameCount%60 == 0) {
    alienBullets.add(new aBullet(wave[randX][randY].alien1X, wave[randX][randY].alien1Y+100 ));
    curAB ++;
  }


  for (int i = 0; i < curAB; i++) {
    alienBullets.get(i).updateBullet();
    alienBullets.get(i).display();
    if ((alienBullets.get(i).bX > player1.playerX - 10 && alienBullets.get(i).bX < player1.playerX + 20) && alienBullets.get(i).bY == 680) {
      player1.lives --;
      alienBullets.set(i, new aBullet(0, 0));
    }
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 11; j++) {
      if (wave[i][j].alien1X > width - 40 && wave[i][j].alien1Y > 0) {
        for (int o = 0; o < 3; o++) for (int p = 0; p < 11; p++) {
          wave[o][p].dir = "left";
          wave[o][p].alien1X -= 10;
          wave[o][p].alien1Y += 20;
        }
      } else if (wave[i][j].alien1X < 0 && wave[i][j].alien1Y > 0) {
        for (int o = 0; o < 3; o++) for (int p = 0; p < 11; p++) {
          wave[o][p].dir = "right";
          wave[o][p].alien1X += 10;
          wave[o][p].alien1Y += 20;
        }
      }
    }
  }

  if (player1.lives == 0 || autoOver == 1) {
    background(0, 0, 0);
    PImage bigged = loadImage("alien1.png");
    bigged.resize(0, 200);
    image(bigged, 180, 360);
    fill(255, 0, 0);
    textSize(96);
    PFont spacefont = createFont("space_invaders.ttf", 96);
    textFont(spacefont);
    text("GAME OVER", 24, 140);
    textSize(48);
    text("Score: " + score, 24, 300);
    stop();
  }

  if (score == 330) {
    background(0, 0, 0);
    fill(0, 255, 0);
    textSize(96);
    PFont win = createFont("space_invaders.ttf", 96);
    textFont(win);
    text("GAME WON", 60, 360);
    text("!  !  !", 240, 480);
    stop();
  }
}

void keyPressed() {
  if (keyCode == 49 && playerBullet.bY < 0) {
    playerBullet.bX = player1.playerX+player1.pw/50-2;
    playerBullet.bY = height-(2*player1.ph/25);
  }
  if (keyCode == 50) difficulty = "easy";
  if (keyCode == 51) difficulty = "medium";
  if (keyCode == 52) difficulty = "hard";
}
