// UIHandler class to manage screen states.

class UIHandler {
int screenState = 0; // 0 is Home, 1 is Data Table

UIHandler() { }

void draw() {
if (screenState == 0) {
drawHomeScreen();
} else {
drawDataScreen();
}
}

void drawHomeScreen() {
background(30, 50, 90);
textAlign(CENTER);
fill(255);
textSize(40);
text("FLIGHT DATA EXPLORER", width/2, height/2 - 50);
textSize(20);
fill(0, 200, 255);
text("Press ENTER to View Flight Records", width/2, height/2 + 20);
fill(150);
text("(Week 8 Demo, Ben)", width/2, height - 40);
}

void drawDataScreen() {
background(255);
fill(230);
rect(0, 0, width, 60);
fill(0);
textAlign(LEFT);
textSize(18);
text("ALL FLIGHTS", 20, 35);
drawLabels();
}

void drawLabels() {
fill(50);
textSize(13);
textAlign(CENTER);
float xStep = width / 18.0;

text("Date", xStep * 0.5, 85);
text("Airline", xStep * 1.5, 85);
text("Origin", xStep * 2.5, 85);
text("Dest", xStep * 3.5, 85);
}}}
