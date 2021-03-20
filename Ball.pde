interface Ball {
  float x = 50;
  float y = 50;
  float speedX = -2;
  float speedY = -2;
  float diameter = 2;
  
  boolean move();
  
  void display();
  
  boolean collision(float x, float y, float w, float h);
  
  //helper functions
  float left();
  float right();
  float top();
  float bottom();

}
