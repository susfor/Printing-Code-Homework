//Automated Smile faces. 
//By pressing "r" a pdf recording starts. To save a pdf image press "r" then "q" to stop

import processing.pdf.*;
boolean recording;

PGraphicsPDF pdf;
Smile smile1;

int count;
int bodyColor;


void setup() {
  size(400, 400);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume1.pdf");

  background(255);
  smile1 = new Smile(width/2, height/2);
  colorMode(HSB, 360, 100, 100);
  count = 0;

}


void draw() {
  bodyColor = (int)random(0, 360);
  count++;
  pdf.colorMode(HSB, 360, 100, 100);
  if (count%70 == 0) {
    background(0, 0, 100);
    smile1.body(bodyColor);
    smile1.eyes();
    smile1.mouth();
  }
}

void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } 
    else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } 
  else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }
}

