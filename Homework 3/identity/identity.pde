import processing.pdf.*;

int strokeColor[] = {
  0, 60, 60
};
int randomxstart, randomystart, randomxstop, randomystop, randomx1weight, randomx2weight, randomy1height, randomy2height, ellipsewidth, ellispeheight, variable;

float x = width/2;
float y = height/2-50;

int k = 1;

void setup() {
  size(1200, 700, PDF, "identity.pdf"); 

  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  noFill();
  strokeWeight(5);
  
  //Leave shape
  ellipsewidth = 20;
  ellispeheight = 10;
}

void draw() {
  createIdentity();

  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  pdf.nextPage();  // Tell it to go to the next page

  if (frameCount == 50) {
    exit();
  }
}


void createIdentity() {
  background(0, 0, 100);
  
  for (int i = 0; i < 30; i++) {
    noFill();

    //Creates the branches 
    randomxstart = width/2;
    randomystart = height/2; //(int)random(height/2-50, height/2);
    randomxstop = (int)random(350, width-350);
    randomystop = (int)random(30, 140);

    randomx1weight = (int)random(-300, 300);
    randomx2weight = (int)random(-300, 300);

    randomy1height = (int)random(100, 300);
    randomy2height = (int)random(30, 100);


    stroke(strokeColor[0], strokeColor[1], strokeColor[2]);
    bezier(randomxstart, randomystart, randomxstart+randomx1weight, randomystart+randomy1height, randomxstop + randomx2weight, randomystop+randomy2height, randomxstop, randomystop);

    fill(strokeColor[0], strokeColor[1], strokeColor[2]);


    //Creates leaves
    int steps = 5;
    for (int j = 0; j <= steps; j++) {
      float t = j / float(steps);
      float x = bezierPoint(randomxstart, randomxstart+randomx1weight, randomxstop + randomx2weight, randomxstop, t);
      float y = bezierPoint(randomystart, randomystart+randomy1height, randomystop+randomy2height, randomystop, t);
      ellipse(x, y, ellipsewidth, ellispeheight);



      variable = ellipsewidth;
      ellipsewidth = ellispeheight;
      ellispeheight = variable;
    }
    ellipse(randomxstart+randomx1weight, randomystart+randomy1height, ellipsewidth, ellispeheight);
    ellipse(randomxstop + randomx2weight, randomystop+randomy2height, ellipsewidth, ellispeheight);


    strokeColor[0] = (int)random(strokeColor[0]-20, strokeColor[0]+20);

    //first time, also create the "ground"
    if (i==0) {
      beginShape();
      translate(width/2, height/2+50);

      float cx1 = (x + 100);
      float cy1 = (y + 50);
      float x31 = (x + 50);
      float y31 = (y + 100);

      float cx2 = (x + 100);
      float cy2 = (y + 200);
      float x32 = x;
      float y32 = (y + 200);

      float cx3 = (x - 100);
      float cy3 = (y + 200);
      float x33 = (x - 50);
      float y33 = (y + 100);

      float cx4 = (x - 100);
      float cy4 = (y + 50);
      float x34 = x;
      float y34 = y;

      vertex(x, y);
      quadraticVertex(cx1, cy1, x31, y31);
      quadraticVertex(cx2, cy2, x32, y32);
      quadraticVertex(cx3, cy3, x33, y33);
      quadraticVertex(cx4, cy4, x34, y34);
      endShape();

      translate(-width/2, -height/2-50);
    }
  }

  //Changes the color palette of the sketch for every iteration
  strokeColor[0] = (int)random(0, 310);
  println(k+" Color:" + strokeColor[0]);
  k++;
}

