// acceleration

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    topspeed = 4;
  }
  
  void update() {
      PVector mouse_location = new PVector(mouseX,mouseY);
      PVector dir = PVector.sub(mouse_location, location);
      dir.normalize();
      dir.mult(0.6);
      
      acceleration = dir;
      velocity.add(acceleration);
      velocity.limit(topspeed);
      
      location.add(velocity);
      
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
