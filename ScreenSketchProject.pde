int currentScreen = 0;

void setup() 
{
  size(600,400);
}

void draw() 
{
  if (currentScreen == 0) drawScreen1();
  else if (currentScreen == 1) drawScreen2();
  else if (currentScreen == 2) drawScreen3();
  drawNav(); // draw nav after so it sits on top
}

void drawNav()
{
  String[] labels = {"Screen 1", "Screen2", "Screen3"};
  for (int i = 0; i < 3; i++)
  {
    if (i == currentScreen) fill(70, 130, 255);
    else fill(80);
    rect(i * 200, 0, 200, 40, 4);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(14);
    text(labels[i], i * 200 + 100, 20);
  }
}

void drawScreen1()
{
  background(100, 150, 95);
fill(255);
textAlign(CENTER, CENTER);
textSize(32);
text("Screen 1", width/2, height/2);
}

void drawScreen2()
{
  background(100, 50, 170);
fill(255);
textAlign(CENTER, CENTER);
textSize(32);
text("Screen 2", width/2, height/2);
}

void drawScreen3()
{
  background(50, 50, 180);
fill(255);
textAlign(CENTER, CENTER);
textSize(32);
text("Screen 3", width/2, height/2);
}

void mousePressed()
{
  if (mouseY < 40)
  {
    currentScreen = mouseX / 200;
  }
}
