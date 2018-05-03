// acceleration, force
class Mover1 {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover1() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 4;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   
  }
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }
  
  void checkEdges() {
    if (location.x < 0) {
      location.x = width;
    }  else if (location.x > width) {
      location.x = 0;
    }
    
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}
