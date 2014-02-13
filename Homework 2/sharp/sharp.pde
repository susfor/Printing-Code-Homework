//Sharp visualization
import processing.pdf.*;

void setup() {
  size(1000, 700,P3D);
   beginRaw(PDF, "sharp.pdf");
  background(255);
  translate(width/2, height/2-100);
  float x = 1;
  float y = 0;

  beginShape();
    scale(500,200);
    for(int i = 0; i < 200; i++){
    x += 0.5;
    y += 0.9;
    vertex(0, 0);
    vertex(cos(x), sin(y));
  }
  endShape();
endRaw();
}


