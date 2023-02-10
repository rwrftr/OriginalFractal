int x1 = 750;
int y1 = 750;
int size1 = 100;
int size2 = 0;
int speed = 5;
float angleAddition = 0.45814887;
boolean left, right, up, down, add, subtract, fracB, fracC, fracD, update = false;
boolean fracA = true;

public void setup()
{
  size(1500, 1500);
  background(255);
  textSize(60);
  fill(0);
}
public void draw()
{

  keyProcessing();
  if (fracA) {
    background(255);
    fractalA(x1, y1, size1, PI/2);
  }
  if (fracB) {
    if (update) {
      fractalBCall();
    }
  }
  if (fracC) {
    if (update) {
      fractalCCall();
    }
  }
  if (fracD) {
    background(255);
    fractalD(x1, y1, size1, PI/2);
  }

  if (fracB || fracC) {
    circle(x1, y1, size2 + 25);
  }

  infoSquare();
}



public void infoSquare()
{
  stroke(0);
  strokeWeight(6);
  fill(193);
  rect(20, 20, 350, 300, 50);
  fill(0);
  text("Size: " + size1, 45, 100);
  if (fracA) {
    textSize(50);
    text("Determinate", 45, 160);
    textSize(60);
  }
  if (fracB) {
    text("Random", 45, 160);
  }
  if (fracC) {
    text("Slight", 45, 160);
  }
  if (fracD) {
    text("Cole", 45, 160);
  }
  textSize(50);
  //text("" + angleAddition%2, 45, 220);
  noFill();
  circle(200, 240, 80);

  stroke(255, 0, 0);
  line(200, 240, 200 - (int)(80*cos(PI/2 + angleAddition)), 
    240 - (int)(70*sin(PI/2 + angleAddition)));
  fill(0);
  stroke(0);

  textSize(60);
  //text("Speed: " + speed, 45, 300);
  //text("Size: " + size1, 45, 400);
  strokeWeight(1);
}

// second tab 

public void fractalA(int x, int y, int size1, float angle) 
{
  int x2 = x - (int)(size1*cos(angle));
  int y2 = y - (int)(size1*sin(angle));

  strokeWeight(size1 / 20);
  line(x, y, x2, y2);

  if (size1 <= 10) {
  } else {
    fractalA(x2, y2, size1 - 10, angle + angleAddition );
    fractalA(x2, y2, size1 - 10, angle - angleAddition );
  }
}

//cole was here


public void fractalB(int x, int y, int size1) 
{
  //generate two random angles
  float angle1 = (float)(Math.random()*96 * PI )/96;
  float angle2 = (float)(Math.random()*96 * PI )/96;

  //calculate points from angles
  int x2 = x + (int)(size1*cos(angle1));
  int y2 = y - (int)(size1*sin(angle1));
  int x3 = x + (int)(size1*cos(angle2));
  int y3 = y - (int)(size1*sin(angle2));

  strokeWeight(size1 / 20);

  line(x, y, x2, y2);
  line(x, y, x3, y3);

  if (size1 <= 10) {
  } else {

    fractalB(x2, y2, size1 - 10);
    fractalB(x3, y3, size1 - 10);
  }
}

public void fractalC(int x, int y, int size1, float angle) 
{
  float angle2 = angle + angleShift();
  int x2 = x - (int)(size1*cos(angle2));
  int y2 = y - (int)(size1*sin(angle2));

  strokeWeight(size1 / 20);
  line(x, y, x2, y2);

  if (size1 <= 10) {
  } else {
    fractalC(x2, y2, size1 - 10, angle + angleAddition );
    fractalC(x2, y2, size1 - 10, angle - angleAddition );
  }
}

//fractal D was cole's doing...

