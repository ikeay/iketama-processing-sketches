Star[] stars = new Star[200];

Ground ground01;
Ground ground02;
Ground ground03;

Sky sky;

void setup(){
  size(600, 1000);
  background(0);
  
  colorMode(HSB, 360, 100, 100);
  noStroke();
  smooth();
  
  // Star
  for(int i = 0; i < stars.length; i++){
    float size = sqrt(random(0.1, 8));
    float twink = random(22, 48);
    stars[i] = new Star(size, twink);
  }
  
  // Sky
  sky = new Sky(height);
  
  // Ground
  int gndheight = height / 3;
  ground01 = new Ground(gndheight);
  ground02 = new Ground(gndheight);
  ground03 = new Ground(gndheight);
}

void draw(){  
  // Sky
  sky.display();
  
  // Star
  for(int i = 0; i < stars.length; i++){
    stars[i].update();
    stars[i].display();
  }
  
  // Ground
  ground01.display();
  ground02.display();
  ground03.display();
}

class Star{
  float x, y, size, twink, shine;
  Star(float _s, float _t){
    size = _s;
    twink = _t;
    x = random(0, width);
    y = random(0, height);
  }
  
  void update(){
    shine = (random(twink, 98)+random(twink, 98)+random(twink, 98)+random(twink, 98)+random(twink, 98)+random(twink, 98))/6;
  }
  
  void display(){
    fill(0, 0, shine);
    ellipse(x, y, size, size);
  }
}

class Sky{
  int skyheight;
  
  Sky(int _h){
    skyheight = _h + 15;  
  }
  
  void display(){
    for(int i = 0; i < skyheight; i++){
      float g = 60.0 / skyheight * i;
      stroke(220, 80, g);
      line(0, i, width, i);
    }
  }
  
}


class Ground{
  float[] peaks = new float[width];
  int gndheight;
  
  Ground(int _h){
    gndheight = height - _h;
    for(int i = 0; i < peaks.length; i++){
      peaks[i] = random(-10, 10);
    }
  }
  
  void display(){
    noStroke();
    fill(0, 0, 96, 150);
    beginShape(); 
    vertex(-1, height / 3 * 2);
    for(int i = 0; i < width; i += 110){
      curveVertex(i, gndheight + peaks[i]);
    }
    vertex(width, gndheight); 
    vertex(width, height);
    vertex(-1, height);
    endShape(CLOSE);   
  }
}
