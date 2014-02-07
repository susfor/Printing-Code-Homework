import processing.pdf.*;

int[] xcord = {170,180,190,
  180, 190, 200, 190, 200, 210, 200, 210, 220, 210, 220, 230, 220, 230, 240
};
int[] ycord = {
  50,40,30,60, 50, 40, 70, 60, 50, 80, 70, 60, 90, 80, 70, 100, 90, 80
};

void setup() {
  size(500, 500, PDF, "filename.pdf");
  //size(500, 500);
  background(255);

  fill(255);
  stroke(0);



  ellipse(250, 120, 120, 120);

  for (int i = 0; i < 18; i++) {
    fill (0);
    rect(xcord[i],ycord[i], 10, 10);
  }

  fill(0);
  triangle(200, 152, 300, 152, 250, 400);

  // Exit the program 
    println("Finished.");
    exit();
}

void draw() {
}

