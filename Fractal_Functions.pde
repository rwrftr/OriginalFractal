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
