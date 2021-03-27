ArrayList<Ball> balls; // Global Balls
Rocket player; // Player
Enemy enemy;// Enemy
Ball temp;
ball_factory factory; // Ball factory
int devolutions;
int speedAccumulation;
int time = millis();
int score;
int lifes;
int x,y;
boolean gameOver;
PImage imgHeart;
PImage imgBrokenHeart;
PImage backgroundImage;

void setup(){
  backgroundImage = loadImage("bg_04.jpg"); // Or whatever your background is

fullScreen(); 

  player = new Rocket(80, (height/2)+30, 51.6, 73.8, 0.5, 24);
  balls = new ArrayList<Ball>();
  enemy=new Enemy(width-80, 100, 30, 100, 0.5, 24);
  devolutions = 0;
  speedAccumulation = 0;
  gameOver = false;
  factory = new ball_factory();
  lifes = 3;
  imgHeart =loadImage("vida.png");
  imgBrokenHeart =loadImage("muerte.png");
  imageMode(CENTER);
  textSize(40);
}

void draw(){
  int x = frameCount % backgroundImage.width;
  copy(backgroundImage, x, 0, backgroundImage.width, height, 0, 0, backgroundImage.width, height);
  int x2 = backgroundImage.width - x;
  if (x2 < width) {
    copy(backgroundImage, 0, 0, backgroundImage.width, height, x2, 0, backgroundImage.width, height);
  }
  
  
  if(gameOver) {
      clear();
      fill(160, 43, 171);
      text("___________________________",width/2-280,height/2-220); 
      fill(255, 255, 255);
      text("¡FIN DEL JUEGO!  ",width/2-160,height/2-110); 
      fill(115, 162, 255);
      text("Puntos obtenidos: " + score,width/2-250,height/2-20);
       fill(160, 43, 171);
      text("___________________________",width/2-280,height/1-450); 
  
  } else {
      if (millis() > time + 2000)
      {
        balls.add(factory.randomShoot(enemy.x, enemy.y));
        time = millis();
        score += 100;
      }
      for (int i = balls.size()-1; i >= 0; i--) { 
        // An ArrayList doesn't know what it is storing so we have to cast the object coming out
        Ball ball = balls.get(i);
        if(ball.move()) {
          balls.remove(i);
        }
        // change to actual game over when its time
        if(ball.collision(player.x, player.y, player.w, player.h)) {
          lifes--;
          if (lifes <= 0) gameOver = true; 
          balls.remove(i);
          displayLifes(3-lifes);
        }
        ball.display();
      }  
      player.move();
      player.display();
      enemy.moveEnemy();
      displayLifes(3-lifes);
      fill(255, 255, 255);
      text("Puntos: " + score,width/2-100,100); 
      fill(160, 43, 171);
      text("_________________",width/2-150,110); 
      
  }
}

void displayLifes(int brokenHearts) {
  for(int i=0; i<3;i++){
    if(brokenHearts > 0) {
      image(imgBrokenHeart,(width/2-15 + i*40),200,36,36);
      brokenHearts--;
    }
    else {
      image(imgHeart,(width/2-15 + i*40),200,50,50);
    }  
  }
}

void displayDie(){
  
}

void keyPressed() {
  if(keyCode == UP) {
    player.speedY = 0;
    if(player.y == 0) return; 
    if(player.y>player.h/2){
      if(player.speedY - 6 > -player.maxSpeed && player.y+player.h/2 > 0){
        player.speedY += -6;
      }
    }
  }
  if(keyCode == DOWN){
    if(player.y>player.h/2){
      if(player.speedY + 4 > 0){
        player.speedY -= -4;
      }
    }
  }
}

void keyReleased() {
   speedAccumulation = 0; 
}
 
