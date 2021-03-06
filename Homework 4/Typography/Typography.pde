import processing.pdf.*;

float amp = 100;
int ellipssize = 20;
void setup() {

  size(1000, 600,PDF, "typography2.pdf");
  background(255);
  fill(0);
}
void draw() {

  translate(30, 0);
  W();
  a();
  v();
  e();
  s();
  
    // Exit the program 
    println("Finished.");
    exit();
}

void W() {
  translate(5, height/2);
  float t = 0;
  float y;

  for (int i = 0; i < 250; i++) {
    y = -cos(t)*amp;
    ellipse(i, y, ellipssize, ellipssize);
    t += 0.05;
  }
}

void a() {
  translate(310, -20);
  float t = 0;
  float x;
  for (int i = 0; i <120; i++) {
    x = cos(t)*amp/2;
    ellipse(x, i, ellipssize, ellipssize);
    t += 0.05;
  }
  translate(50, 0);
  float y;
  t = 0;
  for (int i = 0; i < 130; i++) {
    y = sin(t)*amp/10;
    ellipse(y, i, ellipssize, ellipssize);
    t += 0.05;
  }
}

void v() {
  translate(60, 65 );
  float t = 0;
  float y;

  for (int i = 0; i < 64; i++) {
    y = -cos(2*t)*amp/2;
    ellipse(i, y, ellipssize, ellipssize);
    t += 0.05;
  }
}

void e() {
  translate(152, -65);
  float t = 0;
  float x;
  for (int i = 0; i <95; i++) {
    x = cos(t)*50;
    ellipse(x, i, ellipssize, ellipssize);
    t += 0.05;
  }
  translate(50, 10);
  float y;
  t = 0;
  for (int i = 0; i < 110; i++) {
    y = sin(t)*amp/2;
    ellipse(y, i, ellipssize, ellipssize);
    t += 0.06;
  }
}
void s() {
  translate(145, -20);
  float y;
  float t2 = 0;
  for (int i = 0; i < 135; i++) {
    y = -sin(t2-PI/2.5)*amp/2;
    ellipse(y, i, ellipssize, ellipssize);
    t2 += 0.07;
  }
}

