class Hills {
  int on = 1;
  
  ArrayList<PVector> x1 = new ArrayList<PVector>();
  ArrayList<PVector> x2 = new ArrayList<PVector>();
  
  int tower;
  int tower_num;
  ArrayList<Towers> towers = new ArrayList<Towers>();
  
  

  Hills () {
    //xoff_1 = 0.0;
    //xoff_2 = 0.05;
  }

  void display () {
    noiseSeed(int(random(1221)));
    float xoff_1 = 0.0;
    float xoff_2 = 0.05;
    if (on == 1) {
      pushMatrix();
      translate(0, height/2-50);
      for (int i = 0; i<width; i++) {
        //ellipse(i, noise(xoff_1)*300, 1, 1);
        xoff_1 += 0.01;
        PVector n = new PVector(i, noise(xoff_1)*350);
        x1.add(n);
        
        //ellipse(i, noise(xoff_2)*350, 1, 1);
        xoff_2 = xoff_1 + 0.05;
        PVector h = new PVector(i, noise(xoff_2)*400);
        x2.add(h);
        
      }
      
      noStroke();
      
      
      // Hill x1
      fill(255,150);
      beginShape();
      vertex(0,height);
      for(int i=0;i<x1.size();i++) {
        vertex(x1.get(i).x,x1.get(i).y);
      }
      vertex(width,height);
      endShape();
      
      // Hill x2
      fill(random(360),50,30);
      beginShape();
      vertex(0,height);
      for(int i=0;i<x2.size();i++) {
        vertex(x2.get(i).x,x2.get(i).y);
      }
      vertex(width,height);
      endShape();
      
      
      popMatrix();
    }
    
    
  }
}

class Towers {
  PVector location;
  
}
