Bacteria[] colony;
void setup()   
{     
  size(500, 500);
  colony = new Bacteria[20];
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria(
      (int)(Math.random()*500), 
      (int)(Math.random()*500), 
      (int)(Math.random()*300), 
      (int)(Math.random()*300), 
      (int)(Math.random()*300));
  }
}   
void draw()   
{

  background(125);
  for (int i = 0; i < colony.length; i++) {
    colony[i].show();
    colony[i].move();
  }
  for (int i = 0; i < colony.length; i++) {
    for (int j = 0; j < colony.length; j++) {
      if (dist(colony[i].myX, colony[i].myY, colony[j].myX, colony[j].myY) < 30 && i != j) { // remove specificy of each bacteria
        colony[i].myTotalColor = color(0, 0, 0);
        colony[j].myTotalColor = color(0, 0, 0);
      }
    }
  }
  if (mousePressed) {
    for (int i = 0; i < colony.length; i++) {
      if (colony[i].myX > mouseX) {
        colony[i].myX-= 2;
      } else if (colony[i].myX < mouseX) {
        colony[i].myX+= 2;
      }

      if (colony[i].myY > mouseY) {
        colony[i].myY-= 2;
      } else if (colony[i].myY < mouseY) {
        colony[i].myY+= 2;
      }
    }
  }
}
class Bacteria
{     
  int myX, myY, myColor1, myColor2, myColor3, myTotalColor;
  Bacteria(int x, int y, int color1, int color2, int color3) {
    myX = x;
    myY = y;
    myColor1 = color1;
    myColor2 = color2;
    myColor3 = color3;
    myTotalColor = color(myColor1, myColor2, myColor3);
  }

  void show() {
    noStroke();
    fill(myTotalColor);
    ellipse(myX, myY, 30, 30);
  }

  void move() {
    myX += (Math.random()*3)-1;
    myY += (Math.random()*3)-1;
  }
}
