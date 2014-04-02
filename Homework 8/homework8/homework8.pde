import processing.pdf.*;

float BGHue, BGSat, BGBri, rotateWeight, ellipseWidth, ellipseHeight, noiseY, noiseX, rectGoesWhere;
int probabilityThreshold, blur;

boolean record;

void setup() {
  size(500, 400);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  background(44, 28, 68);
  probabilityThreshold = 9; 
  frameRate(2);
  blur = 90;

  pushMatrix();
  for (int i = 0; i <width+5; i+=5) {
    for (int j = 0; j < height+5; j+=5) {
      BGHue = random(40, 50);
      BGSat = random(20, 30);
      BGBri = random(60, 75);
      fill(BGHue, BGSat, BGBri,blur);
      //fill(BGHue, 24, 66);
      rotateWeight = random(0, 4);
      rotate(PI/rotateWeight); 
      ellipseWidth = random(10, 16);
      ellipseHeight = random(10, 16); 
      rect(i, j, ellipseWidth, ellipseHeight);
    }
  }
  popMatrix();

  for (int i = 0; i <width; i+=20) {
    for (int j = 50; j < height-50; j+= 20) {
      BGHue = 68;
      BGSat = random(0, 3);
      BGBri = random(80, 85);

      fill(BGHue, BGSat, BGBri,150);
      ellipseWidth = random(8, 14);
      ellipseHeight = random(8, 14); 

      noiseY = random(-25, 25);
      noiseX = random(-25, 25);
      rect(i+noiseX, j+noiseY, ellipseWidth, ellipseHeight);
    }
  }
}

void draw() {
  if (record){
    beginRecord(PDF, "frame-####.pdf");
  }

  for (int i = 0; i <width; i+=20) {
    for (int j = 130; j < height-130; j+= 20) {
      noiseX = random(-25, 25);
      rectGoesWhere = random(1, 10);
      ellipseWidth = random(8, 14);
      ellipseHeight = random(8, 14); 


      if (rectGoesWhere > probabilityThreshold) {
        noiseY = random(-120, 120);
        BGHue = random(0, 360);
        BGSat = random(80, 100);
        BGBri = random(30, 70);
        fill(BGHue, BGSat, BGBri,blur);
        rect(i+noiseX, j+noiseY, ellipseWidth, ellipseHeight);
      }
      else {
        noiseY = random(-30, 30);

        if (noiseY < 0 && j < height/2-20) {
          //noiseY -= 10; 
          BGHue = random(20, 30);
          BGSat = random(80, 100);
          BGBri = random(80, 90);
        }
        else {
          BGHue = random(340, 365);
          BGSat = random(80, 100);
          BGBri = random(20, 80);
        }
        fill(BGHue, BGSat, BGBri,blur);
        rect(i+noiseX, j+noiseY, ellipseWidth, ellipseHeight);
      }
    }
  }
  if (record){
    endRecord();
      record = false;
  }
  //filter(BLUR);
}

void mousePressed(){
  record = true;
}
