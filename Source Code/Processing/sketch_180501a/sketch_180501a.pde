Mover4[] movers = new Mover4[10];

Liquid liquid;
 
void setup() {
  size(360, 640);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover4(random(0.1,5),random(width),random(height/2));
  }
  liquid = new Liquid(0, height/2, width, height/2, 0.15);
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
