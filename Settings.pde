int canvasWidth = 800;
int canvasHeight = 600;

//Player settings
double playerRotateSpeed = 0.1;
double playerSpeed = 0.5;
double initPlayerX = canvasWidth/2;
double initPlayerY = canvasHeight/2;
double initPlayerSpeedX = 0;
double initPlayerSpeedY = 0;
double initPlayerOrientation = 0;
color initPlayerColor = color(255, 0, 0);
double[][] initPlayerVertices = {{20, 0},                     //{20*cos(0)       , 20*sin(0)}
                                 {-14.1421356, 14.1421356},   //{20*cos(pi*(3/4)), 20*sin(pi*(3/4))}
                                 {-14.1421356, -14.1421356}}; //{20*cos(pi*(3/4)), -20*sin(pi*(3/4))}

//Star settings
double minStarRadius = 1;
double maxStarRadius = 4;
double minStarSpeed = 0.15;
double maxStarSpeed = 0.4;

//Asteroid settings
double maxAsteroids = 20;
double asteroidRotateSpeed = 0.1;
double maxAsteroidSpeed = 2;
double minAsteroidSpeed = 0.5;
color initAsteroidColor = color(125, 125, 125);
double[][][] asteroidSprites = {{{10, 10}, {-10, 10}, {-10, -10}, {10, -10}},
                                {{9.511, 3.09}, {2.245, 3.09}, {0, 10}, {-2.245, 3.09}, {-9.511, 3.09}, {-3.633, -1.18}, {-5.878, -8.09}, {0, -3.82}, {5.878, -8.09}, {3.633, -1.18}}
                               };

//Indices for keydownFlags (In AsteroidsGame file)
int W = 0;
int S = 1;
int A = 2;
int D = 3;
int H = 4;
int SPACE = 5;

//Increase readablity when accessing x and y elements from a 2d array thats stores coordinates
int coordX = 0; //X coordinate index
int coordY = 1; //Y coordinate index
