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
  rect(20, 20, 350, 235, 50);
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
  text("" + angleAddition%2, 45, 220);
  textSize(60);
  //text("Speed: " + speed, 45, 300);
  //text("Size: " + size1, 45, 400);
  strokeWeight(1);
}
