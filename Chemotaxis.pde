Bacteria[] colony;
void setup()   
{     
  size(500, 500);
  colony = new Bacteria[100];
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria(
      (int)(Math.random()*500), 
      (int)(Math.random()*500), 
      (int)(Math.random()*255));
  }
}   
void draw()   
{
  background(125,155,255);
  for (int i = 0; i < colony.length; i++) {
    colony[i].show();
    colony[i].move();
  }
  for (int i = 0; i < colony.length; i++) {
    for (int j = 0; j < colony.length; j++) {
      if (dist(colony[i].myX, colony[i].myY, colony[j].myX, colony[j].myY) < 15 && i != j) { // remove specificy of each bacteria
        colony[i].myTotalColor = color(i*5+100,i*2,i*6);
        colony[j].myTotalColor = color(j*5+100,j*2,j*6);
      }
            
      if (colony[i].myX > 600 || colony[i].myY > 600 || colony[i].myX < 0 || colony[i].myY < 0){
        colony[i].myX = 300 + (int)(Math.random()*300)-(int)(Math.random()*300);
        colony[i].myY = 300 + (int)(Math.random()*300)-(int)(Math.random()*300);
    }
  }
}
  if (mousePressed) {
    for (int i = 0; i < colony.length; i++) {
      if (colony[i].myX > mouseX) {
        colony[i].myX-= 5;
      } else if (colony[i].myX < mouseX) {
        colony[i].myX+= 5;
      }

      if (colony[i].myY > mouseY) {
        colony[i].myY-= 5;
      } else if (colony[i].myY < mouseY) {
        colony[i].myY+= 5;
      }
    }
  }
}


class Bacteria
{     
  int myX, myY, myTotalColor;
  Bacteria(int x, int y, int totalColor) {          //constructor 
    myX = x;
    myY = y;
    myTotalColor = color(totalColor);
  }

  void show() {
    noStroke();
    fill(myTotalColor);
    ellipse(myX, myY, 15, 15);
  }

  void move() {
    myX += (int)(Math.random()*3)-1;
    myY += (int)(Math.random()*3)-1;
  }
}
void mouseMoved() {
  for (int i = 0; i < colony.length; i++) {
    if (dist(colony[i].myX, colony[i].myY, mouseX, mouseY) < 32) {
      colony[i].myX += (Math.random()*200)-100;
      colony[i].myY += (Math.random()*200)-100;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < colony.length; i++) {
    if (dist(colony[i].myX, colony[i].myY, mouseX, mouseY) < 32) {
      colony[i].myX += (Math.random()*600)-300;
      colony[i].myY += (Math.random()*600)-300;
    }
  }
}`
