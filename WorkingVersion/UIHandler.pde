class UIHandler {
int screenState = 0; // 0 is Home, 1 is Data Table
PImage planeOne;    // plane image for transition
PImage planeTwo;
PImage planeThree;
PImage logo;
boolean showText;
int lastTime;


UIHandler() { 
planeTwo = loadImage("PlaneTwo.png");  // load in plane image
logo = loadImage("logoflight.GIF");    // load in logo image
showText = true;        // "press enter text"
lastTime = 0;          // timer for flashing text
}

void draw() {
if (screenState == 0) {        // if screen state is home, draw home screen
drawHomeScreen();
} else if (screenState == 1) {    // if screen state is data, draw data screen
drawDataScreen();
}
}

void drawHomeScreen() {
background(56, 106, 148);
textAlign(CENTER);
fill(150);
image(logo, 250, 150, 900,300);


if (millis() - lastTime >= 750)        // if time-the last time is bigger than 750 ms
{
  showText = !showText;        // change show text boolean
  lastTime = millis();        // update last time
}
if (showText)
{
textSize(40);
fill(255, 255, 255);
text("Press ENTER to begin", width/2, height/2 + 120);     
}
}

void planeTransition(int x)
{
image(planeTwo, x, 400, 800,500);
}

void drawDataScreen() {
background(255);
fill(230);
rect(0, 0, width, 60);
fill(0);
textAlign(LEFT);
textSize(18);
text("*Data Query Screen*", 20, 35);
}
}
