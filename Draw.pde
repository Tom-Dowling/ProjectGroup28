void draw() {
  if (mapMode) {
    drawMapMode();
  }
  
  else{
  
  background(255);
  displayHeadings();
  
  fill(0,0,230);
  noStroke();
  rect(0,0,width,height/3); //departure
  
  fill(255);
  noStroke();
  rect(0,height/3,width,height);//search*/

  // Grid
  topBuffer = 300;
  bottomBuffer = 100;
  gridBottom   = height - bottomBuffer;
  collumnWidth      = width / 18.0;
  collumnHeight      = (gridBottom - topBuffer) / 10.0;

  stroke(2);
  strokeWeight(1);

  for (int i = 0; i <= 18; i++) {
    line(i * collumnWidth, topBuffer, i * collumnWidth, gridBottom);
  }
  
  for (int j = 0; j <= 10; j++) {
    line(0, topBuffer + j * collumnHeight, width, topBuffer + j * collumnHeight);
  }

  // Flight data
  ArrayList<DataPoint> flightsToDisplay = getFlightsToDisplay(currentPage);
  drawFlights(flightsToDisplay);

  // Pagination label
  textAlign(CENTER, BOTTOM);
  text("Page " + (currentPage + 1), width/2, height - 65);
  text("Showing rows " + (currentPage * pageSize) + " to " + ((currentPage + 1) * pageSize - 1), width/2, height - 40);

  // UI elements
  drawArrows();
   for (RadioButton btn : buttons) {
    btn.display();
  }
  
  
  
  search.display();//display search bar
  departure.display();//display des bar
  sortMostRecent.display();
  }
}
