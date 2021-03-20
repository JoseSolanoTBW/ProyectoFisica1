class Enemy{
  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  float gravity = 0;
  float maxSpeed = 20;
  
  Enemy(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
  }
  
  Enemy(float tempX, float tempY, float tempW, float tempH, float grav, float max) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 5;
    speedX = 5;
    c=(255);
    gravity = grav;
    maxSpeed = max;
  }
  
  //Movimiento automatico
  void moveEnemy()
{

      if (this.y<height) {
        this.y=this.y+1;
        
    }  else{
    this.y=100;
    }
 
  }
  void display(){
     PImage img =loadImage("enemy2.png");
    imageMode(CENTER);
    image(img,x,y,160,160);
  } 
  
  //helper functions
  float left(){
    return x-w/2;
  }
  float right(){
    return x+w/2;
  }
  float top(){
    return y-h/2;
  }
  float bottom(){
    return y+h/2;
  }
}
