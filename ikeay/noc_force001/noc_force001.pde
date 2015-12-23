Ball b;
PVector gravity;
float tx, ty;


void setup(){
  size(500, 500);
  background(255);
  
  noStroke();
  
  tx = 0;
  
  b = new Ball();
}

void draw(){
  fill(255);
  rect(0, 0, width, height);
  
  float wx = map(noise(tx), 0, 1, 0, 2);
  PVector wind = new PVector(wx, 0);
  
  b.applyForce(wind);
  b.update();
  b.display();
  b.checkEdges();
  
  tx += 0.01;
}

class Ball{
  PVector location;
  PVector velocity;
  PVector accleration;
  PVector gravity;
  int size = 50;
  
  Ball(){
    location = new PVector(width/2, height/2);
    velocity = new PVector();
    accleration = new PVector();
    gravity = new PVector(0, -0.8);
  }
  
  void update(){
    applyForce(gravity);
    velocity.add(accleration);
    location.add(velocity);
    accleration.mult(0);
  }
  
  void display(){
    fill(0);
    ellipse(location.x, location.y, size, size);
  }

  void applyForce(PVector force){
    accleration.add(force);
  }
  
  void checkEdges(){
    if(location.x > width - size/2){
      location.x = width - size/2;
      velocity.x *= -1;
      //accleration.x *= 0.5;
    } else if(location.x < size/2){
      location.x = size/2;
      velocity.x *= -1;
      //accleration.x *= 0.5;
    }
    if(location.y > height - size/2){
      location.y = height - size/2;
      velocity.y *= -1;
      //accleration.y *= 0.5;
    } else if(location.y < size/2){
      location.y = size/2;
      velocity.y *= -1;
      //accleration.y *= 0.5;
    }
  }
}
