// acceleration, force, mass, friction
class Mover3 {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;
  
  Mover3() {
    location = new PVector(320, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 4;
    mass = 1;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get().div(mass);
    acceleration.add(f);
  }
  
  void update() {
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   
  }
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,mass*16,mass*16);
  }
  
  void checkEdges() {
    if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }  else if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    }
    
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }  else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
}

/*
Mover3 mover = new Mover3();

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  background(255);
  PVector gravity = new PVector(0,1);
  
  float c = 0.01;
  PVector friction = mover.velocity.get();
  friction.mult(-1);
  friction.normalize();
  friction.mult(c);
  
  mover.applyForce(friction);
  mover.applyForce(gravity);
  
  mover.display();
  mover.update();
  mover.checkEdges();
  

}
*/
