void setup() {
  //fullScreen();
  size(1400, 800,P2D);//P2D makes smoother
}

void draw() {
  background(255);
  displayFilters();
  float topOffset = 300;        // grid starts 100 down
  float colW = width / 18.0;   // width of each column
  float colH = (height - topOffset) / 8.0;  // height of each row

  stroke(2);
  strokeWeight(1);

  // Vertical lines (18 lines for 17 spaces)
  for (int i = 0; i <= 18; i++) {
    float x = i * colW;
    line(x, topOffset, x, height);
  }

  // Horizontal lines (11 lines for 10 spaces)
  for (int j = 0; j <= 10; j++) {
    float y = topOffset + j * colH;
    line(0, y, width, y);
  }
}
