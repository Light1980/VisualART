class Planes {
  PVector location;
  int mode;
  int vertical = 0;
  int horizontal = 1;

  int vertical_rect_width = 5;
  int vertical_rect_height = 150;

  int horizontal_rect_width = 160;
  int horizontal_rect_height = 8;

  color plane_color = color(random(360), random(100), random(100));

  Planes(float limit_x, float limit_y) {
    location = new PVector(random(100,limit_x), random(100,limit_y/2));

    mode = int(random(2));
    //mode = 1;
  }

  void display() {
    if (mode == vertical) {
      fill(0);
      stroke(255,120);
      beginShape();
      vertex(location.x, location.y);
      vertex(location.x-15, location.y+30);
      vertex(location.x+15, location.y+30);
      endShape();
      //机舱
      fill(140);
      ellipse(location.x, location.y +20, 10, 10);

      //rect(location.x-15, location.y+30, vertical_rect_width, vertical_rect_height);

      // 尾焰
      for (int i=int(location.y)+30; i<location.y+30+vertical_rect_height; i++) {
        stroke(plane_color, map(i, (location.y)+30+1, location.y+30+vertical_rect_height, 255, 0));
        line(location.x-15, i, location.x-15+vertical_rect_width, i);
        line(location.x+10, i, location.x+10+vertical_rect_width, i);
      }

      //rect(location.x+10, location.y+30, vertical_rect_width, vertical_rect_height);
    }

    if (mode==horizontal) {



      fill(0);
      stroke(255,120);
      beginShape();
      vertex(location.x, location.y+20);
      vertex(location.x+10, location.y-10);
      vertex(location.x+40, location.y-10);
      vertex(location.x+50, location.y-20);
      vertex(location.x+55, location.y-20);
      vertex(location.x+55, location.y+10);
      vertex(location.x+40, location.y+10);
      endShape();

      //机舱
      fill(255);
      rect(location.x+10, location.y-10, 10, 10);

      //rect(location.x-15, location.y+30, vertical_rect_width, vertical_rect_height);

      // 尾焰
      for (int i=int(location.x)+55; i<location.x+55+horizontal_rect_width; i++) {
        stroke(plane_color, map(i, (location.x)+55, location.x+55+horizontal_rect_width, 255, 0));
        line(i, (location.y)+10, i, (location.y)+10-horizontal_rect_height-1);
      }

      //rect(location.x+10, location.y+30, vertical_rect_width, vertical_rect_height);
    }
  }
}
