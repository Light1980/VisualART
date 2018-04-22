class Planet {
  PVector location;
  int size;
  int time;

  int ring;
  float ring_radius_1;
  float ring_radius_2;
  float ring_radius_3;
  color ring_color_1;
  color ring_color_2;
  color ring_color_3;

  int halo;
  float halo_radius;
  color halo_color;

  ArrayList<Dot> dots = new ArrayList<Dot>();
  float xoff = 0.0;

  Planet (int time) {
    location = new PVector(random(100, width-100), random(height/3+100));
    size = int(random(50, 800));

    ring = int(random(2));
    //ring = 0;
    if (ring == 1) {
      ring_radius_1 = random(5, 7);
      ring_color_1 = color(100, random(70));

      ring_radius_2 = random(10, 12);
      ring_color_2 = color(150, random(50));

      ring_radius_3 = random(15, 20);
      ring_color_3 = color(200, random(30));
    }

    /*halo = int(random(2));
     halo = 1;
     if (halo == 1) {
     halo_radius = random(10,15);
     halo_color = color(random(255));
     }*/

    if (time == 0) {
      for (int x=0; x<width; x++) {
        float yoff = 0.0;
        for (int y=0; y<height; y++) {
          if (dist(x, y, location.x, location.y) < size/2) {
            Dot dot = new Dot(x, y);
            dot.mag = int(map(noise(xoff, yoff), 0, 1, 0, 255));
            dots.add(dot);
            yoff += 0.05;
          }
        }
        xoff += 0.05;
      }
    } else if (time == 1) {
      for (int x=0; x<width; x++) {
        float yoff = 0.0;
        for (int y=0; y<height; y++) {
          if (dist(x, y, location.x, location.y) < size/2) {
            Dot dot = new Dot(x, y);
            dot.mag = int(map(noise(xoff, yoff), 0, 1, 150, 255));
            dots.add(dot);
            yoff += 0.04;
          }
        }
        xoff += 0.04;
      }
    }
  }

  void display() {
    noFill();
    noStroke();

    if (ring == 1) {
      fill(ring_color_3);
      ellipse(location.x, location.y, size+ring_radius_3, size+ring_radius_3);
      fill(ring_color_2);
      ellipse(location.x, location.y, size+ring_radius_2, size+ring_radius_2);
      fill(ring_color_1);
      ellipse(location.x, location.y, size+ring_radius_1, size+ring_radius_1);
    }

    // 覆盖星星
    fill(255);
    ellipse(location.x, location.y, size, size);
    
    // Planet Surface
    float color_ran= random(100,360);
    for (int i=0; i<dots.size(); i++) {
      fill(map(dots.get(i).mag,200,255,color_ran-10,color_ran),80,100);
      ellipse(dots.get(i).location.x, dots.get(i).location.y, 1, 1);
      
    }
  }
}

class Dot {
  PVector location;
  int mag;
  float xoff;

  Dot(int x, int y) {
    location = new PVector(x, y);
  }
}
