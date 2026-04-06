class UIHandler {
int screenState = 0; // 0 is Home, 1 is Data Table
PImage planeOne;
PImage planeTwo;
PImage planeThree;
PImage logo;
boolean showText;
int lastTime;


UIHandler() { 
planeTwo = loadImage("PlaneTwo.png");
logo = loadImage("logoflight.GIF");
showText = true;
lastTime = 0;
}

void draw() {
if (screenState == 0) {
drawHomeScreen();
} else if (screenState == 1) {
drawDataScreen();
}
}

void drawHomeScreen() {
background(56, 106, 148);
textAlign(CENTER);
fill(150);
image(logo, 250, 150, 900,300);


if (millis() - lastTime >= 750)
{
  showText = !showText;
  lastTime = millis();
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
