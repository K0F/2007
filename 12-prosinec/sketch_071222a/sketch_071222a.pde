import processing.opengl.*;


float power = 3; // Turbulence power
float d = 8; // Turbulence density
float move = 0.0001;
void setup(){
  size(200,200,OPENGL);
  noStroke();
}

void draw(){
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float total = 0.0;

      for (float i = d; i >= 1; i = i/2.0) {
        total += 0.1*noise(x/ (move+=0.000001), y/ (move+=0.000001)) * (move+=0.000001);
      }
      println(move);
      
      float turbulence = 128.0 * total / d;
      float base = (x * 0.2) + (y * 0.12);
      float offset = base + (power * turbulence / (256.0));
      float gray = abs(sin(offset)) * (256.0);
      stroke(gray);
      line(x, y,x+1,y);
    }
  }
}
