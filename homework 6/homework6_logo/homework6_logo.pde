import processing.pdf.*;
void setup() {
  size(500, 500, PDF, "logo.pdf");
  noFill();
  translate(width/2, height/2);
  colorMode(HSB, 360, 100, 100);
  int x = 0;
  for ( int row = 0; row < 40; row+=10) {
    int howMany = 0;

    for (int column = x;column <80; column+=10) {
      howMany++;
      if (howMany < 8) {
        int fillcolorvar = (int)random(0, 64);
        int fillcolor = (int) map(fillcolorvar, 0, 64, 0, 255);
        fill(fillcolor, 50, 90);
        ellipse(column, row, 10, 10);
      }
    }
    x -= 5;
  }

  // Exit the program 
  println("Finished.");
  exit();
}

