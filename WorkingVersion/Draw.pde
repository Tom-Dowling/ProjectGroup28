void draw() {
  
  benUI.draw();
benUI.planeTransition(planeX);
if (movePlane)
{
 planeX= planeX-100; 
}


if (benUI.screenState == 1) {

  if (screenState.equals(MAP)) {
    drawMapMode();
  }
  
  else if (screenState.equals(BARCHART)) {
    
    drawBarChart();
    
  }
  
  else{
    drawHome();
  }
}
}

void drawBarChart() {
    String[] ArrivalStates = { "New York", "California", "Washington", "Virginia", "Texas", "Illinois", "Florida", "Hawaii", "Oregon", "New Mexico", "New Jersey"};
    float[]  initialArrivalCounts = { initialNY, initialCA, initialWA, initialVA, initialTX, initialIL, initialFL, initialHI, initialOR, initialNM, initialNJ};
    float[]  filteredArrivalCounts = { NY, CA, WA, VA, TX, IL, FL, HI, OR, NM, NJ};


    String[] departureDates    = { "Jan 1", "Jan 2", "Jan 3", "Jan 4", "Jan 5", "Jan 6"};
    float[]  initialDateCounts   = { initialJan1, initialJan2, initialJan3, initialJan4, initialJan5, initialJan6};
    float[]  filteredDateCounts   = { jan1, jan2, jan3, jan4, jan5, jan6};
    
    background(255);
    returnFromBarChart.display();
    
    if (currentBarChart == 1) {
      if (!filterSelected) drawBarChart(initialArrivalCounts, ArrivalStates, "Flights per Destination", color(52, 120, 200));
      else drawBarChart(filteredArrivalCounts, ArrivalStates, "Flights per destination", color(52, 120, 200));
    } 
    else if (currentBarChart == 2) {
      if (!filterSelected) drawBarChart(initialDateCounts, departureDates, "Flights per date of departure", color(40, 170, 120));
      else drawBarChart(filteredDateCounts, departureDates, "Flights per date of departure", color(40, 170, 120));
    }

  // Keyboard hint at the bottom
    fill(160);
    textSize(11);
    textAlign(CENTER, BOTTOM);
    noStroke();
    text("Press 1 = Destination  |   2 = Date", width / 2, height - 6);
}

void drawHome() {
  
  background(255);


  fill(0, 0, 230);
  noStroke();
  rect(0, 0, width, height/3); //departure

  fill(255);
  noStroke();
  rect(0, height/3, width, height);//search*/

  // Grid
  topBuffer = 300;
  bottomBuffer = 100;
  gridBottom   = height - bottomBuffer;
  collumnWidth      = width / 18;
  collumnHeight      = (gridBottom - topBuffer) / 10;

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
  displayHeadings();



  search.display();//display search bar
  departure.display();//display des bar
  sortMostRecent.display();
  barChartScreen.display();
}
