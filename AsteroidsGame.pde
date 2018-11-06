Spaceship space;
Asteroid rockz[] = new Asteroid[10];
boolean keyz[] = new boolean[4];
Star starz[] = new Star[100];
public void setup() 
{
  size(500, 500);
  space = new Spaceship();
  for (int i = 0; i < starz.length; i++){
    starz[i] = new Star();
  }
  for (int i = 0; i < rockz.length; i++){
    rockz[i] = new Asteroid();
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < starz.length; i++){
    starz[i].show();
  }
  for (int i = 0; i < rockz.length; i++){
    rockz[i].show();
    rockz[i].move();
  }
  space.show();
  space.move();
  for (int i = 0; i < keyz.length; i++) {
    if (keyz[0]){
      space.accelerate(0.0125);
    }
    if (keyz[1]){
      space.turn(-0.7);
    }
    if (keyz[2]){
      space.accelerate(-0.0125);
    }
    if (keyz[3]){
      space.turn(0.7);
    }
  }
}
public void keyPressed() {
  if (key == 'w' || key == 'W') {
    keyz[0] = true;
  }
  if (key == 'a' || key == 'A') {
    keyz[1] = true;
  }
  if (key == 's' || key == 'S') {
    keyz[2] = true;
  }
  if (key == 'd' || key == 'D') {
    keyz[3] = true;
  }
  if (keyCode == SHIFT) {
    space.setX((int)(Math.random()*width));
    space.setY((int)(Math.random()*height));
    space.setDirectionX(0);
    space.setDirectionY(0);
    space.setPointDirection((int)(Math.random()*256));
  }
}
public void keyReleased() {
  if (key == 'w' || key == 'W') {
    keyz[0] = false;
  }
  if (key == 'a' || key == 'A') {
    keyz[1] = false;
  }
  if (key == 's' || key == 'S') {
    keyz[2] = false;
  }
  if (key == 'd' || key == 'D') {
    keyz[3] = false;
  }
  
}
