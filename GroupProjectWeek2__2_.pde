int currentPage = 0;
int pageSize = 20;

void setup() {
  size(600, 400);
}

void draw() {
  background(30);
  
  fill(255);
  textAlign(CENTER, BOTTOM);
  textSize(20);
  text("Page " + (currentPage + 1), width/2, height - 65);
  text("Showing rows " + (currentPage * pageSize) + " to " + ((currentPage + 1) * pageSize - 1), width/2, height - 40);
  
  drawArrows();
}

void drawArrows() {
  // Left arrow
  fill(currentPage > 0 ? color(70, 130, 255) : color(60));
  triangle(80, height-30, 120, height-55, 120, height-5);

  // Right arrow
  fill(color(70, 130, 255));
  triangle(width-80, height-30, width-120, height-55, width-120, height-5);
}

void mousePressed() {
  // Left arrow hit zone
  if (mouseX > 80 && mouseX < 120 && mouseY > height-55 && mouseY < height-5) {
    currentPage = max(0, currentPage - 1);
  }
  // Right arrow hit zone
  if (mouseX > width-120 && mouseX < width-80 && mouseY > height-55 && mouseY < height-5) {
    currentPage++;
  }
}
