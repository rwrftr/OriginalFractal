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
