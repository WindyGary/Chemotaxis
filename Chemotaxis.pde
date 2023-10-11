Bacteria[] colony;
void setup()   
{     
  size(500, 500);
  colony = new Bacteria[100];
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
  if (mousePressed) {
    for(int i = 0; i < colony.length; i++){
      colony[i].myX = mouseX;
      colony[i].myY = mouseY;
    }
  }
}
class Bacteria
{     
  int myX, myY, myColor1, myColor2, myColor3;
  Bacteria(int x, int y, int color1, int color2, int color3) {
    myX = x;
    myY = y;
    myColor1 = color1;
    myColor2 = color2;
    myColor3 = color3;
  }

  void show() {
    fill(myColor1, myColor2, myColor3);
    ellipse(myX, myY, 30, 30);
  }

  void move() {
    myX += (Math.random()*3)-1;
    myY += (Math.random()*3)-1;
  }
}
