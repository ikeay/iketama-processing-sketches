Mover[] mover;
Liquid liquid;

void setup() {
  size(500, 500);
  background(255);
  liquid = new Liquid(0, 200, 500, 100, 0.5);
  mover = new Mover[30];
  for (int i=0; i<30; i++) {
    mover[i] = new Mover(new PVector(500, 500), random(2, 5));
  }
}

void draw() {
  //liquid.display();
  fill(240, 50);
  rect(-20, -20, 550, 550);
  for (int i=0; i<30; i++) {
    mover[i].apply(new PVector(0, 0.1 * mover[i].mass));
    if (liquid.contains(mover[i].location)) {
      PVector drag = liquid.drag(mover[i].velocity);
      mover[i].apply(drag);
    }
    mover[i].update();
    mover[i].display();
  }
}

class Liquid {
  float x,y,w,h;
  float c;
  Liquid(float _x, float _y, float _w, float _h, float _c) {
    x = _x; y = _y; w = _w; h = _h; c = _c;
  }
  void display() {
    noStroke();
    fill(175);
    rect(x,y,w,h);
  }
  boolean contains(PVector v) {
    return v.x > x && v.y > y && v.x < x + w && v.y < y + h;
  }
  PVector drag(PVector velocity) {
    float speed = velocity.mag();
    float magnitude = c * speed * speed;
    PVector dragForce = velocity.copy();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(magnitude);
    return dragForce;
  }
}

class Mover {
  PVector world;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float h,s;
  
  Mover(PVector _w, float _m) {
    world    = _w.copy();
    location = new PVector(random(20, _w.x - 20), random(10, 40));
    velocity = new PVector(0, 0);
    acceleration = velocity.copy();
    mass = _m;
    h = random(50, 200);
    s = random(0, 200);
  }
  
  void apply(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    _edges();
  }

  void display() {
    fill(h, s, 255);
    noStroke();
    ellipse(location.x, location.y, mass * 4, mass * 4);
  }
  
  void _edges() {
    //if (location.x > world.x + 20 || location.x < -20) {
    //  velocity.x *= -1;
    //  location.x = (location.x > world.x + 20) ? world.x + 20 : -20;
    //}
    //if (location.y > world.y + 20) {
    //  velocity.y *= -1;
    //  location.y = world.y + 20;
    //}
    if (location.x > world.x + 20) {
      location.x = -20;
    }
    if (location.y > world.y + 20) {
      location.y = -20;
    }
  }
}