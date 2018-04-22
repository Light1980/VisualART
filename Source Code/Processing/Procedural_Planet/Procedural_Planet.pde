Sky _init;
//PImage logo;

void setup() {
  //size(1360, 900);
  fullScreen();
  _init = new Sky();
  colorMode(HSB, 360, 100, 100, 255);
  //logo = loadImage("logo.png");
}

void draw() {
  _init.display();
  
  //int img_size = int(random(60,100));
  //image(logo,random(128,width-128),random(128,height/2), img_size,img_size);
  fill(255);
  textSize(30);
  text("Infinite Planets We fall in love", width/2+240, height - 80);
  textSize(20);
  text("vXv Studio", width/2+540, height - 30);
  noLoop();
}

void keyTyped() {
  _init = new Sky();
  loop();
}

void mouseClicked() {
  _init = new Sky();
  loop();
}