public void fractalD(int x, int y, int size1, float angle) 
{
  int xWidth = -(int)(size1*cos(angle));
  int yHeight = -(int)(size1*sin(angle));
  int x2 = x + xWidth;
  int y2 = y + yHeight;

  int x3 = 0;
  int y3 = 0;
  int x4 = 0;
  int y4 = 0;
  boolean xChange = false;
  boolean yChange = false;
  if (x2 > width) {
    x3 = (x - width);
    x4 = x3+xWidth;
    xChange = true;
  }
  if (x2 < 0) {
    x3 = (width - x2);
    x4 = x3+xWidth;
    xChange = true;
  }
  if (y2 > height) {
    y3 = (y2 - height);
    y4 = y3+yHeight;
    yChange = true;
  }
  if (y2 < 0) {
    y3 = (height - y2);
    y4 = y3+yHeight;
    yChange = true;
  }
  strokeWeight(size1 / 20);
  if (!xChange && !yChange) {
    line(x, y, x2, y2);
    if (size1 <= 10) {
    } else {
      fractalD(x2, y2, size1 - 10, angle + angleAddition );
      fractalD(x2, y2, size1 - 10, angle - angleAddition );
    }
  } else {
    line(x3, y3, x4, y4);
    if (size1 <= 10) {
    } else {
      fractalD((xChange) ? x3 : x2, (yChange) ? y3 : y2, size1 - 10, angle + angleAddition );
      fractalD((xChange) ? x3 : x2, (yChange) ? y3 : y2, size1 - 10, angle - angleAddition );
    }
  }
}

//third tab

public void keyPressed() {
  if (key == 'f') {
    if (fracA) {
      fracC = false;
      fracA = false;
      fracB = true;
      fracD = false;
      fractalBCall();
    } else if (fracB) {
      fracC = true;
      fracB = false;
      fracA = false;
      fracD = false;
      fractalCCall();
    } else if (fracC) {
      fracA = false;
      fracB = false;
      fracC = false;
      fracD = true;
    } else if (fracD) {
      fracA = true;
      fracB = false;
      fracC = false;
      fracD = false;
    }
  }
  if (key == 'g') {
    update = true;
  }
  if (key == 'a') {
    left = true;
  }
  if (key == 'd') {
    right = true;
  }
  if (key == 'w') {
    up = true;
  }
  if (key == 's') {
    down = true;
  }
  if (keyCode == SHIFT) {
    if (size1 < 140) {
      size1++;
      size2 += 2;
    }
  }
  if (keyCode == CONTROL) {
    if (size1 > 50) {
      size1--;
      size2 -= 2;
    }
  }
  if (key == ' ') {
    background(255);
  }
  if (key == 'z') {
    subtract = true;
  }
  if (key == 'x') {
    add = true;
  }
}

public void keyReleased() {
  
  /*
  if (key == 'w' || key == 'a' || key == 's' || key == 'd') {
   if (fracB) {
   fractalBCall();
   } else if (fracC) {
   fractalCCall();
   }
   }
   */

  if (keyCode == SHIFT || keyCode == CONTROL || key == 'z' || key == 'x') {
    if (fracB) {
      fractalBCall();
    } else if (fracC) {
      fractalCCall();
    }
  }

  if (key == 'g') {
    update = false;
  }
  if (key == 'a') {
    left = false;
  }
  if (key == 'd') {
    right = false;
  }
  if (key == 'w') {
    up = false;
  }
  if (key == 's') {
    down = false;
  }
  if (key == 'z') {
    subtract = false;
  }
  if (key == 'x') {
    add = false;
  }
  if (keyCode == SHIFT) {
    if (fracB) {
      fractalBCall();
    } else if (fracC) {
      fractalCCall();
    }
  }
  if (keyCode == CONTROL) {
    if (fracB) {
      fractalBCall();
    } else if (fracC) {
      fractalCCall();
    }
  }
}

public void keyProcessing() {
  if (left) {
    x1 -= speed;
  }
  if (right) {
    x1 += speed;
  }
  if (up) {
    y1 -= speed;
  }
  if (down) {
    y1 += speed;
  }

  if (x1 < 0) {
    x1 = width;
  }
  if (x1 > width) {
    x1 = 0;
  }
  if (y1 < 0) {
    y1 = height;
  }
  if (y1 > height) {
    y1 = 0;
  }

  if (add) {
    angleAddition += PI/96;
  }
  if (subtract) {
    angleAddition -= PI/96;
  }
  //if(){}
  //if(){}
}

//fourth tab

public float randomAngle() {
  return (float)(Math.random()*192 * PI )/96;
}

public void fractalBCall() {
  background(255);
  fractalB(x1, y1, size1);
}

public void fractalCCall() {
  background(255);
  fractalC(x1, y1, size1, PI/2);
}

public float angleShift(){

return (float)((Math.random()* 48 * PI ) - 24 * PI)/200;
}
