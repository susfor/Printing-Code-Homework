import processing.pdf.*;

int x, y;
int alpha;
float scale, outlinePerc, eyecolorPerc;

void setup() {
  size(940, 600, PDF, "pattern.pdf");
  background(0);
  strokeWeight(3);
  noFill();
  colorMode(HSB, 360, 100, 100);
  scale = 0.5; //CHANGE THIS NUMBER TO SET THE SIZE OF THE PRINT
  scale(scale);
  outlinePerc = 0.3; //CHANGE THIS NUMBER TO TWEEK HOW MANY BLACK/WHITE EYE OUTLINES 
  eyecolorPerc = 0.3; //CHANGE THIS NUMBER TO TWEEK THE AMOUT OF BLACK/WHITE COLORED EYES
  
  for (int i = 94; i< width/scale; i+=187) {
    for (int j = 30; j < height/scale; j+=130) {
      
      pushMatrix();
      translate(i, j);
      
      //bottom part of eye
      pushMatrix();
      float blackorwhiteBorder = random(0, 1);
      if (blackorwhiteBorder > outlinePerc) {
        stroke(0, 0, 100); //white border
      }
      else {
        stroke(0, 0, 0); //black boarder
      }
      fill(0, 0, 0);
      rotate(PI/8.0);
      arc(0, 0, 200, 200, 0, PI*3/4);
      popMatrix();
      //top part of eye
      pushMatrix();
      translate(0, 75);
      rotate(PI+PI/8.0); 
      arc(0, 0, 200, 200, 0, PI*3/4);
      popMatrix();

      pushMatrix();
      float blackorwhite = random(0, 1);
      if (blackorwhite > eyecolorPerc) {
        stroke(0, 0, 100);
        fill(0, 0, 100);
      }
      else {
        stroke(0, 0, 0);
        fill(0, 0, 0);
      }

      translate(0, 37);
      ellipse(0, 0, 100, 100);
      float pupilcolor = random(0, 1);
      if (pupilcolor < 0.33) {
        fill(0, 0, 0); //black
      }
      else if (pupilcolor>=0.33 && pupilcolor<0.67) {
        fill(29, 95, 96); //orange
      }
      else if (pupilcolor >=0.67) {
        fill(201, 100, 80);
      }
      ellipse(0, 0, 40, 40);
      popMatrix();
      popMatrix();
    }
  }
  exit();
}

void draw() {
}

