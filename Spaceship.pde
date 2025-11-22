public class Spaceship extends Floater{
  double radius;
  
  public Spaceship(double initX, double initY, double initSpeedX, double initSpeedY, double initOrientation, color initColor, double[][] initVertices){
    x = initX;
    y = initY;
    speedX = initSpeedX;
    speedY = initSpeedY;
    orientation = initOrientation;
    floaterColor = initColor;
    vertices = initVertices;
    
    calculateRadius();
  }
  
  private void calculateRadius(){
    double vertexX, vertexY;
    for (int coord = 0; coord < vertices.length; coord++){
      vertexX = vertices[coord][coordX];
      vertexY = vertices[coord][coordY];
      radius = Math.max(radius, Math.sqrt(vertexX*vertexX + vertexY*vertexY));
    }
  }
  
  //Give a new random position and orientation while resetting speed
  public void hyperspace(){
    //Make sure ship doesn't spawn warping around the screen (ship's max radius is 20)
    x = Math.random()*(canvasWidth - 40) + 20;
    y = Math.random()*(canvasHeight - 40) + 20;
    
    speedX = 0;
    speedY = 0;
    
    orientation = Math.random()*2*Math.PI;
  }
  
  //Shoot a projectile from the spaceship
  public void shoot(){
    //Later
  }
  
  public double getRadius(){
    return radius;
  }
}
