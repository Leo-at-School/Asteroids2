boolean[] keydownFlags = {false, false, false, false, false, false}; //{W, S, A, D, H, SPACE}
boolean hyperspaceCalled = false; //Ensure hyperspace can only be called once per keydown event

//Set in the constructor and recalculated when h is pressed (when the ship goes into hyperspace)
double globalStarOrientation;
double globalStarSpeed;
double globalStarSpeedX;
double globalStarSpeedY;

//Setup the entire canvas
public void setup(){
  size(800, 600);
  background(0, 0, 0);
  
  playerSetup();
  starSetup();
  asteroidsSetup();
}

//Draw cycle (60 fps)
public void draw(){
  background(0, 0, 0); //Reset canvas
  
  handleKeys();
  handleCollisions();
  
  updateStars();
  updateAsteroids();
  updatePlayer();
  
}

//Toggle boolean values to detect when each key is pressed (toggling boolean values allow for smoother movement)
public void keyPressed(){
  if (key == 'w'){
    keydownFlags[W] = true;
  }
  
  if (key == 's'){
    keydownFlags[S] = true;
  }
  
  if (key == 'a'){
    keydownFlags[A] = true;
  }
  
  if (key == 'd'){
    keydownFlags[D] = true;
  }
  
  if (key == 'h'){
    keydownFlags[H] = true;
  }
  
  if (key == ' '){
    keydownFlags[SPACE] = true;
  }
}

//Toggle boolean values to detect when each key is released (toggling boolean values allow for smoother movement)
public void keyReleased(){
  if (key == 'w'){
    keydownFlags[W] = false;
  }
  
  if (key == 's'){
    keydownFlags[S] = false;
  }
  
  if (key == 'a'){
    keydownFlags[A] = false;
  }
  
  if (key == 'd'){
    keydownFlags[D] = false;
  }
  
  if (key == 'h'){
    keydownFlags[H] = false;
    hyperspaceCalled = false;
  }
  
  if (key == ' '){
    keydownFlags[SPACE] = false;
  }
}

//Call functions associated with each key
public void handleKeys(){
  if (keydownFlags[W]){
    player.accelerate(playerSpeed);
  }
  
  if (keydownFlags[S]){
    player.accelerate(-playerSpeed);
  }
  
  if (keydownFlags[A]){
    player.turn(-playerRotateSpeed);
  }
  
  if (keydownFlags[D]){
    player.turn(playerRotateSpeed);
  }
  
  if (keydownFlags[H] && !hyperspaceCalled){
    player.hyperspace();
    starSetup(); //Create a new background of stars each hyperspace call
    hyperspaceCalled = true;
  }
  
  if (keydownFlags[SPACE]){
    //Shoot
  }
}

public void updatePlayer(){
  player.move();
  player.drawFloater();
}

//Update the stars's positions and draw them
public void updateStars(){
  //Update positions/orientations and draw
  for (int i = 0; i < stars.length; i++){
    stars[i].move(globalStarSpeedX, globalStarSpeedY);
    stars[i].drawStar();
  }
}

//Update the asteroids' positions and draw them
public void updateAsteroids(){
  //Update positions/orientations and draw
  for (int i = 0; i < asteroids.size(); i++){
    asteroids.get(i).move();
    asteroids.get(i).drawFloater();
  }
}


//Remove asteroids if the asteroid is within the player's radius
public void handleCollisions(){
  double playerRadius = player.getRadius();
  double playerX = player.getX();
  double playerY = player.getY();
  ArrayList<Asteroid> temporaryAsteroidList = new ArrayList<Asteroid>();
  
  
  double asteroidX, asteroidY, playerAsteroidDistance;
  Asteroid asteroidObject;
  for (int i  = 0; i < asteroids.size(); i++){
    asteroidObject = asteroids.get(i);
    
    asteroidX = asteroidObject.getX();
    asteroidY = asteroidObject.getY();
    
    playerAsteroidDistance  = Math.sqrt((asteroidX - playerX)*(asteroidX - playerX) + (asteroidY - playerY)*(asteroidY - playerY));
    
    if (playerAsteroidDistance > playerRadius){
      temporaryAsteroidList.add(asteroids.get(i));
    }
  }
  
  asteroids = temporaryAsteroidList;
}
