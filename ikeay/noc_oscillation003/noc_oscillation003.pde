Mover[] mover = new Mover[10];

void setup(){
  background(255);
  size(500, 500);
  noStroke();
  for(int i = 0; i < 10; i++){
    mover[i] = new Mover(int(random(1, 4)), random(-2, 2), random(-2, 2));
  }
}

void draw(){
  background(255);
  for(int i = 0; i < 10; i++){
    mover[i].update();
    mover[i].display();
    mover[i].checkEdges();
  }
}

class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  float angle;
  float aVelocity;
  float aAcceleration;
  
  Mover(int _mass, float _accx, float _accy){
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(_accx, _accy);
    mass = _mass;
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
  }
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    aAcceleration = acceleration.x / 10.0; 
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;
    
    acceleration.mult(0);
  }
  
  void display(){
    fill(175, 200);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, mass * 16, mass * 16);
    popMatrix();
  }
  void checkEdges(){
    if(location.x > width){
      location.x = width;
      velocity.x *= -1;
      //accleration.x *= 0.5;
    } else if(location.x < 0){
      location.x = 0;
      velocity.x *= -1;
      //accleration.x *= 0.5;
    }
    if(location.y > height){
      location.y = height;
      velocity.y *= -1;
      //accleration.y *= 0.5;
    } else if(location.y < 0){
      location.y = 0;
      velocity.y *= -1;
      //accleration.y *= 0.5;
    }
  }
}
