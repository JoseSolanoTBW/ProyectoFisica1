class Rocket{
  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  float gravity = 0;
  float maxSpeed = 20;
  
  Rocket(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
  }
  
  Rocket(float tempX, float tempY, float tempW, float tempH, float grav, float max) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
    gravity = grav;
    maxSpeed = max;
  }

  void move(){
    if (y < height - h/2 && -speedY <= maxSpeed) {
      if(y > 0 + h/2){
        y += speedY;
        x += speedX;
        if(speedY + gravity <= maxSpeed) {
          speedY += gravity;
        }
      } else {
        if (speedY>0) {
          y += speedY;
        }
        speedY += gravity;
      }  
    } else {
      if(speedY < 0) {
        y += speedY;
      } else {
        speedY = 0; 
      }
    }
  }

  void display(){
    
     PImage img =loadImage("cohete2.png");
    imageMode(CENTER);
    image(img,x-w/2,y-h/2,w,h);
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
