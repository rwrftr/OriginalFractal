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
