class Clouds {

  ArrayList<PVector> x = new ArrayList<PVector>();
  
  Clouds (){
    int i = 100;
    for (int k = 0; k < i ; i++) {
     x.add(new PVector(random(width),random(height)));
    }
  }
  
  void move() {
  
  }
  void display () {
  
  }
  
  
}
