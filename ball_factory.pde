class ball_factory {
  
  ball_factory() {
  }
  
  public Ball randomShoot(float tempX, float tempY) {
    float r = random(3);
    switch((int)r) {
      case 0:  return new Ball_Straight(tempX, tempY, 15, color(255,0,25));
      case 2: return new Ball_Ballistic(tempX, tempY, 15, color(255,0,25));
        
      default: return new Ball_Straight(tempX, tempY, 15, color(255,0,25));
    }
  }
}
