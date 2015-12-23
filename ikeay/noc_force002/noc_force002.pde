Ball[] balls = new Ball[10];

void setup(){
  size(600, 300);
  background(255);
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball(random(0.1, 5), 0, 0);
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < balls.length; i++){
    float m = balls[i].mass;
    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1 * m);
    balls[i].applyForce(wind);
    balls[i].applyForce(gravity);
    balls[i].update();
    balls[i].display();
    balls[i].checkEdges();
  }
}

class Ball{
  float mass;
  PVector location, velocity, acceleration; 
  Ball(float m, float x, float y){
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(f, mass);
    acceleration.add(force);
  }
  
  void checkEdges(){
    if(location.x > width){
      location.x = width;
      velocity.x *= -1; 
    } else if(location.x < 0){
      location.x = 0;
      velocity.x *= -1;    
    }
    if(location.y > height){
      location.y = height;
      velocity.y *= -1; 
    } else if(location.y < 0) {
      location.y = 0;
      velocity.y *= -1; 
    }
  }

}
