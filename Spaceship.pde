class Spaceship extends Floater
{
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
  public Spaceship(){
    corners = 4;
    int [] xS = {-8, 16 , -8, -2};
    int [] yS = {-8, 0 , 8, 0};
    xCorners = xS;
    yCorners = yS;
    myColor = color(255,255,255);
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY  
    if(keyz[0] == false && keyz[2] == false){
      if(myDirectionX >-0.05 && myDirectionX <0.05)
        myDirectionX = 0;
      if(myDirectionY >-0.05 && myDirectionY <0.05)
        myDirectionY = 0;
    }
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY; 
    //wrap around screen    
    if(myCenterX >width + 8)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0 -8)
    {     
      myCenterX = width + 8;    
    }    
    if(myCenterY >height + 8)
    {    
      myCenterY = 0 -8;    
    } 
    
    else if (myCenterY < 0 - 8)
    {     
      myCenterY = height + 8;    
    }   
  }
  public void turn (double nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    if(keyz[0] == true){
      fill(255,0,0);
      rotate(3*PI/2);
      text("🔥" , -7,-5);
      rotate(-3*PI/2);
    }
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
