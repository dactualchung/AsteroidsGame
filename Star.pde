class Star //note that this class does NOT extend Floater
{
  private double myX, myY, mySize;
  public Star() {
    myX = (Math.random()*width);
    myY = (Math.random()*height);
    mySize = (Math.random() * 5) + 5;
  }
  public void show(){
    fill(255,255,255,80);
    noStroke();
    ellipse((float)myX,(float)myY, (float)mySize, (float)mySize);
  }
}
