Star[] stars = new Star[200];

Ground ground01;
Ground ground02;
Ground ground03;

Sky sky;

Footprint[] footprints = new Footprint[3];
Snow[] snows = new Snow[500];
float t;

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
  
  PVector world = new PVector(600, 1000);
  // Footprint
  for (int i=0; i<3; i++) {
    footprints[i] = new Footprint(world);
  }
  // Snow
  for (int i=0; i<300; i++) {
    snows[i] = new Snow(world);
  }
  t = 0;
  frameRate(10);
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
  
  // Snow
  PVector wind = new PVector(random(-0.05 * noise(t), noise(t) * 0.05), random(0, 0.01));
  for (int i=0; i<300; i++) {
    snows[i].apply(wind);
    snows[i].update();
    snows[i].display();
  }
  t += 0.01;
  
  // Footprint
  for (int i=0; i<1; i++) {
   footprints[i].display();
  }
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

class Footprint {
  float xt, yt, x, y, offset, w, h;
  PVector world;
  boolean stepFlag;
  int counter, counterLimit, frame;
  PVector[] histories = new PVector[8];
  PVector history;
  
  Footprint(PVector w) {
    world = w.copy();
    stepFlag = false;
    init();
  }
  
  void init() {
    offset = random(30);
    xt = yt = offset;
    x = random(5, world.x - 50);
    y = world.y - 30; 
    counter = int(random(0, 8));
    counterLimit = int(random(10, 30));
    w = random(10, 15);
    h = random(25, 35);
    for (int i=0; i<8; i++) {
      histories[i] = new PVector(0, 0);
    }
    history = new PVector(0, 0);
    frame = 0;
  }
  
  void display() {
    if (frame > int(random(10))) {
      frame = 0;
      float xDiff = 0;
      float yDiff = 0;
      //if (disideX < 50) {
        xDiff = noise(xt);
        x += map(xDiff, 0, 1, -30, 7);
      //}
      //if (disideY < 50) {
        yDiff = noise(yt);
        y += map(yDiff, 0, 1, -26, 2);
        y -= 5;
      //}
      if (stepFlag) {
        x += w * 1.7;
      }
      float opacByCount = map(counter, 0, counterLimit, 1, 0);
      fill(80, 255 * opacByCount);
      ellipse(x, y, w, h);
      for (int i=0; i<8; i++) {
        float opac = map(i, 0, 7, 200 * opacByCount, 0);
        fill(80, opac);
        ellipse(histories[i].x, histories[i].y, w, h);
      }
      
      //if (!stepFlag) {
        for (int i=7; i>0; i--) {
          histories[i] = histories[i-1].copy();
        }
        histories[0] = new PVector(x, y);
      //}
      xt += 0.01;
      yt += 0.03;
      stepFlag = (stepFlag) ? false : true;
      counter++;
      if (counter > counterLimit) {
        init();
      }
    }
    else {
      float opacByCount = map(counter, 0, counterLimit, 1, 0);
      fill(80, 255 * opacByCount);
      ellipse(x, y, w, h);
      for (int i=0; i<8; i++) {
        float opac = map(i, 0, 7, 200 * opacByCount, 0);
        fill(80, opac);
        ellipse(histories[i].x, histories[i].y, w, h);
      }
    }
    frame++;
  }
}

class Snow {
  PVector world;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Snow(PVector w) {
    mass = random(0.2, 1.0);
    location = new PVector(random(20, w.x - 20), random(-20, 500));
    world = w.copy();
    velocity = new PVector(0, 0);
    acceleration = velocity.copy();
  }
  
  void addGravity() {
    PVector gravity = new PVector(0, 0.05 * mass);
    apply(gravity);
  }
  
  void addFriction() {
    PVector friction = velocity.copy();
    friction.normalize();
    friction.mult(-1 * 0.04 * mass);
    apply(friction);
  }
  
  void apply(PVector force) {
    force.add(new PVector(random(-0.01, 0.01), random(-0.01, 0.01)));
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update() {
    addGravity();
    addFriction();
    _edges();
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    float opac = map(location.y, 0, world.y, 255, 0);
    fill(255, 0, 255, opac);
    ellipse(location.x, location.y, mass * 6, mass * 6);
  }
  
  void _edges() {
    if (location.x > world.x + 20) {
      location.x = -20;
    }
    if (location.x < -20) {
      location.x = world.x + 20;
    }
    if (location.y > world.y + 20) {
      location.y = -50;
      velocity.y = random(0, 10);
    }
  }
}