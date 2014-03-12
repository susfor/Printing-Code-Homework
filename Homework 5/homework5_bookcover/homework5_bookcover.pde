

// center of the circle
float centerX;
float centerY;

// x and y location of the point moving around the circumference of the circle
float xLoc = 0;
float yLoc = 0;

// how far around the circle
float degree = 0;

float radius = 100;

void setup() {
  size(900, 800);

  background(255);

  centerX = width/2;
  centerY = height/2;  
  int hatx = 200;
  int haty = 110;
  int hatsize = 200;

  pushMatrix();
  //Hat
  translate(100, 100);

  fill(0);
  strokeWeight(3);
  //top of the hat 
  ellipse(hatx, haty, hatsize, hatsize);
  //side circle of the hat
  ellipse(hatx-110, haty+40, hatsize-130, hatsize-130);
  ellipse(hatx+110, haty+40, hatsize-130, hatsize-130);
  //Biggest circle
  noFill();
  stroke(0);
  ellipse(hatx, haty-76, hatsize*2, hatsize*2);

  fillarea(250, 320);

  stroke(0);
  strokeWeight(5);
  ellipse(hatx, haty, hatsize, hatsize);
  //smallest circle
  ellipse(hatx-110, haty+40, hatsize-130, hatsize-130);
  ellipse(hatx+110, haty+40, hatsize-130, hatsize-130);
  noFill();
  strokeWeight(7);
  stroke(255);
  ellipse(hatx, haty-76, hatsize*2, hatsize*2);

  popMatrix();

  pushMatrix();
  //Create the eye
  scale(0.5);
  translate(20, 400);

  for (int degree = 0; degree < 360; degree+=12) {
    xLoc = centerX + (radius * cos(radians(degree)));
    yLoc = centerY + (radius * sin(radians(degree)));
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(xLoc, yLoc, 20, 20);
  }

  //ellipse to cut off half of the circles for eyelashes
  stroke(255);
  strokeWeight(12);
  ellipse(centerX, centerY, 215, 215);

  //eyeliner
  stroke(0);
  strokeWeight(4);
  ellipse(centerX, centerY, 177, 177);

  //pupil
  fill(0);
  ellipse(centerX, centerY, 60, 60);
  popMatrix();

  int mouthx = 280;
  int mouthy = 560;
  int sizemouth = 40;
  int k = 120;
  int r = -40;
  pushMatrix();
  //create the mouth
  //top mouth
  ellipse(mouthx+sizemouth, mouthy, sizemouth, sizemouth);
  ellipse(mouthx, mouthy, sizemouth, sizemouth);

  //ellipse to create the bottom of the lip
  noFill();
  stroke(0);
  strokeWeight(1);
  ellipse(mouthx+20, mouthy-20, sizemouth*2.5, sizemouth*2.5);

  //fills the lip
  fillarea(mouthx+20, mouthy+25);

  //Remove small white parts from the fillarea function
  strokeWeight(6);
  stroke(0);
  ellipse(mouthx+sizemouth, mouthy, sizemouth, sizemouth);
  ellipse(mouthx, mouthy, sizemouth, sizemouth);

  //remove bottom ellipse 
  stroke(255);
  ellipse(mouthx+20, mouthy-20, sizemouth*2.5, sizemouth*2.5);

  //add the sides to the lip
  noStroke();

  fill(0);
  ellipse(mouthx+73, mouthy-5, 25, 25);
  ellipse(mouthx-33, mouthy-5, 25, 25);

  fill(255);
  ellipse(mouthx+76, mouthy-15, 31, 31);
  ellipse(mouthx-35, mouthy-15, 31, 31);

  noFill();
  stroke(0);
  rect(52, 10, width-400, height-100);

  //diverseColor(50,10,width-400,height-100);


}


void fillarea(int x, int y) {
  set(x, y, 0);

  if (get(x+1, y) == -1) {
    fillarea(x+1, y);
  }
  if (get(x, y+1) == -1) {
    fillarea(x, y+1);
  }
  if (get(x-1, y) == -1) {
    fillarea(x-1, y);
  }
  if (get(x, y-1) == -1) {
    fillarea(x, y-1);
  }
  else {
    return;
  }
}

void diverseColor(int xstart, int ystart, int xstop, int ystop) {
  for (int i = xstart; i < xstop; i+=3) {
    for (int j = ystart; j < ystop; j+=3) {
      if (get(i, j) == -1) {

        set(i, j, 14585600);
      }
      else {
        //set(i,j,-1);
      }
    }
  }
}

