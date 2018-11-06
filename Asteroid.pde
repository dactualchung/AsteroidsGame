class Asteroid extends Floater{
  private int rotSpeed, rotDirection;
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  public Asteroid(){
    if(Math.random() < 0.5){
      rotDirection = 1;
    }else{
      rotDirection = -1; 
    }
    rotSpeed = rotDirection * (int)(Math.random()*PI + 1);
    corners = 6;
    int [] xS = {-11, 7 , 13, 6, -11, -5};
    int [] yS = {-8, -8, 0, 10, 8, 0};
    xCorners = xS;
    yCorners = yS;
    myColor = color(148,148,148);
    myCenterX = Math.random()*(width-18) + 11;
    myCenterY = Math.random()*(height-18)+8;
    myDirectionX = Math.random()*4 - 2;
    myDirectionY = Math.random()*4 - 2;
    myPointDirection = Math.random()*360;
  }
  public void move() {
    turn(rotSpeed);
    super.move();
  }
}
