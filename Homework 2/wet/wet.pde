//WET visualization
import processing.pdf.*;


float x = 0;
float y = -350;

float xscale = 0.78;
float yscale = 1;
float k = 0;

void setup() {
  size(1100, 800, PDF, "filename.pdf");
  background(255);
  translate(width/2, height/2-100);
  scale(0.8, 0.5);

  fill(0);

  ellipse(0, -300, 400, 100);
  ellipse(0, 850, 500, 100);

  for (int i = 0; i < 7; i++) {
    scale(xscale, yscale);
    beginShape();

    vertex(x, y);
    float cx1 = (x + 100);
    float cy1 = (y + 50);
    float x31 = (x + 100);
    float y31 = (y + 100);

    float cx2 = (x + 100);
    float cy2 = (y + 200);
    float x32 = x;
    float y32 = (y + 200);

    float cx3 = (x - 100);
    float cy3 = (y + 200);
    float x33 = (x - 100);
    float y33 = (y + 100);

    float cx4 = (x - 100);
    float cy4 = (y + 50);
    float x34 = x;
    float y34 = y;

    quadraticVertex(cx1, cy1, x31, y31);
    quadraticVertex(cx2, cy2, x32, y32);
    quadraticVertex(cx3, cy3, x33, y33);
    quadraticVertex(cx4, cy4, x34, y34);


    y += 90 + k;
    //yscale -= 0.05;
    k += 30;

    endShape();

    // Exit the program 
    println("Finished.");
    exit();
  }
}

