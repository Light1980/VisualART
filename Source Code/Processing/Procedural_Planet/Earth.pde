class Earth {
  int on = 1;

  ArrayList<PVector> x1 = new ArrayList<PVector>();
  ArrayList<PVector> x2 = new ArrayList<PVector>();
  ArrayList<PVector> x3 = new ArrayList<PVector>();
  ArrayList<PVector> river_l = new ArrayList<PVector>();
  ArrayList<PVector> river_r = new ArrayList<PVector>();




  Earth () {
    //xoff_1 = 0.0;
    //xoff_2 = 0.05;
  }

  void display () {
    noiseSeed(int(random(1221)));
    float xoff_1 = 0.0;
    float xoff_2 = 0.0;
    float xoff_3 = 0.0;
    if (on == 1) {
      pushMatrix();
      translate(0, height/2+200);
      for (int i = 0; i<width; i++) {
        //ellipse(i, noise(xoff_1)*300, 1, 1);
        xoff_1 += 0.001;
        PVector n = new PVector(i, noise(xoff_1)*200);
        x1.add(n);

        xoff_2 = xoff_1 + 0.002;
        PVector j = new PVector(i, noise(xoff_2)*300);
        x2.add(j);

        xoff_3 = xoff_2 + 0.002;
        PVector k = new PVector(i, noise(xoff_2)*400);
        x3.add(k);
      }




      // Earth surface
      noStroke();
      color earth_color= color(random(360), 80, 80);
      fill(lerpColor(earth_color, color(255), 0.1));
      beginShape();
      vertex(0, height);
      for (int i=0; i<x1.size(); i++) {
        vertex(x1.get(i).x, x1.get(i).y);
      }
      vertex(width, height);
      endShape();

      fill(lerpColor(earth_color, color(255), 0.15));
      beginShape();
      vertex(0, height);
      for (int i=0; i<x2.size(); i++) {
        vertex(x2.get(i).x, x2.get(i).y);
      }
      vertex(width, height);
      endShape();

      fill(lerpColor(earth_color, color(255), 0.2));
      beginShape();
      vertex(0, height);
      for (int i=0; i<x3.size(); i++) {
        vertex(x3.get(i).x, x3.get(i).y);
      }
      vertex(width, height);
      endShape();




      // Probability of the river

      int river_pro = int(random(3));
      if (river_pro == 0 ) {
        // River surface
        int x_edge_1 = int(random(200, 800));
        int x_edge_2 = x_edge_1+int(random(75, 125));

        float yoff = 0.0;
        //river_l.add(new PVector(x_edge_1,x1.get(x_edge_1).y));
        for (float i = x1.get(x_edge_1).y+1; i<height; i++) {
          fill(0);
          //ellipse(x_edge_1+ noise(yoff)*100,i,1,1);
          river_l.add(new PVector(x_edge_1+ noise(yoff)*50, i));
          yoff += 0.03;
        }

        float yofff = 0.0;
        //river_r.add(new PVector(x_edge_2,x1.get(x_edge_2).y));
        for (float i = x1.get(x_edge_2).y+1; i<height; i++) {
          fill(0);
          //ellipse(x_edge_2+ noise(yofff)*100,i,1,1);
          river_r.add(new PVector(x_edge_2+ noise(yofff)*50, i));
          yofff += 0.03;
        }

        fill(lerpColor(earth_color, color(random(0, 240), 40, 30), 0.4));
        beginShape();
        for (int i=x_edge_1+10; i<=x_edge_2; i++) {
          vertex(x1.get(i).x, x1.get(i).y);
        }
        for (int i=0; i<river_r.size(); i++) {
          vertex(river_r.get(i).x, river_r.get(i).y);
        }
        for (int i=river_l.size()-1; i>-1; i--) {
          vertex(river_l.get(i).x, river_l.get(i).y);
        }
        endShape();
      }
      popMatrix();
    }
  }

  //on = 0;
}
