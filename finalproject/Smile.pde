class Smile {

  float x, y, bodyWidth, bodyHeight;


  Smile(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void body(float hue) {
    bodyWidth = random(70, 120);
    bodyHeight = random(70, 120);

    fill(hue, 60, 100);
    ellipse(x, y, bodyWidth, bodyHeight);
  }

  void eyes() {
    stroke(0);
    fill(0, 0, 100);
    float lefteyeoffsetX = random(10, 20);
    float righteyeoffsetX = random(10, 20);
    float lefteyeoffsetY = random(10, 20);
    float righteyeoffsetY = random(10, 20);

    float lefteyewidth = random(15, 35);
    float righteyewidth = random(15, 35);
    float lefteyeheight = random(15, 35);
    float righteyeheight= random(15, 35);

    ellipse(x-lefteyeoffsetX, y-lefteyeoffsetY, lefteyewidth, lefteyeheight);
    ellipse(x+righteyeoffsetX, y-righteyeoffsetY, righteyewidth, righteyeheight);

    //pick pupil
    int pupilType = (int)random(1, 5);
    fill(0, 0, 0);

    //normal - lookdown
    if (pupilType == 1) {
      ellipse(x-lefteyeoffsetX, y-lefteyeoffsetY+lefteyeheight/4, lefteyewidth/2, lefteyeheight/2);
      ellipse(x+righteyeoffsetX, y-righteyeoffsetY+righteyeheight/4, righteyewidth/2, righteyeheight/2);
    }
    //surprised
    else if (pupilType == 2) {
      ellipse(x-lefteyeoffsetX, y-lefteyeoffsetY, lefteyewidth/2, lefteyeheight/2);
      ellipse(x+righteyeoffsetX, y-righteyeoffsetY, righteyewidth/2, righteyeheight/2);
    }
    //lookup
    else if (pupilType == 3) {
      ellipse(x-lefteyeoffsetX, y-lefteyeoffsetY-lefteyeheight/4, lefteyewidth/2, lefteyeheight/2);
      ellipse(x+righteyeoffsetX, y-righteyeoffsetY-righteyeheight/4, righteyewidth/2, righteyeheight/2);
    }

    //cross-eyed
    else if (pupilType == 4) {
      ellipse(x-lefteyeoffsetX + lefteyewidth/4, y-lefteyeoffsetY, lefteyewidth/2, lefteyeheight/2);
      ellipse(x+righteyeoffsetX - lefteyewidth/4, y-righteyeoffsetY, righteyewidth/2, righteyeheight/2);
    }
    //eyebrows, surprised
    strokeWeight(2);
    line(x-lefteyeoffsetX-lefteyewidth/1.5, y-lefteyeoffsetY*2, x-lefteyeoffsetX+lefteyewidth/1.5, y-lefteyeoffsetY-lefteyeheight);
    line(x+righteyeoffsetX+righteyewidth/1.8, y-righteyeoffsetY*2, x+righteyeoffsetX-righteyewidth/1.8, y-righteyeoffsetY-righteyeheight);

    strokeWeight(1);
  }

  void mouth() {
    int mouthType = (int)random(1, 6);
    float mouthoffsetX;
    float mouthoffsetY1;
    float mouthoffsetY2;
    float mouthWidth;
    float mouthHeight;
    println(mouthType);


    //Surprised
    if (mouthType == 1)
    {
      mouthoffsetX = random(-15, 15);
      mouthoffsetY1 = random(10, 20);
      mouthWidth = random(15, 35);
      mouthHeight = random(15, 25);


      fill(0, 0, 100);
      ellipse(x+mouthoffsetX, y+mouthoffsetY1, mouthWidth, mouthHeight);
    }

    //indifferent
    else if (mouthType == 2) {
      mouthoffsetX = random(-10, -15);
      mouthoffsetY1 = random(10, 20);
      mouthoffsetY2 = random(10, 20);
      strokeWeight(3);
      line(x+mouthoffsetX, y+mouthoffsetY1, x-mouthoffsetX, y+mouthoffsetY2);
      strokeWeight(1);
    }

    //Confused, Unhappy
    else if (mouthType == 3) {
      mouthoffsetX = random(-10, -15);
      mouthoffsetY1 = random(10, 20);
      mouthoffsetY2 = random(10, 20);
      noFill();
      strokeWeight(3);
      bezier(x+mouthoffsetX, y+mouthoffsetY1, x, y+2*mouthoffsetY1, x, y, x-mouthoffsetX, y+mouthoffsetY2);
      strokeWeight(1);
    }

    //Smile open mouth
    else if (mouthType == 4) {
      mouthoffsetX = random(-15, 15);
      mouthoffsetY1 = random(15, 20);
      mouthoffsetY2 = random(15, 20);
      mouthWidth = random(15, 35);
      mouthHeight = random(15, 25);
      fill(0, 0, 100);
      strokeWeight(1);
      arc(x+mouthoffsetX, y+mouthoffsetY1, mouthWidth, mouthHeight, 0-PI/8, PI+PI/8, CHORD);
    }

    //stroke smile
    else if (mouthType == 5) {
      mouthoffsetX = random(-15, 15);
      mouthoffsetY1 = random(15, 20);
      mouthoffsetY2 = random(15, 20);
      mouthWidth = random(15, 35);
      mouthHeight = random(15, 25);
      noFill();
      strokeWeight(2);
      arc(x+mouthoffsetX, y+mouthoffsetY1, mouthWidth, mouthHeight, 0-PI/8, PI+PI/8);
      strokeWeight(1);
    }
  }
  void nose() {

    float mouthoffsetX = random(-5, 5);
    float mouthoffsetY1 = random(5, 10);
    float mouthWidth = random(10, 20);
    float mouthHeight = random(10, 20);
    noFill();
    strokeWeight(2);
    arc(x+mouthoffsetX, y+mouthoffsetY1, mouthWidth, mouthHeight, 0-PI/8, PI+PI/8);
    strokeWeight(1);
  }
}

