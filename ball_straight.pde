class Ball_Straight implements Ball{
  float x;
  float y;
  float speedX;
  float diameter;
  color c;
  
  // Constructor
  Ball_Straight(float tempX, float tempY, float tempDiameter, color tempC) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = -4;
    c = tempC;
  }
  
  boolean move() {
    // Add speed to location
    x = x + speedX;
    if (x <= 0) {
      return true;
    }    
    return false;
  }
  
  void display() {
    fill(c); //set the drawing color
    ellipse(x,y,diameter,diameter); //draw a circle
  }
  
  boolean collision(float p_x, float p_y, float w, float h) {
    return (p_x - w/2 <= x && p_x + w/2 >= x) && (p_y - h/2 <= y && p_y + h/2 >= y);
  }
  
  //helper functions
  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  
 float top() {
   return y-diameter/2;
 }
 float bottom() {
   return y+diameter/2; 
 }
}
