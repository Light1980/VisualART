As as = new As();
PVector G;
void setup() {
  size(720,480);
  background(255);
  fill(0);
  G = new PVector(0, 1);
  line(0,370,width,370);

}

void draw() {
  background(255);
  as.applyForce(G);
  as.update();
  as.checkEdges();
  as.display();


}

void keyPressed() {
  if (key == 'd') {
      as.angle += 0.1;
      println(as.angle);
  }
  
  if (key == 'a') {
      as.angle -= 0.1;
      println(as.angle);
  }
}
