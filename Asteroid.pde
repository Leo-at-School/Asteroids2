public class Asteroid extends Floater{
  
  private double rotationSpeed;
  
  public Asteroid(double initX, double initY, double initSpeedX, double initSpeedY, double initOrientation, color initColor, double[][] initVertices, double initRotationSpeed){
    x = initX;
    y = initY;
    speedX = initSpeedX;
    speedY = initSpeedY;
    orientation = initOrientation;
    floaterColor = initColor;
    vertices = initVertices;
    rotationSpeed = initRotationSpeed;
  }
  
  //Update the asteroid's position
  public void move(){
    //Move the asteroid       
    x += speedX;    
    y += speedY;     

    //Wrap around the screen if needed
    if (x > canvasWidth){     
      x = 0;    
    } else if (x < 0){     
      x = canvasWidth;    
    }
    
    if (y > canvasHeight){    
      y = 0;    
    } else if (y < 0){     
      y = canvasHeight;    
    }
    
    turn(rotationSpeed);
  } 
}
