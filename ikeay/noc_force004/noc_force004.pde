// {start, end , c} 
float[][] fric_area = {{200, 250, 0.01}, {300, 350, 0.05}, {450, 500, 0.08}};
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
  
  fill(255, 0, 0, 10);
  rect(fric_area[0][0], 0, fric_area[0][1] - fric_area[0][0], height);
  fill(0, 255, 0, 10);
  rect(fric_area[1][0], 0, fric_area[1][1] - fric_area[1][0], height);
  fill(0, 0, 255, 10);
  rect(fric_area[2][0], 0, fric_area[2][1] - fric_area[2][0], height);
  
  PVector wind = new PVector(0.01, 0);   
  for(int i = 0; i < balls.length; i++){
    float m = balls[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    PVector friction = balls[i].velocity.get();
    PVector l = balls[i].location.get();
    float c = 0;
    if(l.x > fric_area[0][0] && l.x < fric_area[0][1]){
      c = fric_area[0][2];
    } else if(l.x > fric_area[1][0] && l.x < fric_area[1][1]){
      c = fric_area[1][2];
    } else if(l.x > fric_area[2][0] && l.x < fric_area[2][1]){
      c = fric_area[2][2];
    }
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    balls[i].applyForce(friction);
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
