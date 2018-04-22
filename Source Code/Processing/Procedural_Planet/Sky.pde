class Sky {
  int time;
  color bg_color;
  color lerp_color_1;
  color lerp_color_2;
  ArrayList<PVector> stars= new ArrayList<PVector>();
  Planet planet;
  Hills hill;
  Earth earth;
  //ArrayList<Planes> planes = new ArrayList<Planes>();

  Sky () {
    time = int(random(2));
    planet = new Planet(time);
    hill = new Hills();
    earth = new Earth();
    
    // bg_color
    // night
    if (time == 0) {
      lerp_color_1 = color(random(250), 90, 20);
      lerp_color_2 = color(random(150), 50, 10);
      float inter = random(1);
      bg_color = lerpColor(lerp_color_1, lerp_color_2, inter);
    } 
    // day
    else if (time == 1){
      lerp_color_1 = color(random(0, 150), 90, 100);
      lerp_color_2 = color(random(100, 350), 50, 100);
      //println(lerp_color_1,lerp_color_2);
      float inter = random(1);
      bg_color = lerpColor(lerp_color_1, lerp_color_2, inter);
    }
    
    // night-stars
    if (time == 0) {
      int stars_num = 200;
      for (int i = 0;i < stars_num;i++) {
        stars.add(new PVector(random(width),random(height/1.5)));
      }
    } 
  }
  
  void display() {
    // Bg_color
    background(bg_color);
    
    // stars
    for(int i = 0;i<stars.size();i++) {
      float star_radius = random(3,5);
      fill(random(200,255));
      noStroke();
      ellipse(stars.get(i).x, stars.get(i).y,star_radius, star_radius);
    }
    
    // planet
    planet.display();
    
    // hills
    hill.display();
    
    // earth
    earth.display();
    
    //planes
    int planes_existed = int(random(3));
    //int planes_existed = 1;
    if (planes_existed == 1) {
      int planes_num = int(random(1,6));
      
      for (int i=0;i<planes_num;i++) {
        Planes plane = new Planes(width, height);
        plane.display();
      }
    }
  }
}
