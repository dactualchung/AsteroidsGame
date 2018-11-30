Spaceship space;
ArrayList <Asteroid> rockz = new ArrayList <Asteroid>();
boolean keyz[] = new boolean[5];
Star starz[] = new Star[100];
ArrayList <Bullet> bullz = new ArrayList <Bullet>();
boolean bulletShot = false;
public void setup() 
{
  size(500, 500);
  space = new Spaceship();
  for (int i = 0; i < starz.length; i++){
    starz[i] = new Star();
  }
  for (int i = 0; i < 30; i++){
    rockz.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < starz.length; i++){
    starz[i].show();
  }
  for (int i = 0; i < bullz.size(); i++){
    bullz.get(i).show();
    bullz.get(i).move();
  }
  for (int i = 0; i < rockz.size(); i++){
    rockz.get(i).show();
    rockz.get(i).move();
    float d = dist(space.getX(),space.getY(), rockz.get(i).getX(), rockz.get(i).getY());
    if(d < 12){
      rockz.remove(i);
      i--;
    }
  }
  for (int i = 0; i < rockz.size(); i++){
    for(int a = 0; a < bullz.size(); a++){
      float b = dist(bullz.get(a).getX(),bullz.get(a).getY(), rockz.get(i).getX(), rockz.get(i).getY());
      if(b < 10){
        rockz.remove(i);
        bullz.remove(a);
        break;
      }
    }
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
    if (keyz[4] && bulletShot == false){
      bullz.add(new Bullet(space));
      bulletShot = true; 
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
  if ((key == ' ' && bulletShot == false) || (key == ' ' && bulletShot == false)){
    keyz[4] = true;
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
  if (key == ' ' || key == ' ') {
    keyz[4] = false;
    bulletShot = false;
  }
}
