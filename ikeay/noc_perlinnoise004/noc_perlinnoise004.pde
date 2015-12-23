float xoff, yoff;
float _xoff, _yoff;
void setup(){
  size(500, 500, P3D);
  _xoff = _yoff = 0.0;
}

void draw(){
  loadPixels();
  float xoff = 0.0;
  for(int x = 0; x < width; x++){
    float yoff = 0.0;
    for(int y = 0; y < height; y++){
      float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
      pixels[x + y * width] = color(bright);
      yoff += 0.01 + _yoff;
    }
    xoff += 0.01 + _xoff;
  }
  updatePixels();
  _xoff += 0.01;
  _yoff += 0.01;
  _xoff = _xoff * 0.5;
  _yoff = _yoff * 0.5;
}
