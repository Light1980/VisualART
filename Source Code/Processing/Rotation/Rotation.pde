float z = -100;
float radius = 0;
float theta = 0;
float theta1 = 60;
float theta2 = 120;
float theta3 = 180;
float inc = 0.0;


void setup() {
  size(1080,720);
  frameRate(400);
  background(0);
  blendMode(ADD);
}

void draw() {
  lights();
  inc += 0.1;
  pushMatrix();
  translate(width/2,height/2);
  float x = radius * cos(theta);
  float y = radius * sin(theta);
  
  float x1 = radius * cos(theta1);
  float y1 = radius * sin(theta1);
  
  float x2 = radius * cos(theta2);
  float y2 = radius * sin(theta2);
  
  float x3 = radius * cos(theta3);
  float y3 = radius * sin(theta3);
  
  
  fill(255);
  ellipse(x,y,1,1);
  ellipse(x1,y1,1,1);
  fill(0,60,120,15);
  ellipse(x2,y2,5,5);
  ellipse(x3,y3,10,10);
  
  radius += .02;
  theta +=0.05;
  theta1 +=0.05;
  theta2 +=0.001;
  theta3 +=0.001;
  popMatrix();
}
