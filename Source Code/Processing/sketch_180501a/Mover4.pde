// dragForce

class Mover4 {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;

  Mover4(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 4;
    mass = m;
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
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  void checkEdges() {
    if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    } else if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    }

    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    } 
  }

  boolean isInside (Liquid l) {
    if (location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h)
    {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid l) {
    float speed = velocity.mag();
    float dragMag = l.c * speed * speed;
    
    PVector drag = velocity.get();
    drag.normalize().mult(-1).mult(dragMag);
    
    applyForce(drag);
  }
} 

/*
Mover4[] movers = new Mover4[10];

Liquid liquid;
 
void setup() {
  size(360, 640);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover4(random(0.1,5),random(width),random(height/2));
  }
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}
 
void draw() {
  background(255);
 
  liquid.display();
 
  for (int i = 0; i < movers.length; i++) {
 
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }
 
    float m = 0.1*movers[i].mass;
    PVector gravity = new PVector(0, m);
    movers[i].applyForce(gravity);
 
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
*/
