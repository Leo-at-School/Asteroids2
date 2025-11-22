//Objects
Spaceship player;
Star[] stars = new Star[100];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

//Setup the player class
public void playerSetup(){
  player = new Spaceship(initPlayerX, initPlayerY, initPlayerSpeedX, initPlayerSpeedY, initPlayerOrientation, initPlayerColor, initPlayerVertices); //All variables found in settings file
}

//Setup each star
public void starSetup(){
  //Create a new speed the stars will move in (variables found in AsteroidsGame file)
  globalStarOrientation = Math.random()*Math.PI*2;
  globalStarSpeed = (Math.random() + minStarSpeed)*(maxStarSpeed - minStarSpeed);
  globalStarSpeedX = globalStarSpeed*Math.cos(globalStarOrientation);
  globalStarSpeedY = globalStarSpeed*Math.sin(globalStarOrientation);
  
  double initX, initY, initGlowTime;
  int initRadius;
  color initStarColor;
  
  for (int i = 0; i < stars.length; i++){
    initX = Math.random()*canvasWidth;
    initY = Math.random()*canvasHeight;
    initRadius = (int)Math.ceil(Math.random()*(maxStarRadius) + minStarRadius);
    initStarColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    initGlowTime = Math.random()*7;
    
    stars[i] = new Star(initX, initY, initRadius, initStarColor, initGlowTime);
  }
}

public void asteroidsSetup(){
  double initX, initY, initSpeedX, initSpeedY, initOrientation;
  double[][] initVertices;
  Asteroid newAsteroid;
  
  for (int i = 0; i < maxAsteroids; i++){
    initX = Math.random()*canvasWidth;
    initY = Math.random()*canvasHeight;
    initOrientation = Math.random()*2*Math.PI;
    initSpeedX = (Math.random() + minAsteroidSpeed)*(maxAsteroidSpeed - minAsteroidSpeed)*Math.cos(initOrientation);
    initSpeedY = (Math.random() + minAsteroidSpeed)*(maxAsteroidSpeed - minAsteroidSpeed)*Math.sin(initOrientation);
    initVertices = asteroidSprites[(int)(Math.random()*asteroidSprites.length)]; //Random sprite
    
    newAsteroid = new Asteroid(initX, initY, initSpeedX, initSpeedY, initOrientation, initAsteroidColor, initVertices, asteroidRotateSpeed);
    
    asteroids.add(newAsteroid); //initAsteroidColor & asteroidRotateSpeed found in settings
  }
  
}
