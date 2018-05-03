class As {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float angle;

  As() {
    location = new PVector(360, 100);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    angle = 0;
    mass = 10;
  }

  void applyForce(PVector f) {
    acceleration.add(f);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
  
  void update() {
    location.add(velocity);
  }
  
  void display() {

    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, mass, mass);
    popMatrix();
  }
  
  void checkEdges() {
    if (location.y > 370) {
      location.y = 370;
      velocity.mult(-1);
    }
  }
}
